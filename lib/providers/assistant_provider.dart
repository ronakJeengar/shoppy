import 'package:flutter/material.dart';
import 'package:shopp_app/data/models/assistant_message_model.dart';
import 'package:shopp_app/data/repositories/ai_repository.dart';
import 'package:shopp_app/views/cart_page.dart';
import 'package:shopp_app/views/order_detail_page.dart';
import 'package:shopp_app/views/orders_page.dart';
import 'package:shopp_app/views/product_detail_page.dart';
import 'package:shopp_app/views/profile_page.dart';
import 'package:shopp_app/views/search_page.dart';
import 'package:shopp_app/views/wishlist_page.dart';

class AssistantProvider extends ChangeNotifier {
  final AiRepository _aiRepository;

  AssistantProvider({AiRepository? aiRepository})
      : _aiRepository = aiRepository ?? AiRepository();

  final List<AssistantMessageModel> _messages = [];
  String? _activeConversationId;
  bool _isLoading = false;
  String? _errorMessage;

  final List<String> _suggestedPrompts = [
    "Find wireless headphones under \$200",
    "What is your return & refund policy?",
    "What is currently in my cart?",
    "Track my latest order status",
  ];

  List<AssistantMessageModel> get messages => List.unmodifiable(_messages);
  String? get activeConversationId => _activeConversationId;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  List<String> get suggestedPrompts => List.unmodifiable(_suggestedPrompts);

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  void startNewConversation() {
    _messages.clear();
    _activeConversationId = null;
    _errorMessage = null;
    _isLoading = false;
    notifyListeners();
  }

  void addMessage(AssistantMessageModel message) {
    _messages.add(message);
    notifyListeners();
  }

  Future<void> sendMessage(String text, {BuildContext? context}) async {
    final trimmed = text.trim();
    if (trimmed.isEmpty || _isLoading) return;

    _errorMessage = null;

    // 1. Optimistic user message addition
    final userMessage = AssistantMessageModel(
      id: 'usr_${DateTime.now().millisecondsSinceEpoch}',
      role: 'user',
      content: trimmed,
    );
    _messages.add(userMessage);
    _isLoading = true;
    notifyListeners();

    // 2. Call conversational AI endpoint
    final response = await _aiRepository.chatWithAssistant(
      message: trimmed,
      conversationId: _activeConversationId,
    );

    if (response.status && response.data is AssistantChatResponseModel) {
      final chatData = response.data as AssistantChatResponseModel;
      _activeConversationId = chatData.conversationId;

      final assistantMessage = AssistantMessageModel(
        id: 'ast_${DateTime.now().millisecondsSinceEpoch}',
        role: 'assistant',
        content: chatData.message,
        pendingConfirmation: chatData.pendingConfirmation,
        products: chatData.products,
        sources: chatData.sources,
        actions: chatData.actions,
      );
      _messages.add(assistantMessage);
    } else {
      _errorMessage = response.message;
      final fallbackErrorMsg = AssistantMessageModel(
        id: 'err_${DateTime.now().millisecondsSinceEpoch}',
        role: 'assistant',
        content: "Sorry, I encountered an issue: ${response.message}. Please try again.",
      );
      _messages.add(fallbackErrorMsg);
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> confirmPendingAction(String confirmationId, {BuildContext? context}) async {
    if (_isLoading || confirmationId.isEmpty) return;
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    final response = await _aiRepository.confirmAction(
      confirmationId: confirmationId,
      conversationId: _activeConversationId,
    );

    if (response.status) {
      final successMsg = AssistantMessageModel(
        id: 'ast_cf_${DateTime.now().millisecondsSinceEpoch}',
        role: 'assistant',
        content: response.message.isNotEmpty
            ? response.message
            : "Action confirmed and successfully executed.",
      );
      _messages.add(successMsg);
      if (context != null && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response.message.isNotEmpty
                ? response.message
                : "Action confirmed successfully"),
            backgroundColor: Colors.green,
          ),
        );
      }
    } else {
      _errorMessage = response.message;
      if (context != null && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response.message),
            backgroundColor: Colors.red,
          ),
        );
      }
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> cancelPendingAction(String confirmationId, {BuildContext? context}) async {
    if (_isLoading || confirmationId.isEmpty) return;
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    final response = await _aiRepository.cancelAction(
      confirmationId: confirmationId,
      conversationId: _activeConversationId,
    );

    if (response.status) {
      final cancelMsg = AssistantMessageModel(
        id: 'ast_cn_${DateTime.now().millisecondsSinceEpoch}',
        role: 'assistant',
        content: "The action proposal has been cancelled.",
      );
      _messages.add(cancelMsg);
      if (context != null && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Action cancelled")),
        );
      }
    } else {
      _errorMessage = response.message;
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> loadConversation(String conversationId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    final response = await _aiRepository.getConversation(conversationId);
    if (response.status && response.data is List<AssistantMessageModel>) {
      _messages.clear();
      _messages.addAll(response.data as List<AssistantMessageModel>);
      _activeConversationId = conversationId;
    } else {
      _errorMessage = response.message;
    }

    _isLoading = false;
    notifyListeners();
  }

  void executeAction(AssistantActionModel action, BuildContext context) {
    final payload = action.payload;

    switch (action.type) {
      case 'CONFIRM_ACTION':
        final confId = payload['confirmationId']?.toString() ?? '';
        if (confId.isNotEmpty) {
          confirmPendingAction(confId, context: context);
        }
        break;

      case 'CANCEL_ACTION':
        final confId = payload['confirmationId']?.toString() ?? '';
        if (confId.isNotEmpty) {
          cancelPendingAction(confId, context: context);
        }
        break;

      case 'OPEN_PRODUCT':
        final productId = payload['productId']?.toString() ?? '';
        final prod = AssistantProductCardModel(
          id: productId,
          name: action.label.replaceFirst('View ', ''),
          price: 0.0,
          inStock: true,
        ).toProduct();

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailPage(product: prod),
          ),
        );
        break;

      case 'OPEN_SEARCH':
        final query = payload['query']?.toString() ?? '';
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => SearchPage(initialQuery: query),
          ),
        );
        break;

      case 'OPEN_CART':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const CartPage(),
          ),
        );
        break;

      case 'OPEN_WISHLIST':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const WishlistPage(),
          ),
        );
        break;

      case 'OPEN_PROFILE':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const ProfilePage(),
          ),
        );
        break;

      case 'OPEN_ORDER':
        final orderId = payload['orderId']?.toString() ?? '';
        if (orderId.isNotEmpty) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => OrderDetailPage(orderId: orderId),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const OrdersPage(),
            ),
          );
        }
        break;

      case 'OPEN_ORDERS':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const OrdersPage(),
          ),
        );
        break;

      default:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Action: ${action.label}")),
        );
    }
  }
}
