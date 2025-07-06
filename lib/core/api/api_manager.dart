import 'package:bookly_app/core/resources/app_constants.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiManager {
  late Dio _dio;

  ApiManager() {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseUrl,
        contentType: 'application/json',
      ),
    );
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        error: true,
      ),
    );
  }
  Future<Response> getData(
    String endpoint, {
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
  }) async {
    try {
      return await _dio.get(
        endpoint,
        queryParameters: query,
        options: Options(headers: headers),
      );
    } on DioError catch (e) {
      throw Exception("Failed to Get:$e");
    }
  }
}
