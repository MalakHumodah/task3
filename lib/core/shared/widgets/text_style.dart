import 'package:flutter/material.dart';

TextStyle headlineTextStyle() {
  return TextStyle(
    fontSize: 50,
    fontFamily: 'EBGaramond',
    color: Colors.white,
  );
}

TextStyle subTitleTextStyle({Color? color}) {
  return TextStyle(
      fontSize: 20,
      fontFamily: 'Exo',
      color: color ?? Colors.white,
      fontWeight: FontWeight.w600);
}
