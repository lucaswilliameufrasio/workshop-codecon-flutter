import 'package:dio/dio.dart';

class DioProviderBase {
  static const String URL_BASE = 'https://product.mattel.com/api/ProductInfo/';

  static final DioProviderBase _dioProviderBase = DioProviderBase._internal();
  DioProviderBase._internal();

  factory DioProviderBase() {
    return _dioProviderBase;
  }

  final dio = Dio(BaseOptions(
      baseUrl: URL_BASE,
      connectTimeout: Duration(minutes: 3).inMilliseconds,
      receiveTimeout: Duration(minutes: 5).inMilliseconds,
      headers: {
        "Accept": "application/json",
        'Content-Type': "application/json"
      }));

  Future<Response> get(String url, Map<String, dynamic> params) async {
    return await dio.get(url, queryParameters: params ?? {});
  }
  Future<Response> post(String url, Map<String, dynamic> bodyData) async {
    return await dio.post(url, data: bodyData ?? {});
  }
}
