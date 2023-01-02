import 'package:flutter/material.dart';
import 'package:go_plus/core/app_colors.dart';

import '../../../../core/sizse_views.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key, required this.textInputType, required this.hintText, required this.controller,})
      : super(key: key);

  final TextInputType textInputType;
  final String hintText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.goldColor,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: AppColors.goldColor
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
                SizesViews.height(context, 0.02)),
            borderSide: const BorderSide(color: AppColors.whitColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
            SizesViews.height(context, 0.02)),
            borderSide: const BorderSide(color: AppColors.goldColor)),
      ),
      keyboardType: textInputType,
      controller:controller ,
      style: TextStyle(
        color: AppColors.goldColor,
        fontSize: 16,
        fontWeight: FontWeight.bold
      ),
      validator: (value){
        if(value==null || value.isEmpty){
          return 'ادخل البيانات';
        }
        return null;
      },

    );
  }

  }


