import 'package:dio/dio.dart';

import '../../../core/network/remote/end_points.dart';
import '../domain/get_help_repo.dart';
import '/core/network/remote/dio_helper.dart';

class GetHelpRepoImpl extends GetHelpRepo {
  @override
  Future<Response> getHelpData() async {
    return await DioHelper.getData(path: EndPointsHandler.getHelpEndPoint);
  }
}
