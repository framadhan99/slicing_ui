import 'package:flutter/material.dart';
import 'package:slicing_ui/app/config/asset_colors.dart';

final ThemeData appTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: AssetColors.primaryColor,
  scaffoldBackgroundColor: Colors.white,
  fontFamily: 'EncodesSans', // Gunakan sesuai font dari desainmu
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    fillColor: Colors.grey.shade100,
    filled: true,
    hintStyle: const TextStyle(color: Colors.black45),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
  ),
  appBarTheme: AppBarTheme(backgroundColor: Colors.white),
);
