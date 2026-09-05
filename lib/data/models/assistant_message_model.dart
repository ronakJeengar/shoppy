import 'package:shopp_app/data/models/product_model.dart';

class AssistantProductCardModel {
  final String id;
  final String name;
  final double price;
  final bool inStock;
  final int stockCount;
  final double rating;
  final String seller;
  final String productImage;
  final String description;

  const AssistantProductCardModel({
    required this.id,
    required this.name,
    required this.price,
    required this.inStock,
    this.stockCount = 0,
    this.rating = 0.0,
    this.seller = 'Shoppy Verified',
    this.productImage = '',
    this.description = '',
  });

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

class AssistantSourceModel {
  final String chunkId;
  final String title;
  final String section;
  final String sourceType;
  final String content;
  final Map<String, dynamic>? citation;

  const AssistantSourceModel({
    required this.chunkId,
    required this.title,
    this.section = '',
    this.sourceType = 'POLICY',
    this.content = '',
    this.citation,
  });

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

class AssistantActionModel {
  final String type;
  final String label;
  final Map<String, dynamic> payload;

  const AssistantActionModel({
    required this.type,
    required this.label,
    this.payload = const {},
  });

  factory AssistantActionModel.fromJson(Map<String, dynamic> json) {
    return AssistantActionModel(
      type: (json['type'] ?? 'INFO').toString(),
      label: (json['label'] ?? 'Action').toString(),
      payload: json['payload'] is Map<String, dynamic>
          ? Map<String, dynamic>.from(json['payload'] as Map)
          : {},
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'label': label,
      'payload': payload,
    };
  }
}

class AssistantConfirmationModel {
  final String confirmationId;
  final String action;
  final String summary;
  final String? orderId;
  final String? orderNumber;
  final double? totalAmount;
  final String currency;
  final Map<String, dynamic> details;

  const AssistantConfirmationModel({
    required this.confirmationId,
    required this.action,
    required this.summary,
    this.orderId,
    this.orderNumber,
    this.totalAmount,
    this.currency = 'USD',
    this.details = const {},
  });

  factory AssistantConfirmationModel.fromJson(Map<String, dynamic> json) {
    final num? rawTotal = json['totalAmount'] is num ? json['totalAmount'] as num : null;
    return AssistantConfirmationModel(
      confirmationId: (json['confirmationId'] ?? '').toString(),
      action: (json['action'] ?? 'CONSEQUENTIAL_ACTION').toString(),
      summary: (json['summary'] ?? 'Confirm Action').toString(),
      orderId: json['orderId']?.toString(),
      orderNumber: json['orderNumber']?.toString(),
      totalAmount: rawTotal?.toDouble(),
      currency: (json['currency'] ?? 'USD').toString(),
      details: json['details'] is Map<String, dynamic>
          ? Map<String, dynamic>.from(json['details'] as Map)
          : {},
    );
  }

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

class AssistantMessageModel {
  final String id;
  final String role; // 'user' or 'assistant'
  final String content;
  final AssistantConfirmationModel? pendingConfirmation;
  final List<AssistantProductCardModel> products;
  final List<AssistantSourceModel> sources;
  final List<AssistantActionModel> actions;
  final DateTime timestamp;

  bool get isUser => role == 'user';
  bool get hasProducts => products.isNotEmpty;
  bool get hasSources => sources.isNotEmpty;
  bool get hasActions => actions.isNotEmpty;
  bool get hasPendingConfirmation => pendingConfirmation != null;

  AssistantMessageModel({
    required this.id,
    required this.role,
    required this.content,
    this.pendingConfirmation,
    this.products = const [],
    this.sources = const [],
    this.actions = const [],
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();

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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'role': role,
      'content': content,
      'pendingConfirmation': pendingConfirmation?.toJson(),
      'products': products.map((p) => p.toJson()).toList(),
      'sources': sources.map((s) => s.toJson()).toList(),
      'actions': actions.map((a) => a.toJson()).toList(),
      'timestamp': timestamp.toIso8601String(),
    };
  }
}

class AssistantChatResponseModel {
  final String conversationId;
  final String message;
  final String answer;
  final AssistantConfirmationModel? pendingConfirmation;
  final List<AssistantProductCardModel> products;
  final List<AssistantSourceModel> sources;
  final List<AssistantActionModel> actions;
  final String requestId;

  const AssistantChatResponseModel({
    required this.conversationId,
    required this.message,
    required this.answer,
    this.pendingConfirmation,
    required this.products,
    required this.sources,
    required this.actions,
    required this.requestId,
  });

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

class AssistantConversationSummaryModel {
  final String id;
  final String title;
  final String status;
  final int messageCount;
  final String lastMessage;
  final DateTime? updatedAt;

  const AssistantConversationSummaryModel({
    required this.id,
    required this.title,
    required this.status,
    required this.messageCount,
    required this.lastMessage,
    this.updatedAt,
  });

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
