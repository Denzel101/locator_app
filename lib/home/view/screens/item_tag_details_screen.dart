import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:locator_app/constants/constants.dart';
import 'package:locator_app/home/home.dart';

class ItemTagDetailsScreen extends StatelessWidget {
  const ItemTagDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      bottomSheet: Container(
        height: 100,
        width: double.infinity,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TopAppButton(
              icon: Icons.call_outlined,
              iconColor: Colors.white,
              iconSize: 18,
              backgroundColor: kCustomBlack,
              hasShadow: false,
            ),
            SizedBox(
              width: size.width * 0.04,
            ),
            Container(
              width: 150,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: kCustomBlack,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Follow',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              width: size.width * 0.04,
            ),
            const TopAppButton(
              iconColor: Colors.white,
              icon: FontAwesomeIcons.batteryHalf,
              iconSize: 18,
              backgroundColor: kCustomBlack,
              hasShadow: false,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: kAppPadding),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.08,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TopAppButton(
                  icon: Icons.keyboard_arrow_left_rounded,
                  iconSize: 30,
                  onTap: () => Navigator.pop(context),
                ),
                Text(
                  'Jeniffer',
                  style: kTextLabelStyle.copyWith(fontSize: 20),
                ),
                const TopAppButton(
                  icon: FontAwesomeIcons.locationArrow,
                  iconColor: Colors.white,
                  backgroundColor: Colors.black,
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            const CircleAvatar(
              backgroundColor: kCustomLimeGreen,
              radius: 80,
              child: Text(
                'JK',
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TopAppButton(
                    icon: Icons.info_outline_rounded,
                    iconSize: 18,
                    backgroundColor: Colors.transparent,
                    containerHeight: 30,
                    containerWidth: 30,
                    hasShadow: false,
                    borderColor: Colors.grey,
                  ),
                  SizedBox(
                    width: size.width * 0.04,
                  ),
                  Container(
                    width: 100,
                    height: 25,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: kCustomLimeGreen,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'id',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.04,
                  ),
                  const TopAppButton(
                    icon: Icons.chat_outlined,
                    iconSize: 18,
                    backgroundColor: Colors.transparent,
                    containerHeight: 30,
                    containerWidth: 30,
                    hasShadow: false,
                    borderColor: Colors.grey,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              height: 120,
              width: double.infinity,
              padding: const EdgeInsets.all(kAppPadding),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Now is',
                        style: kTextLabelStyle,
                      ),
                      Icon(
                        Icons.location_on_outlined,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('84 Kamarajar St'),
                      Text(
                        'Since 7:54',
                        style: kTextLabelStyle.copyWith(fontSize: 15),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'School',
                        style: kTextLabelStyle.copyWith(fontSize: 13),
                      ),
                      const Text('9 min updated'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            ExpansionTile(
              backgroundColor: Colors.white,
              collapsedBackgroundColor: Colors.white,
              iconColor: kCustomBlack,
              trailing: const TopAppButton(
                icon: Icons.keyboard_arrow_up_rounded,
                iconSize: 18,
                backgroundColor: Colors.transparent,
                containerHeight: 30,
                containerWidth: 30,
                hasShadow: false,
                borderColor: Colors.grey,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              initiallyExpanded: true,
              title: const Text(
                'Last updates',
                style: kTextLabelStyle,
              ),
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('84 Kamarajar St'),
                    Text(
                      '7:54',
                      style: kTextLabelStyle.copyWith(fontSize: 15),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
