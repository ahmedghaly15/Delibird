import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static void initDio() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://magdsoft.ahmedshawky.fun/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({required String path}) async {
    return await dio.get(path);
  }

  static Future<Response> postData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    return await dio.post(path, data: data);
  }
}
