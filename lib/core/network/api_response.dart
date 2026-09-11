import 'dart:convert';

class ApiResponse {
  final bool status;
  final String message;
  final dynamic data;
  final int? statusCode;

  ApiResponse({
    required this.status,
    required this.message,
    required this.data,
    this.statusCode,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      status: (json['success'] as bool?) ?? (json['status'] as bool?) ?? false,
      message: (json['message'] as String?) ?? '',
      data: json['data'],
      statusCode: (json['statusCode'] as num?)?.toInt(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': _encodeData(),
      if (statusCode != null) 'statusCode': statusCode,
    };
  }

  dynamic _encodeData() {
    if (data is Map<String, dynamic> || data is List<dynamic>) {
      return jsonEncode(data);
    }
    return data;
  }
}
