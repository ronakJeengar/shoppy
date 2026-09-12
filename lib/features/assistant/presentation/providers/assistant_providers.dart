import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopp_app/core/utils/result.dart';
import 'package:shopp_app/features/assistant/domain/entities/assistant_message_entity.dart';
import 'package:shopp_app/features/assistant/data/models/assistant_message_model.dart';
import 'package:shopp_app/features/assistant/data/mappers/assistant_mappers.dart';
import 'package:shopp_app/features/ai/domain/repositories/ai_repository.dart';
import 'package:shopp_app/features/ai/presentation/providers/ai_providers.dart';
import 'package:shopp_app/features/cart/presentation/screens/cart_page.dart';
import 'package:shopp_app/features/orders/presentation/screens/order_detail_page.dart';
import 'package:shopp_app/features/orders/presentation/screens/orders_page.dart';
import 'package:shopp_app/features/catalog/presentation/screens/product_detail_page.dart';
import 'package:shopp_app/features/profile/presentation/screens/profile_page.dart';
import 'package:shopp_app/features/search/presentation/screens/search_page.dart';
import 'package:shopp_app/features/wishlist/presentation/screens/wishlist_page.dart';

class AssistantState {
  final List<AssistantMessageModel> messages;
  final String? activeConversationId;
  final bool isLoading;
  final String? errorMessage;
  final List<String> suggestedPrompts;

  const AssistantState({
    this.messages = const [],
    this.activeConversationId,
    this.isLoading = false,
    this.errorMessage,
    this.suggestedPrompts = const [
      "Find wireless headphones under ₹2,000",
      "What is your return & refund policy?",
      "What is currently in my cart?",
      "Track my latest order status",
    ],
  });

  AssistantState copyWith({
    List<AssistantMessageModel>? messages,
    String? activeConversationId,
    bool clearActiveConversationId = false,
    bool? isLoading,
    String? errorMessage,
    bool clearErrorMessage = false,
    List<String>? suggestedPrompts,
  }) {
    return AssistantState(
      messages: messages ?? this.messages,
      activeConversationId: clearActiveConversationId
          ? null
          : (activeConversationId ?? this.activeConversationId),
      isLoading: isLoading ?? this.isLoading,
      errorMessage:
          clearErrorMessage ? null : (errorMessage ?? this.errorMessage),
      suggestedPrompts: suggestedPrompts ?? this.suggestedPrompts,
    );
  }
}

class AssistantNotifier extends StateNotifier<AssistantState> {
  final AiRepository _aiRepository;

  AssistantNotifier(this._aiRepository) : super(const AssistantState());

  void clearError() {
    state = state.copyWith(clearErrorMessage: true);
  }

  void startNewConversation() {
    state = const AssistantState();
  }

  void addMessage(AssistantMessageModel message) {
    state = state.copyWith(
      messages: [...state.messages, message],
    );
  }

  Future<void> sendMessage(String text) async {
    final trimmed = text.trim();
    if (trimmed.isEmpty || state.isLoading) return;

    final userMessage = AssistantMessageModel(
      id: 'usr_${DateTime.now().millisecondsSinceEpoch}',
      role: 'user',
      content: trimmed,
      timestamp: DateTime.now(),
    );

    state = state.copyWith(
      messages: [...state.messages, userMessage],
      isLoading: true,
      clearErrorMessage: true,
    );

    final response = await _aiRepository.chatWithAssistant(
      message: trimmed,
      conversationId: state.activeConversationId,
    );

    if (response is Success<AssistantChatResponseEntity>) {
      final chatData = response.data.toModel();
      final assistantMessage = AssistantMessageModel(
        id: 'ast_${DateTime.now().millisecondsSinceEpoch}',
        role: 'assistant',
        content: chatData.message,
        pendingConfirmation: chatData.pendingConfirmation,
        products: chatData.products,
        sources: chatData.sources,
        actions: chatData.actions,
        timestamp: DateTime.now(),
      );

      state = state.copyWith(
        activeConversationId: chatData.conversationId,
        messages: [...state.messages, assistantMessage],
        isLoading: false,
      );
    } else {
      final fallbackErrorMsg = AssistantMessageModel(
        id: 'err_${DateTime.now().millisecondsSinceEpoch}',
        role: 'assistant',
        content:
            "Sorry, I encountered an issue: ${response.failureOrNull?.message ?? 'An error occurred'}. Please try again.",
        timestamp: DateTime.now(),
      );

      state = state.copyWith(
        errorMessage: response.failureOrNull?.message,
        messages: [...state.messages, fallbackErrorMsg],
        isLoading: false,
      );
    }
  }

