import 'package:dio/dio.dart';

import '../../../core/network/remote/dio_helper.dart';
import '../../../core/network/remote/end_points.dart';
import '../domain/log_in_with_phone_repo.dart';

class LoginWithPhoneRepoImpl extends LoginWithPhoneRepo {
  @override
  Future<Response> verifyPhone({
    required String fullName,
    required String phoneNumber,
  }) async {
    return await DioHelper.postData(
      path: EndPointsHandler.verifyPhoneEndPoint,
      data: {
        'phone': phoneNumber,
        'name': fullName,
      },
    );
  }

  // @override
  // Future<Response> sendOtp({
  //   required String phoneNumber,
  // }) async {
  //   return await DioHelper.postData(
  //     path: EndPointsHandler.otpEndPoint,
  //     data: {
  //       'phone': phoneNumber,
  //     },
  //   );
  // }
}
