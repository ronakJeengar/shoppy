import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopp_app/features/catalog/data/models/product_model.dart';

part 'assistant_message_model.freezed.dart';

@freezed
abstract class AssistantProductCardModel with _$AssistantProductCardModel {
  const AssistantProductCardModel._();

  const factory AssistantProductCardModel({
    required String id,
    required String name,
    required double price,
    required bool inStock,
    @Default(0) int stockCount,
    @Default(0.0) double rating,
    @Default('Shoppy Verified') String seller,
    @Default('') String productImage,
    @Default('') String description,
  }) = _AssistantProductCardModel;

  factory AssistantProductCardModel.fromJson(Map<String, dynamic> json) {
    final num rawPrice = json['price'] is num ? json['price'] as num : 0;
    final num rawRating = json['rating'] is num ? json['rating'] as num : 0;
    final int rawStock = json['stockCount'] is int
        ? json['stockCount'] as int
        : (int.tryParse(json['stockCount']?.toString() ?? '0') ?? 0);

    return AssistantProductCardModel(
      id: (json['id'] ?? json['_id'] ?? '').toString(),
      name: (json['name'] ?? json['productName'] ?? 'Product').toString(),
      price: rawPrice.toDouble(),
      inStock: json['inStock'] != false,
      stockCount: rawStock,
      rating: rawRating.toDouble(),
      seller: (json['seller'] ?? json['sellerName'] ?? 'Shoppy Verified').toString(),
      productImage: (json['productImage'] ?? json['imageUrl'] ?? '').toString(),
      description: (json['description'] ?? '').toString(),
    );
  }

  Product toProduct() {
    return Product(
      id: id,
      productName: name,
      price: price,
      stock: stockCount,
      productRating: rating,
      sellerName: seller,
      productImage: productImage,
      description: description,
      isActive: inStock,
    );
  }
}

extension AssistantProductCardModelX on AssistantProductCardModel {
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'inStock': inStock,
      'stockCount': stockCount,
      'rating': rating,
      'seller': seller,
      'productImage': productImage,
      'description': description,
    };
  }
}

@freezed
abstract class AssistantSourceModel with _$AssistantSourceModel {
  const factory AssistantSourceModel({
    required String chunkId,
    required String title,
    @Default('') String section,
    @Default('POLICY') String sourceType,
    @Default('') String content,
    Map<String, dynamic>? citation,
  }) = _AssistantSourceModel;

  factory AssistantSourceModel.fromJson(Map<String, dynamic> json) {
    return AssistantSourceModel(
      chunkId: (json['chunkId'] ?? json['id'] ?? '').toString(),
      title: (json['title'] ?? 'Shoppy Knowledge').toString(),
      section: (json['section'] ?? '').toString(),
      sourceType: (json['sourceType'] ?? 'POLICY').toString(),
      content: (json['content'] ?? '').toString(),
      citation: json['citation'] is Map<String, dynamic>
          ? json['citation'] as Map<String, dynamic>
          : null,
    );
  }
}

extension AssistantSourceModelX on AssistantSourceModel {
  Map<String, dynamic> toJson() {
    return {
      'chunkId': chunkId,
      'title': title,
      'section': section,
      'sourceType': sourceType,
      'content': content,
      'citation': citation,
    };
  }
}

@freezed
abstract class AssistantActionModel with _$AssistantActionModel {
  const factory AssistantActionModel({
    required String type,
    required String label,
    @Default({}) Map<String, dynamic> payload,
  }) = _AssistantActionModel;

  factory AssistantActionModel.fromJson(Map<String, dynamic> json) {
    return AssistantActionModel(
      type: (json['type'] ?? 'INFO').toString(),
      label: (json['label'] ?? 'Action').toString(),
      payload: json['payload'] is Map<String, dynamic>
          ? Map<String, dynamic>.from(json['payload'] as Map)
          : {},
    );
  }
}

extension AssistantActionModelX on AssistantActionModel {
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'label': label,
      'payload': payload,
    };
  }
}

@freezed
abstract class AssistantConfirmationModel with _$AssistantConfirmationModel {
  const factory AssistantConfirmationModel({
    required String confirmationId,
    required String action,
    required String summary,
    String? orderId,
    String? orderNumber,
    double? totalAmount,
    @Default('INR') String currency,
    @Default({}) Map<String, dynamic> details,
  }) = _AssistantConfirmationModel;

  factory AssistantConfirmationModel.fromJson(Map<String, dynamic> json) {
    final num? rawTotal = json['totalAmount'] is num ? json['totalAmount'] as num : null;
    return AssistantConfirmationModel(
      confirmationId: (json['confirmationId'] ?? '').toString(),
      action: (json['action'] ?? 'CONSEQUENTIAL_ACTION').toString(),
      summary: (json['summary'] ?? 'Confirm Action').toString(),
      orderId: json['orderId']?.toString(),
      orderNumber: json['orderNumber']?.toString(),
      totalAmount: rawTotal?.toDouble(),
      currency: (json['currency'] ?? 'INR').toString(),
      details: json['details'] is Map<String, dynamic>
          ? Map<String, dynamic>.from(json['details'] as Map)
          : {},
    );
  }
}

extension AssistantConfirmationModelX on AssistantConfirmationModel {
  Map<String, dynamic> toJson() {
    return {
      'confirmationId': confirmationId,
      'action': action,
      'summary': summary,
      'orderId': orderId,
      'orderNumber': orderNumber,
      'totalAmount': totalAmount,
      'currency': currency,
      'details': details,
    };
  }
}

@freezed
abstract class AssistantMessageModel with _$AssistantMessageModel {
  const AssistantMessageModel._();