  Future<bool> confirmPendingAction(String confirmationId) async {
    if (state.isLoading || confirmationId.isEmpty) return false;

    state = state.copyWith(isLoading: true, clearErrorMessage: true);

    final response = await _aiRepository.confirmAction(
      confirmationId: confirmationId,
      conversationId: state.activeConversationId,
    );

    if (response is Success<bool> && response.data) {
      final successMsg = AssistantMessageModel(
        id: 'ast_cf_${DateTime.now().millisecondsSinceEpoch}',
        role: 'assistant',
        content: "Action confirmed and successfully executed.",
        timestamp: DateTime.now(),
      );

      state = state.copyWith(
        messages: [...state.messages, successMsg],
        isLoading: false,
      );
      return true;
    } else {
      state = state.copyWith(
        errorMessage: response.failureOrNull?.message,
        isLoading: false,
      );
      return false;
    }
  }

  Future<bool> cancelPendingAction(String confirmationId) async {
    if (state.isLoading || confirmationId.isEmpty) return false;

    state = state.copyWith(isLoading: true, clearErrorMessage: true);

    final response = await _aiRepository.cancelAction(
      confirmationId: confirmationId,
      conversationId: state.activeConversationId,
    );

    if (response is Success<bool> && response.data) {
      final cancelMsg = AssistantMessageModel(
        id: 'ast_cn_${DateTime.now().millisecondsSinceEpoch}',
        role: 'assistant',
        content: "The action proposal has been cancelled.",
        timestamp: DateTime.now(),
      );

      state = state.copyWith(
        messages: [...state.messages, cancelMsg],
        isLoading: false,
      );
      return true;
    } else {
      state = state.copyWith(
        errorMessage: response.failureOrNull?.message,
        isLoading: false,
      );
      return false;
    }
  }

  Future<void> loadConversation(String conversationId) async {
    state = state.copyWith(isLoading: true, clearErrorMessage: true);

    final response = await _aiRepository.getConversation(conversationId);
    if (response is Success<List<AssistantMessageEntity>>) {
      final models = response.data.map((e) => e.toModel()).toList();
      state = state.copyWith(
        messages: models,
        activeConversationId: conversationId,
        isLoading: false,
      );
    } else {
      state = state.copyWith(
        errorMessage: response.failureOrNull?.message,
        isLoading: false,
      );
    }
  }

  void executeAction(AssistantActionModel action, BuildContext context) {
    final payload = action.payload;

    switch (action.type) {
      case 'CONFIRM_ACTION':
        final confId = payload['confirmationId']?.toString() ?? '';
        if (confId.isNotEmpty) {
          confirmPendingAction(confId);
        }
        break;

      case 'CANCEL_ACTION':
        final confId = payload['confirmationId']?.toString() ?? '';
        if (confId.isNotEmpty) {
          cancelPendingAction(confId);
        }
        break;

      case 'OPEN_PRODUCT':
        final productId = payload['productId']?.toString() ?? '';
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailPage(productId: productId),
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

final assistantNotifierProvider =
    StateNotifierProvider<AssistantNotifier, AssistantState>((ref) {
  return AssistantNotifier(ref.watch(aiRepositoryProvider));
});
