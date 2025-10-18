import 'package:dio/dio.dart';
import 'package:store_app/core/error/excption.dart';
import 'package:store_app/core/network/api_config.dart';

class ApiClient {
  final Dio _dio;

  ApiClient()
    : _dio = Dio(
        BaseOptions(
          baseUrl: ApiConfig.baseUrl,
          connectTimeout: ApiConfig.timeOut,
          receiveTimeout: ApiConfig.timeOut,
          headers: {"Accept": "application/json"},
        ),
      );

  //get methode
  Future<dynamic> get({required String url}) async {
    try {
      final Response response = await _dio.get(url);
      return response.data;
    } catch (e) {
      throw ExcptionHandler().handelExcption(e);
    }
  }

  // post methode
  Future<dynamic> post({required String url, required dynamic data}) async {
    try {
      Response response = await _dio.post(url, data: data);
      return response.data;
    } catch (e) {
      throw ExcptionHandler().handelExcption(e);
    }
  }

  //put methode
  Future<dynamic> put({required String url, required dynamic data}) async {
    try {
      Response response = await _dio.put(url, data: data);
      return response.data;
    } catch (e) {
      throw ExcptionHandler().handelExcption(e);
    }
  }
}