  const factory AssistantMessageModel({
    required String id,
    required String role,
    required String content,
    AssistantConfirmationModel? pendingConfirmation,
    @Default([]) List<AssistantProductCardModel> products,
    @Default([]) List<AssistantSourceModel> sources,
    @Default([]) List<AssistantActionModel> actions,
    DateTime? timestamp,
  }) = _AssistantMessageModel;

  bool get isUser => role == 'user';
  bool get hasProducts => products.isNotEmpty;
  bool get hasSources => sources.isNotEmpty;
  bool get hasActions => actions.isNotEmpty;
  bool get hasPendingConfirmation => pendingConfirmation != null;

  factory AssistantMessageModel.fromJson(Map<String, dynamic> json) {
    final rawProds = json['products'];
    final List<AssistantProductCardModel> prods = (rawProds is List)
        ? rawProds
            .whereType<Map<String, dynamic>>()
            .map((p) => AssistantProductCardModel.fromJson(p))
            .toList()
        : [];

    final rawSources = json['sources'];
    final List<AssistantSourceModel> srcs = (rawSources is List)
        ? rawSources
            .whereType<Map<String, dynamic>>()
            .map((s) => AssistantSourceModel.fromJson(s))
            .toList()
        : [];

    final rawActions = json['actions'];
    final List<AssistantActionModel> acts = (rawActions is List)
        ? rawActions
            .whereType<Map<String, dynamic>>()
            .map((a) => AssistantActionModel.fromJson(a))
            .toList()
        : [];

    final rawConfirmation = json['pendingConfirmation'];
    final AssistantConfirmationModel? conf =
        rawConfirmation is Map<String, dynamic>
            ? AssistantConfirmationModel.fromJson(rawConfirmation)
            : null;

    DateTime ts = DateTime.now();
    if (json['timestamp'] != null) {
      try {
        ts = DateTime.parse(json['timestamp'].toString());
      } catch (_) {}
    }

    return AssistantMessageModel(
      id: (json['id'] ?? 'msg_${DateTime.now().millisecondsSinceEpoch}').toString(),
      role: (json['role'] ?? 'assistant').toString(),
      content: (json['content'] ?? json['message'] ?? '').toString(),
      pendingConfirmation: conf,
      products: prods,
      sources: srcs,
      actions: acts,
      timestamp: ts,
    );
  }
}

extension AssistantMessageModelX on AssistantMessageModel {
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'role': role,
      'content': content,
      'pendingConfirmation': pendingConfirmation?.toJson(),
      'products': products.map((p) => p.toJson()).toList(),
      'sources': sources.map((s) => s.toJson()).toList(),
      'actions': actions.map((a) => a.toJson()).toList(),
      'timestamp': timestamp?.toIso8601String(),
    };
  }
}

@freezed
abstract class AssistantChatResponseModel with _$AssistantChatResponseModel {
  const factory AssistantChatResponseModel({
    required String conversationId,
    required String message,
    required String answer,
    AssistantConfirmationModel? pendingConfirmation,
    @Default([]) List<AssistantProductCardModel> products,
    @Default([]) List<AssistantSourceModel> sources,
    @Default([]) List<AssistantActionModel> actions,
    required String requestId,
  }) = _AssistantChatResponseModel;

  factory AssistantChatResponseModel.fromJson(Map<String, dynamic> json) {
    final rawProds = json['products'];
    final List<AssistantProductCardModel> prods = (rawProds is List)
        ? rawProds
            .whereType<Map<String, dynamic>>()
            .map((p) => AssistantProductCardModel.fromJson(p))
            .toList()
        : [];

    final rawSources = json['sources'];
    final List<AssistantSourceModel> srcs = (rawSources is List)
        ? rawSources
            .whereType<Map<String, dynamic>>()
            .map((s) => AssistantSourceModel.fromJson(s))
            .toList()
        : [];

    final rawActions = json['actions'];
    final List<AssistantActionModel> acts = (rawActions is List)
        ? rawActions
            .whereType<Map<String, dynamic>>()
            .map((a) => AssistantActionModel.fromJson(a))
            .toList()
        : [];

    final rawConfirmation = json['pendingConfirmation'];
    final AssistantConfirmationModel? conf =
        rawConfirmation is Map<String, dynamic>
            ? AssistantConfirmationModel.fromJson(rawConfirmation)
            : null;

    return AssistantChatResponseModel(
      conversationId: (json['conversationId'] ?? '').toString(),
      message: (json['message'] ?? json['answer'] ?? '').toString(),
      answer: (json['answer'] ?? json['message'] ?? '').toString(),
      pendingConfirmation: conf,
      products: prods,
      sources: srcs,
      actions: acts,
      requestId: (json['requestId'] ?? '').toString(),
    );
  }
}

@freezed
abstract class AssistantConversationSummaryModel with _$AssistantConversationSummaryModel {
  const factory AssistantConversationSummaryModel({
    required String id,
    required String title,
    required String status,
    required int messageCount,
    required String lastMessage,
    DateTime? updatedAt,
  }) = _AssistantConversationSummaryModel;

  factory AssistantConversationSummaryModel.fromJson(Map<String, dynamic> json) {
    DateTime? dt;
    if (json['updatedAt'] != null) {
      try {
        dt = DateTime.parse(json['updatedAt'].toString());
      } catch (_) {}
    }

    return AssistantConversationSummaryModel(
      id: (json['id'] ?? json['_id'] ?? '').toString(),
      title: (json['title'] ?? 'Assistant Chat').toString(),
      status: (json['status'] ?? 'ACTIVE').toString(),
      messageCount: (json['messageCount'] is int)
          ? json['messageCount'] as int
          : (int.tryParse(json['messageCount']?.toString() ?? '0') ?? 0),
      lastMessage: (json['lastMessage'] ?? '').toString(),
      updatedAt: dt,
    );
  }
}
