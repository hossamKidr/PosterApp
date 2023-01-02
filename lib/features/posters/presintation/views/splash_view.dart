import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_plus/core/app_colors.dart';
import 'package:go_plus/core/rouets.dart';
import 'package:go_plus/core/sizse_views.dart';

import '../../../../core/app_theme.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

Timer? timer;

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    super.initState();
    controller();
    sliderAnimation();
    addTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkGryColor,
     appBar: AppBar(
       backgroundColor: AppColors.darkGryColor,
       systemOverlayStyle: SystemUiOverlayStyle(
         statusBarColor: AppColors.darkGryColor,
         statusBarBrightness: Brightness.light,
         statusBarIconBrightness: Brightness.light
       ),
     ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
                animation: slidingAnimation,
                builder: (context, _) {
                  return SlideTransition(
                    position: slidingAnimation,
                    child: Image.asset(
                      'assets/images/goplus1.png',
                      fit: BoxFit.fill,
                      height: SizesViews.height(context, 0.2),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }

  sliderAnimation() {
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 8), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }

  controller() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  addTimer() {
    timer = Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, Routes.home);
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
