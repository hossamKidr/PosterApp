import 'package:flutter/material.dart';
import 'package:go_plus/core/app_colors.dart';
import 'package:go_plus/core/sizse_views.dart';

import 'cuostome_text.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({Key? key, required this.text, required this.h, required this.w}) : super(key: key);
final CustomText text;
final double h;
final double w;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SizesViews.width(context, 0.02)),
      alignment: Alignment.center,
      height: h,
      width: w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizesViews.height(context, 0.02)),
        color: AppColors.goldColor,
      ),
      child: text,
    );
  }
}
