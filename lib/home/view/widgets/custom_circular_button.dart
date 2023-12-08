import 'package:flutter/material.dart';
import 'package:locator_app/constants/constants.dart';

class CustomCircularButton extends StatelessWidget {
  const CustomCircularButton({
    required this.icon,
    this.onTap,
    this.borderColor = Colors.transparent,
    this.backgroundColor = Colors.white,
    super.key,
    this.containerHeight = 50,
    this.containerWidth = 50,
    this.hasShadow = true,
    this.iconColor = kCustomBlack,
    this.iconSize = 24,
  });

  final IconData icon;
  final Color backgroundColor;
  final VoidCallback? onTap;
  final double containerHeight;
  final double containerWidth;
  final Color borderColor;
  final bool hasShadow;
  final Color iconColor;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: containerHeight,
        width: containerWidth,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
          border: Border.all(color: borderColor),
          boxShadow: [
            if (hasShadow)
              BoxShadow(
                color: Colors.grey.shade500,
                blurRadius: 5,
                spreadRadius: 1.1,
              ),
          ],
        ),
        child: Icon(
          icon,
          color: iconColor,
          size: iconSize,
        ),
      ),
    );
  }
}
