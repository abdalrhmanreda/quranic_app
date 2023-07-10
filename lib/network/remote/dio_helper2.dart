import 'package:dio/dio.dart';

class DioHelperTwo {
  static Dio? dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://hadis-api-id.vercel.app/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response>? getData(String key) {
    return dio!.get(key);
  }
}
