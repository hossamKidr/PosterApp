import 'package:flutter/material.dart';
import 'package:go_plus/core/app_colors.dart';

import 'cuostome_text.dart';
class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.customText, required this.onTap, }) : super(key: key);
  final CustomText customText;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.07,
        decoration: BoxDecoration(
          color: AppColors.goldColor,
          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height )
        ),
        child:customText,
      ),
    );
  }
}
