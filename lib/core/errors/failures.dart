import 'package:dio/dio.dart';

abstract class Failures {
  final String message;
  Failures(this.message);
}

class ServerFailure extends Failures {
  ServerFailure(super.message);

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return ServerFailure("Connection timeout with the server.");
      case DioErrorType.sendTimeout:
        return ServerFailure("Send timeout with the server.");
      case DioErrorType.receiveTimeout:
        return ServerFailure("Receive timeout with the server.");
      case DioErrorType.badResponse:
        final response = dioError.response;
        return ServerFailure.fromResponse(
          response?.statusCode ?? 0,
          response?.data,
        );
      case DioErrorType.cancel:
        return ServerFailure("Request to the server was cancelled.");
      case DioErrorType.badCertificate:
        return ServerFailure("Bad certificate from the server.");
      case DioErrorType.connectionError:
        return ServerFailure("Connection error occurred.");
      case DioErrorType.unknown:
        return ServerFailure("An unknown error occurred.");
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    try {
      if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
        return ServerFailure(
          response['error']['message'] ?? "Authentication error.",
        );
      } else if (statusCode == 404) {
        return ServerFailure("Request not found.");
      } else if (statusCode == 500) {
        return ServerFailure("Internal server error.");
      } else {
        return ServerFailure("Unexpected error occurred.");
      }
    } catch (_) {
      return ServerFailure("Error parsing response from server.");
    }
  }
}
