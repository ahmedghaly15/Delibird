import 'package:dio/dio.dart';

abstract class LoginWithPhoneRepo {
  Future<Response> verifyPhone({
    required String fullName,
    required String phoneNumber,
  });

  // Future<Response> sendOtp({
  //   required String phoneNumber,
  // });
}
