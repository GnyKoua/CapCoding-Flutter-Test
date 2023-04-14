import 'package:capcoding/ui/styles/colors.style.dart';
import 'package:capcoding/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActionDetailsContact extends StatelessWidget {
  const ActionDetailsContact({
    super.key,
    required this.svgSrc,
    required this.label,
    required this.color,
  });

  final String svgSrc;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(15),
      child: Column(
        children: [
          Container(
            height: 70,
            width: 70,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: lightColor,
              borderRadius: BorderRadius.circular(35),
            ),
            child: SvgPicture.asset(
              makeAssetName(svgSrc),
              color: color,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: lightColor,
                ),
          ),
        ],
      ),
    );
  }
}
