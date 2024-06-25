import 'package:flutter/material.dart';
import 'package:playverseadmin/app/theme/theme_constans.dart';


double bodyMediumFontSize(context) {
  return Theme.of(context).textTheme.bodyMedium?.fontSize ?? 20;
}

double bodySmallFontSize(context) {
  return Theme.of(context).textTheme.bodySmall?.fontSize ?? 10;
}

double titleLargeFontSize(context) {
  return Theme.of(context).textTheme.titleLarge?.fontSize ?? 30;
}

// Primary Bold
TextStyle primaryBold(context) {
  return const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
}

//table
TextStyle table(context) {
  return const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.fontBlack,
  );
}

// Primary noraml
TextStyle primaryNormal(context) {
  return const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.normal,
    color: Colors.white,
  );
}

TextStyle textBold(context) {
  return const TextStyle(
    fontSize: 20,
    letterSpacing: 0.0,
    fontWeight: FontWeight.w800,
    color: Colors.black,
  );
}

TextStyle textnormal(context) {
  return const TextStyle(
    fontSize: 16,
    letterSpacing: 0.0,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );
}

TextStyle textnormalblue(context) {
  return const TextStyle(
    fontSize: 16,
    letterSpacing: 0.0,
    fontWeight: FontWeight.normal,
    color: Colors.blue,
  );
}
