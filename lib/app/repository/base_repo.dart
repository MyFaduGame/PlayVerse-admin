import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:playverseadmin/app/utils/api_urls.dart';
import 'package:playverseadmin/app/utils/my_sharepreferences.dart';

class BaseRepository {
  /// For POST request
  Future<http.Response> postHttp({
    required Map<String, dynamic> data,
    required String api,
    bool token = false,
  }) async {
    String? accessToken;
    final url = ApiUrls.baseUrl + api;
    log(url, name: 'postHttp');
    log(data.toString(), name: '$api data');
    if (token) {
      accessToken =
          await MySharedPreferences.instance.getStringValue("access_token");
      log(accessToken.toString(), name: "access_token");
    }

    final response = await http.post(
      Uri.parse(url),
      headers: accessToken == null
          ? {
              'Content-Type': 'application/json',
              "Access-Control-Allow-Origin": "*",
              "Access-Control-Allow-Credentials": "true",
              "Access-Control-Allow-Headers":
                  "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
              "Access-Control-Allow-Methods":
                  "GET, POST, PUT, PATCH, DELETE, OPTIONS"
            }
          : {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $accessToken'
            },
      body: json.encode(data),
    );
    log(response.statusCode.toString());
    if (response.statusCode == 403 && token) {
      return refreshToken()
          .then((value) => postHttp(data: data, api: api, token: token));
    }
    return response;
  }

  /// For GET request
  Future<http.Response> getHttp({
    required String api,
    bool token = false,
  }) async {
    String? accessToken;
    final url = ApiUrls.baseUrl + api;
    log(url, name: 'getHttp');
    if (token) {
      accessToken =
          await MySharedPreferences.instance.getStringValue("access_token");
      log(accessToken.toString(), name: "access_token");
    }

    final response = await http.get(
      Uri.parse(url),
      headers: accessToken == null
          ? {'Content-Type': 'application/json'}
          : {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $accessToken'
            },
    );
    log(response.statusCode.toString());
    if (response.statusCode == 403 && token) {
      return refreshToken().then((value) => getHttp(api: api, token: token));
    }
    return response;
  }

  /// For PUT request
  Future<http.Response> putHttp({
    required Map<String, dynamic> data,
    required String api,
    bool token = false,
  }) async {
    String? accessToken;
    final url = ApiUrls.baseUrl + api;
    log(url, name: 'putHttp');
    log(data.toString(), name: '$api data');
    if (token) {
      accessToken =
          await MySharedPreferences.instance.getStringValue("access_token");
      log(accessToken.toString(), name: "access_token");
    }
    final response = await http.put(
      Uri.parse(url),
      headers: accessToken == null
          ? {'Content-Type': 'application/json'}
          : {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $accessToken'
            },
      body: json.encode(data),
    );
    log(response.statusCode.toString());
    if (response.statusCode == 403 && token) {
      return refreshToken()
          .then((value) => putHttp(data: data, api: api, token: token));
    }
    return response;
  }

  /// For DELETE requeste
  Future<http.Response> deletHttp({
    required String api,
    bool token = false,
  }) async {
    String? accessToken;
    final url = ApiUrls.baseUrl + api;
    log(url, name: 'deleteHttp');
    if (token) {
      accessToken =
          await MySharedPreferences.instance.getStringValue("access_token");
      log(accessToken.toString(), name: "access_token");
    }

    final response = await http.delete(
      Uri.parse(url),
      headers: accessToken == null
          ? {'Content-Type': 'application/json'}
          : {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $accessToken'
            },
    );
    if (response.statusCode == 403 && token) {
      log(response.statusCode.toString());
      return refreshToken().then((value) => deletHttp(api: api, token: token));
    }
    return response;
  }

  Future<void> refreshToken() async {
    String? refreshToken =
        await MySharedPreferences.instance.getStringValue("refresh_token");
    const url = ApiUrls.baseUrl + ApiUrls.refreshToken;
    log(refreshToken.toString(), name: 'refreshToken');

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $refreshToken'
      },
    );
    log(response.body, name: 'response refreshToken');
    String accessToken = json.decode(response.body)['data'];
    MySharedPreferences.instance.setStringValue("access_token", accessToken);
  }

  Future<http.Response> getRequest({
    required Map<String, dynamic> data,
    required String api,
    bool token = false,
  }) async {
    final url = ApiUrls.baseUrl + api;
    log(url, name: 'getRequest');
    log(data.toString(), name: '$api data');

    final headers = {'Content-Type': 'application/json'};

    final request = http.Request('GET', Uri.parse(url));
    request.body = json.encode(data);
    request.headers.addAll(headers);

    final streamResponse = await request.send();
    final response = await http.Response.fromStream(streamResponse);

    if (response.statusCode == 403 && token) {
      log(response.statusCode.toString());
      return refreshToken()
          .then((value) => putHttp(data: data, api: api, token: token));
    }
    return response;
  }
}
