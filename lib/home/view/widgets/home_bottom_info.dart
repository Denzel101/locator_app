import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:locator_app/constants/constants.dart';
import 'package:locator_app/home/home.dart';
import 'package:locator_app/router/router.dart';

class HomeBottomInfo extends StatelessWidget {
  const HomeBottomInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Positioned(
      child: Container(
        height: 200,
        margin: const EdgeInsets.only(
          left: kAppPadding,
          right: kAppPadding,
          top: 550,
        ),
        padding: const EdgeInsets.all(kAppPadding),
        width: double.infinity,
        decoration: BoxDecoration(
          color: kCustomLimeGreen,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  height: 25,
                  child: ListView.builder(
                    itemCount: itemTagFilters.length,
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final item = itemTagFilters[index];
                      return Container(
                        width: 70,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(right: kAppPadding / 2),
                        padding: const EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green.shade300,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(item),
                      );
                    },
                  ),
                ),
                const Spacer(),
                TopAppButton(
                  containerWidth: 30,
                  containerHeight: 30,
                  borderColor: Colors.green.shade500,
                  backgroundColor: Colors.transparent,
                  icon: Icons.more_horiz_outlined,
                  hasShadow: false,
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, AppRouter.itemTagDetailsRoute),
              child: SizedBox(
                width: double.infinity,
                height: 70,
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: kCustomGrey,
                      radius: 25,
                      child: Text(
                        'JK',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.02,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Jeniffer'),
                        Text('84 Kamarajar St'),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        TopAppButton(
                          icon: FontAwesomeIcons.batteryHalf,
                          iconSize: 18,
                          backgroundColor: Colors.transparent,
                          containerHeight: 30,
                          containerWidth: 30,
                          hasShadow: false,
                          borderColor: Colors.green.shade500,
                        ),
                        SizedBox(width: size.width * 0.02),
                        const TopAppButton(
                          icon: FontAwesomeIcons.locationArrow,
                          iconColor: Colors.white,
                          iconSize: 18,
                          backgroundColor: Colors.black,
                          containerHeight: 30,
                          containerWidth: 30,
                          hasShadow: false,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
