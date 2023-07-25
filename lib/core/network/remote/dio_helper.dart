import 'package:dio/dio.dart';
import 'package:nexo_app/core/network/remote/end_points.dart';

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

  static Future<Response> getHelpData() async {
    return await dio.get(EndPointsHandler.getHelpEndPoint);
  }
}
