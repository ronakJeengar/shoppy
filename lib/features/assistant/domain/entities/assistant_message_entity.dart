import 'package:freezed_annotation/freezed_annotation.dart';

part 'assistant_message_entity.freezed.dart';

@freezed
abstract class AssistantProductCardEntity with _$AssistantProductCardEntity {
  const factory AssistantProductCardEntity({
    required String id,
    required String name,
    required double price,
    required bool inStock,
    @Default(0) int stockCount,
    @Default(0.0) double rating,
    @Default('Shoppy Verified') String seller,
    @Default('') String productImage,
    @Default('') String description,
  }) = _AssistantProductCardEntity;
}

@freezed
abstract class AssistantSourceEntity with _$AssistantSourceEntity {
  const factory AssistantSourceEntity({
    required String chunkId,
    required String title,
    @Default('') String section,
    @Default('POLICY') String sourceType,
    @Default('') String content,
    Map<String, dynamic>? citation,
  }) = _AssistantSourceEntity;
}

@freezed
abstract class AssistantActionEntity with _$AssistantActionEntity {
  const factory AssistantActionEntity({
    required String type,
    required String label,
    @Default({}) Map<String, dynamic> payload,
  }) = _AssistantActionEntity;
}

@freezed
abstract class AssistantConfirmationEntity with _$AssistantConfirmationEntity {
  const factory AssistantConfirmationEntity({
    required String confirmationId,
    required String action,
    required String summary,
    String? orderId,
    String? orderNumber,
    double? totalAmount,
    @Default('USD') String currency,
    @Default({}) Map<String, dynamic> details,
  }) = _AssistantConfirmationEntity;
}

@freezed
abstract class AssistantMessageEntity with _$AssistantMessageEntity {
  const AssistantMessageEntity._();

  const factory AssistantMessageEntity({
    required String id,
    required String role,
    required String content,
    AssistantConfirmationEntity? pendingConfirmation,
    @Default([]) List<AssistantProductCardEntity> products,
    @Default([]) List<AssistantSourceEntity> sources,
    @Default([]) List<AssistantActionEntity> actions,
    DateTime? timestamp,
  }) = _AssistantMessageEntity;

  bool get isUser => role == 'user';
  bool get hasProducts => products.isNotEmpty;
  bool get hasSources => sources.isNotEmpty;
  bool get hasActions => actions.isNotEmpty;
  bool get hasPendingConfirmation => pendingConfirmation != null;
}

@freezed
abstract class AssistantChatResponseEntity with _$AssistantChatResponseEntity {
  const factory AssistantChatResponseEntity({
    required String conversationId,
    required String message,
    required String answer,
    AssistantConfirmationEntity? pendingConfirmation,
    @Default([]) List<AssistantProductCardEntity> products,
    @Default([]) List<AssistantSourceEntity> sources,
    @Default([]) List<AssistantActionEntity> actions,
    required String requestId,
  }) = _AssistantChatResponseEntity;
}

@freezed
abstract class AssistantConversationSummaryEntity with _$AssistantConversationSummaryEntity {
  const factory AssistantConversationSummaryEntity({
    required String id,
    required String title,
    required String status,
    required int messageCount,
    required String lastMessage,
    DateTime? updatedAt,
  }) = _AssistantConversationSummaryEntity;
}
