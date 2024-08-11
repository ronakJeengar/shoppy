import 'dart:convert';

class ApiResponse {
  final bool status;
  final String message;
  final dynamic data;

  ApiResponse(
      {required this.status, required this.message, required this.data});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      status: json['status'],
      message: json['message'],
      data: json['data'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': _encodeData(),
    };
  }

  dynamic _encodeData() {
    if (data is Map<String, dynamic> || data is List<dynamic>) {
      return jsonEncode(data);
    }
    return data;
  }
}
