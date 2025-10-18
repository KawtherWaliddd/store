import 'package:dio/dio.dart';

class ExcptionHandler {
  Exception handelExcption(dynamic error) {
    if (error is DioException) {
      final statusCode = error.response!.statusCode;
      final messageCode = error.message;
      return Exception("satus code:$statusCode,error :$messageCode");
    } else {
      return Exception(error.toString());
    }
  }
}
