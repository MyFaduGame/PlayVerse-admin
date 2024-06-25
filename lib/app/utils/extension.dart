import 'package:flutter/material.dart';

extension DateTimeHelper on DateTime {
  String toDDMMYYYY() {
    return '${day < 10 ? '0$day' : day}/${month < 10 ? '0$month' : month}/$year';
  }

  String toYYYYMMDD() {
    return '$year/${month < 10 ? '0$month' : month}/${day < 10 ? '0$day' : day}';
  }

  String toTime() {
    int hour0 = hour > 12 ? hour - 12 : hour;
    return '${hour0 == 0 ? "12" : hour0 < 10 ? '0$hour0' : hour0}:${minute < 10 ? '0$minute' : minute} ${hour < 12 ? 'AM' : 'PM'}';
  }

  String to24() {
    return '$hour:${minute < 10 ? '0$minute' : minute}';
  }

  String getCode() {
    return '$day$month$hour$minute';
  }

  String local() {
    final date = toLocal();
    return date.toDDMMYYYY();
  }
}

extension StringHelper on String {
  String toDate() {
    final date = DateTime.parse(this).toLocal();
    return date.toDDMMYYYY();
  }
}

extension TimeHelper on TimeOfDay {
  String toTime() {
    int hour0 = hour > 12 ? hour - 12 : hour;
    return '${hour0 < 10 ? '0$hour0' : hour0}:${minute < 10 ? '0$minute' : minute} ${hour < 12 ? 'AM' : 'PM'}';
  }
}

extension IntHelper on int {
  String intToMonth() {
    List<String> months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return months[this - 1];
  }
}
