import '../models/assistant_message_model.dart';
import '../../domain/entities/assistant_message_entity.dart';

extension AssistantProductCardModelMapper on AssistantProductCardModel {
  AssistantProductCardEntity toEntity() {
    return AssistantProductCardEntity(
      id: id,
      name: name,
      price: price,
      inStock: inStock,
      stockCount: stockCount,
      rating: rating,
      seller: seller,
      productImage: productImage,
      description: description,
    );
  }
}

extension AssistantProductCardEntityMapper on AssistantProductCardEntity {
  AssistantProductCardModel toModel() {
    return AssistantProductCardModel(
      id: id,
      name: name,
      price: price,
      inStock: inStock,
      stockCount: stockCount,
      rating: rating,
      seller: seller,
      productImage: productImage,
      description: description,
    );
  }
}

extension AssistantSourceModelMapper on AssistantSourceModel {
  AssistantSourceEntity toEntity() {
    return AssistantSourceEntity(
      chunkId: chunkId,
      title: title,
      section: section,
      sourceType: sourceType,
      content: content,
      citation: citation,
    );
  }
}

extension AssistantSourceEntityMapper on AssistantSourceEntity {
  AssistantSourceModel toModel() {
    return AssistantSourceModel(
      chunkId: chunkId,
      title: title,
      section: section,
      sourceType: sourceType,
      content: content,
      citation: citation,
    );
  }
}

extension AssistantActionModelMapper on AssistantActionModel {
  AssistantActionEntity toEntity() {
    return AssistantActionEntity(
      type: type,
      label: label,
      payload: payload,
    );
  }
}

extension AssistantActionEntityMapper on AssistantActionEntity {
  AssistantActionModel toModel() {
    return AssistantActionModel(
      type: type,
      label: label,
      payload: payload,
    );
  }
}

extension AssistantConfirmationModelMapper on AssistantConfirmationModel {
  AssistantConfirmationEntity toEntity() {
    return AssistantConfirmationEntity(
      confirmationId: confirmationId,
      action: action,
      summary: summary,
      orderId: orderId,
      orderNumber: orderNumber,
      totalAmount: totalAmount,
      currency: currency,
      details: details,
    );
  }
}

extension AssistantConfirmationEntityMapper on AssistantConfirmationEntity {
  AssistantConfirmationModel toModel() {
    return AssistantConfirmationModel(
      confirmationId: confirmationId,
      action: action,
      summary: summary,
      orderId: orderId,
      orderNumber: orderNumber,
      totalAmount: totalAmount,
      currency: currency,
      details: details,
    );
  }
}

extension AssistantMessageModelMapper on AssistantMessageModel {
  AssistantMessageEntity toEntity() {
    return AssistantMessageEntity(
      id: id,
      role: role,
      content: content,
      pendingConfirmation: pendingConfirmation?.toEntity(),
      products: products.map((p) => p.toEntity()).toList(),
      sources: sources.map((s) => s.toEntity()).toList(),
      actions: actions.map((a) => a.toEntity()).toList(),
      timestamp: timestamp,
    );
  }
}

extension AssistantMessageEntityMapper on AssistantMessageEntity {
  AssistantMessageModel toModel() {
    return AssistantMessageModel(
      id: id,
      role: role,
      content: content,
      pendingConfirmation: pendingConfirmation?.toModel(),
      products: products.map((p) => p.toModel()).toList(),
      sources: sources.map((s) => s.toModel()).toList(),
      actions: actions.map((a) => a.toModel()).toList(),
      timestamp: timestamp,
    );
  }
}

extension AssistantChatResponseModelMapper on AssistantChatResponseModel {
  AssistantChatResponseEntity toEntity() {
    return AssistantChatResponseEntity(
      conversationId: conversationId,
      message: message,
      answer: answer,
      pendingConfirmation: pendingConfirmation?.toEntity(),
      products: products.map((p) => p.toEntity()).toList(),
      sources: sources.map((s) => s.toEntity()).toList(),
      actions: actions.map((a) => a.toEntity()).toList(),
      requestId: requestId,
    );
  }
}

extension AssistantChatResponseEntityMapper on AssistantChatResponseEntity {
  AssistantChatResponseModel toModel() {
    return AssistantChatResponseModel(
      conversationId: conversationId,
      message: message,
      answer: answer,
      pendingConfirmation: pendingConfirmation?.toModel(),
      products: products.map((p) => p.toModel()).toList(),
      sources: sources.map((s) => s.toModel()).toList(),
      actions: actions.map((a) => a.toModel()).toList(),
      requestId: requestId,
    );
  }
}

extension AssistantConversationSummaryModelMapper on AssistantConversationSummaryModel {
  AssistantConversationSummaryEntity toEntity() {
    return AssistantConversationSummaryEntity(
      id: id,
      title: title,
      status: status,
      messageCount: messageCount,
      lastMessage: lastMessage,
      updatedAt: updatedAt,
    );
  }
}

extension AssistantConversationSummaryEntityMapper on AssistantConversationSummaryEntity {
  AssistantConversationSummaryModel toModel() {
    return AssistantConversationSummaryModel(
      id: id,
      title: title,
      status: status,
      messageCount: messageCount,
      lastMessage: lastMessage,
      updatedAt: updatedAt,
    );
  }
}
