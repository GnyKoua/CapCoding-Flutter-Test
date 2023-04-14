import 'package:capcoding/ui/styles/colors.style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SpinnerWidget extends StatelessWidget {
  const SpinnerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: SpinKitCircle(
      size: 120,
      color: primaryConstratColor,
      duration: Duration(seconds: 1),
    ));
  }
}
