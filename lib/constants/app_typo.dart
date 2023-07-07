import 'package:flutter/material.dart';

class FontFamily {
  static final inter = 'Inter';
}

class AppTypo {
  static TextStyle base = TextStyle(
      fontFamily: FontFamily.inter,
      fontSize: 16,
      color: Colors.white,
      fontWeight: FontWeight.w400);
  static TextStyle small = TextStyle(
      fontFamily: FontFamily.inter,
      fontSize: 14,
      color: Colors.white,
      fontWeight: FontWeight.w400);
  static TextStyle caption = TextStyle(
      fontFamily: FontFamily.inter,
      fontSize: 12,
      color: Colors.white,
      fontWeight: FontWeight.w400);
}
