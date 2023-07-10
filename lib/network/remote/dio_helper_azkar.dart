import 'package:dio/dio.dart';

class DioHelperAzkar {
  static Dio? dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://raw.githubusercontent.com',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response>? getData({
    required String key,
  }) async {
    return await dio!.get(key);
  }
}
