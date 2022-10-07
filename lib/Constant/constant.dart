import 'package:flutter/material.dart';

const greenALS = Color(0xFF6ABF4B);
Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}
