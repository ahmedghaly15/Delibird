import 'package:dio/dio.dart';

abstract class GetHelpRepo {
  Future<Response> getHelpData();
}
