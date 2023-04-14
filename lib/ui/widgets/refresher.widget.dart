import 'package:capcoding/ui/styles/colors.style.dart';
import 'package:flutter/material.dart';

class RefresherWidget extends StatelessWidget {
  const RefresherWidget({
    super.key,
    required this.child,
    required this.onRefresh,
  });

  final Widget child;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => onRefresh(),
      backgroundColor: lightColor,
      color: primaryColor,
      child: child,
    );
  }
}
