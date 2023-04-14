import 'dart:async';

import 'package:capcoding/app/routes.dart';
import 'package:capcoding/features/constants.feature.dart';
import 'package:capcoding/ui/styles/colors.style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void initState() {
    super.initState();
    _controller.forward();
    goToHomeScreen();
  }

  goToHomeScreen() async {
    return Timer(
      const Duration(milliseconds: 1500),
      () => Get.offAndToNamed(Routes.listcontacts),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[
              primaryColor,
              primaryConstratColor,
            ],
          ),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Center(
              child: ScaleTransition(
                scale: _animation,
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    color: lightColor.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 100,
                    color: primaryColor,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  "$APP_NAME @2023 by ~Clément~",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: lightColor,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
