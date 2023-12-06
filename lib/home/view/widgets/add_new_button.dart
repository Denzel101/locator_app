import 'package:flutter/material.dart';
import 'package:locator_app/constants/constants.dart';
import 'package:locator_app/home/home.dart';

class AddNewButton extends StatelessWidget {
  const AddNewButton({
    required this.label,
    required this.onTap,
    super.key,
  });

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 500),
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            const TopAppButton(
              containerHeight: double.infinity,
              containerWidth: 40,
              backgroundColor: kCustomLimeGreen,
              icon: Icons.add_rounded,
              hasShadow: false,
            ),
            SizedBox(
              width: size.width * 0.02,
            ),
            Text(label),
          ],
        ),
      ),
    );
  }
}
