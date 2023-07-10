import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://www.hisnmuslim.com/api/ar/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

//http://www.hisnmuslim.com/api/ar/
  static Future<Response>? getData({required String key}) {
    return dio!.get(key);
  }
}
