import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../core/network/api_client.dart';
import '../../../../data/models/ai_config_model.dart';
import '../../../../data/models/assistant_message_model.dart';
import '../../data/datasources/ai_remote_datasource.dart';
import '../../data/repositories/ai_repository_impl.dart';
import '../../domain/repositories/ai_repository.dart';
import '../../domain/usecases/ai_usecases.dart';

final aiRemoteDataSourceProvider = Provider<AiRemoteDataSource>((ref) {
  final client = ref.watch(apiClientProvider);
  return AiRemoteDataSourceImpl(client);
});

final aiRepositoryProvider = Provider<AiRepository>((ref) {
  final remote = ref.watch(aiRemoteDataSourceProvider);
  return AiRepositoryImpl(remote);
});

final getAiHealthUseCaseProvider = Provider<GetAiHealthUseCase>((ref) {
  return GetAiHealthUseCase(ref.watch(aiRepositoryProvider));
});

final chatWithAssistantUseCaseProvider =
    Provider<ChatWithAssistantUseCase>((ref) {
  return ChatWithAssistantUseCase(ref.watch(aiRepositoryProvider));
});

final confirmAiActionUseCaseProvider = Provider<ConfirmAiActionUseCase>((ref) {
  return ConfirmAiActionUseCase(ref.watch(aiRepositoryProvider));
});

final cancelAiActionUseCaseProvider = Provider<CancelAiActionUseCase>((ref) {
  return CancelAiActionUseCase(ref.watch(aiRepositoryProvider));
});

final aiHealthProvider = FutureProvider<AiHealthModel>((ref) async {
  final useCase = ref.watch(getAiHealthUseCaseProvider);
  final result = await useCase();
  return result.fold(
    onSuccess: (health) => health,
    onFailure: (failure) => throw Exception(failure.message),
  );
});

class AssistantState {
  final List<AssistantMessageModel> messages;
  final String? activeConversationId;
  final bool isLoading;
  final AssistantConfirmationModel? pendingConfirmation;
  final String? errorMessage;
  final List<String> suggestedPrompts;

  const AssistantState({
    this.messages = const [],
    this.activeConversationId,
    this.isLoading = false,
    this.pendingConfirmation,
    this.errorMessage,
    this.suggestedPrompts = const [
      "Find wireless headphones under \$200",
      "What is your return & refund policy?",
      "What is currently in my cart?",
      "Track my latest order status",
    ],
  });

  AssistantState copyWith({
    List<AssistantMessageModel>? messages,
    String? activeConversationId,
    bool? isLoading,
    AssistantConfirmationModel? pendingConfirmation,
    bool clearConfirmation = false,
    String? errorMessage,
    bool clearError = false,
  }) {
    return AssistantState(
      messages: messages ?? this.messages,
      activeConversationId: activeConversationId ?? this.activeConversationId,
      isLoading: isLoading ?? this.isLoading,
      pendingConfirmation: clearConfirmation
          ? null
          : (pendingConfirmation ?? this.pendingConfirmation),
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
      suggestedPrompts: suggestedPrompts,
    );
  }
}

class AssistantNotifier extends StateNotifier<AssistantState> {
  final ChatWithAssistantUseCase _chatUseCase;
  final ConfirmAiActionUseCase _confirmUseCase;
  final CancelAiActionUseCase _cancelUseCase;

  AssistantNotifier({
    required ChatWithAssistantUseCase chatUseCase,
    required ConfirmAiActionUseCase confirmUseCase,
    required CancelAiActionUseCase cancelUseCase,
  })  : _chatUseCase = chatUseCase,
        _confirmUseCase = confirmUseCase,
        _cancelUseCase = cancelUseCase,
        super(const AssistantState());

  void clearError() {
    state = state.copyWith(clearError: true);
  }

  void startNewConversation() {
    state = const AssistantState();
  }

  Future<void> sendMessage(String text) async {
    final trimmed = text.trim();
    if (trimmed.isEmpty || state.isLoading) return;

    final userMessage = AssistantMessageModel(
      id: 'usr_${DateTime.now().millisecondsSinceEpoch}',
      role: 'user',
      content: trimmed,
    );

    state = state.copyWith(
      messages: [...state.messages, userMessage],
      isLoading: true,
      clearError: true,
    );

    final result = await _chatUseCase(
      message: trimmed,
      conversationId: state.activeConversationId,
    );

    result.fold(
      onSuccess: (chatData) {
        final assistantMessage = AssistantMessageModel(
          id: 'ast_${DateTime.now().millisecondsSinceEpoch}',
          role: 'assistant',
          content: chatData.message,
          pendingConfirmation: chatData.pendingConfirmation,
          products: chatData.products,
          sources: chatData.sources,
          actions: chatData.actions,
        );

        state = state.copyWith(
          messages: [...state.messages, assistantMessage],
          activeConversationId: chatData.conversationId,
          pendingConfirmation: chatData.pendingConfirmation,
          isLoading: false,
        );
      },
      onFailure: (failure) {
        final fallbackErrorMsg = AssistantMessageModel(
          id: 'err_${DateTime.now().millisecondsSinceEpoch}',
          role: 'assistant',
          content:
              "Sorry, I encountered an issue: ${failure.message}. Please try again.",
        );
        state = state.copyWith(
          messages: [...state.messages, fallbackErrorMsg],
          errorMessage: failure.message,
          isLoading: false,
        );
      },
    );
  }

  Future<bool> confirmPendingAction() async {
    final conf = state.pendingConfirmation;
    if (conf == null) return false;

    state = state.copyWith(isLoading: true, clearError: true);
    final result = await _confirmUseCase(
      confirmationId: conf.confirmationId,
      conversationId: state.activeConversationId,
    );

    return result.fold(
      onSuccess: (_) {
        final successMsg = AssistantMessageModel(
          id: 'ast_${DateTime.now().millisecondsSinceEpoch}',
          role: 'assistant',
          content: 'Action completed successfully: ${conf.summary}',
        );
        state = state.copyWith(
          messages: [...state.messages, successMsg],
          isLoading: false,
          clearConfirmation: true,
        );
        return true;
      },
      onFailure: (failure) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: failure.message,
          clearConfirmation: true,
        );
        return false;
      },
    );
  }

  Future<void> cancelPendingAction() async {
    final conf = state.pendingConfirmation;
    if (conf != null) {
      await _cancelUseCase(
        confirmationId: conf.confirmationId,
        conversationId: state.activeConversationId,
      );
    }
    state = state.copyWith(clearConfirmation: true);
  }
}

final assistantNotifierProvider =
    StateNotifierProvider<AssistantNotifier, AssistantState>((ref) {
  return AssistantNotifier(
    chatUseCase: ref.watch(chatWithAssistantUseCaseProvider),
    confirmUseCase: ref.watch(confirmAiActionUseCaseProvider),
    cancelUseCase: ref.watch(cancelAiActionUseCaseProvider),
  );
});
