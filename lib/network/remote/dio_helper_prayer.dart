import 'package:dio/dio.dart';

class DioHelperPrayer {
  static Dio? dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.aladhan.com/v1',
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
