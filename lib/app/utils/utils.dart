import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class Utils {
  static bool isEmail(String email) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(p);

    return regExp.hasMatch(email);
  }

  static bool isPhone(String input) =>
      RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')
          .hasMatch(input);

  static bool isNum(String input) => int.tryParse(input) != null;

  static Future<String> networkImageToBase64(String imageUrl) async {
    http.Response response = await http.get(Uri.parse(imageUrl));
    final bytes = response.bodyBytes;
    return base64Encode(bytes);
  }

  static Future<List<String>> imagesToBase64(List images) async {
    List<String> base64 = [];
    for (var e in images) {
      String temp = e is File
          ? base64Encode(await e.readAsBytes())
          : await networkImageToBase64(e);
      base64.add(temp);
    }
    return base64;
  }

  static bool scrollNotifier(Object? notification, VoidCallback callback) {
    if (notification is ScrollEndNotification) {
      final before = notification.metrics.extentBefore;
      final max = notification.metrics.maxScrollExtent;

      if (before == max) callback();
    }
    return false;
  }

  static bool isAddress(String value) {
    for (int i = 0; i < value.length; i++) {
      if (double.tryParse(value[i]) != null) return true;
    }
    return false;
  }

  static void toast(String msg) =>
      Fluttertoast.showToast(msg: msg, toastLength: Toast.LENGTH_LONG);
}
