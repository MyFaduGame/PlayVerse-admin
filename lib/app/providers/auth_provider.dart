
import 'package:flutter/material.dart';
// @todos when provider create remove this provider

class AuthProvider extends ChangeNotifier {
  login(String text) {}
  // AuthRepository authRepo = AuthRepository();
  // bool loggedIn = false;
  // String userId = '';
  // String? otpId;

  // bool userCheck(String user) => user == userId;
  // Future<void> getToken() async {
  //   String? token =
  //       await MySharedPreferences.instance.getStringValue("access_token");
  //   String? uId = await MySharedPreferences.instance.getStringValue("user_id");
  //   userId = uId ?? '';
  //   loggedIn = token != null;
  //   notifyListeners();
  // }

  // Future<bool> login(String mobile) async {
  //   try {
  //     Map<String, dynamic> data = {
  //       'mobile': mobile,
  //     };
  //     final response = await authRepo.loginApi(data);
  //     if (response['status_code'] == 200) {
  //       otpId = response["data"]["mobile_otp_id"];
  //       getToken();
  //       return true;
  //     } else {
  //       Utils.toast(response['message']);
  //       return false;
  //     }
  //   } catch (e) {
  //     Utils.toast('something went wrong!!');
  //   }
  //   return false;
  // }

  // Future<bool> otpSend(String otp) async {
  //   try {
  //     Map<String, dynamic> data = {"mobile_otp_id": otpId, "otp": otp};

  //     final response = await authRepo.otpVerify(data);
  //     log(response.toString(), name: 'Response otp api');
  //     if (response != null && response['status_code'] == 201) {
  //       String accessToken = response["data"]["access_token"];
  //       String refreshToken = response["data"]["refresh_token"];
  //       String userId = response['data']["user_id"];
  //       MySharedPreferences.instance
  //           .setStringValue("access_token", accessToken);
  //       MySharedPreferences.instance
  //           .setStringValue("refresh_token", refreshToken);
  //       MySharedPreferences.instance.setStringValue("user_id", userId);
  //       Utils.toast(response['message']);
  //       return true;
  //     } else {
  //       Utils.toast(response['message']);
  //       return false;
  //     }
  //   } catch (e) {
  //     log(e.toString(), name: 'Error login');
  //   }
  //   Utils.toast('something went wrong!!');
  //   return false;
  // }
}
