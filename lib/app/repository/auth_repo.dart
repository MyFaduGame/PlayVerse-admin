import 'dart:convert';
import 'dart:developer';

import 'package:playverseadmin/app/repository/base_repo.dart';
import 'package:playverseadmin/app/utils/api_urls.dart';

class AuthRepository extends BaseRepository {
  Future loginApi(Map<String, dynamic> data) async {
    final response = await postHttp(api: ApiUrls.login, data: data);
    log(response.body, name: 'response loginApi');
    return json.decode(response.body);
  }

  Future otpVerify(Map<String, dynamic> data) async {
    final response = await postHttp(data: data, api: ApiUrls.otp);
    log(response.body, name: 'response otpVerify');
    return json.decode(response.body);
  }
}
