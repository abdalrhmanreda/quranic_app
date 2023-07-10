import 'package:dio/dio.dart';

class DioHelperTafseer {
  static Dio? dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://quranenc.com/api/v1',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response>? getData({required String key}) {
    return dio!.get(key);
  }
}
