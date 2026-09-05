import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:shopp_app/constants/urls.dart';
import 'package:shopp_app/core/api.dart';
import 'package:shopp_app/data/models/api_response.dart';
import 'package:shopp_app/data/models/ai_config_model.dart';

class AiRepository {
  final Api _api;

  AiRepository({Api? api}) : _api = api ?? Api();

  /// Retrieve the subsystem health and enabled capabilities of Shoppy AI.
  Future<ApiResponse> getAiHealth() async {
    try {
      final response = await _api.getRequest(Urls.aiHealth);
      final apiResponse = ApiResponse.fromJson(response.data);

      if (apiResponse.status && apiResponse.data is Map<String, dynamic>) {
        final model = AiHealthModel.fromJson(
          apiResponse.data as Map<String, dynamic>,
        );
        return ApiResponse(
          status: true,
          message: apiResponse.message,
          data: model,
          statusCode: apiResponse.statusCode,
        );
      }

      return apiResponse;
    } on DioException catch (dioError) {
      log("AiRepository.getAiHealth DioException: ${dioError.message}");
      return ApiResponse(
        status: false,
        message: dioError.response?.data?['message']?.toString() ??
            dioError.message ??
            "Failed to connect to Shoppy AI service",
        data: null,
        statusCode: dioError.response?.statusCode ?? 500,
      );
    } catch (e) {
      log("AiRepository.getAiHealth generic error: $e");
      return ApiResponse(
        status: false,
        message: "Failed to connect to Shoppy AI service: $e",
        data: null,
        statusCode: 500,
      );
    }
  }

  /// Submit a query or conversational message to the backend AI orchestrator.
  Future<ApiResponse> queryAi(
    String message, {
    List<Map<String, String>> history = const [],
    Map<String, dynamic> options = const {},
  }) async {
    try {
      final response = await _api.postRequest(
        Urls.aiQuery,
        data: {
          'message': message,
          'history': history,
          'options': options,
        },
      );
      final apiResponse = ApiResponse.fromJson(response.data);

      if (apiResponse.status && apiResponse.data is Map<String, dynamic>) {
        final resultModel = AiQueryResultModel.fromJson(
          apiResponse.data as Map<String, dynamic>,
        );
        return ApiResponse(
          status: true,
          message: apiResponse.message,
          data: resultModel,
          statusCode: apiResponse.statusCode,
        );
      }

      return apiResponse;
    } on DioException catch (dioError) {
      log("AiRepository.queryAi DioException: ${dioError.message}");
      return ApiResponse(
        status: false,
        message: dioError.response?.data?['message']?.toString() ??
            dioError.message ??
            "AI service request failed",
        data: null,
        statusCode: dioError.response?.statusCode ?? 500,
      );
    } catch (e) {
      log("AiRepository.queryAi generic error: $e");
      return ApiResponse(
        status: false,
        message: "AI service request failed: $e",
        data: null,
        statusCode: 500,
      );
    }
  }
}
