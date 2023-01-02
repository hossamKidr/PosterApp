import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_plus/core/app_colors.dart';
class AppTheme {
 static  appTheme(){
    return ThemeData(
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.goldColor,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark
        ),
        backgroundColor: AppColors.goldColor,
        elevation: 0,
      ),

    );
  }
}
