import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:locator_app/components/components.dart';
import 'package:locator_app/constants/constants.dart';
import 'package:locator_app/home/home.dart';

class ItemTagDetailsScreen extends StatelessWidget {
  const ItemTagDetailsScreen({required this.item, super.key});

  final FetchLocationItem item;

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
            const CustomCircularButton(
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
            const CustomCircularButton(
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
                CustomCircularButton(
                  icon: Icons.keyboard_arrow_left_rounded,
                  iconSize: 30,
                  onTap: () => Navigator.pop(context),
                ),
                Text(
                  item.itemName,
                  style: kTextLabelStyle.copyWith(fontSize: 20),
                ),
                const CustomCircularButton(
                  icon: FontAwesomeIcons.locationArrow,
                  iconColor: Colors.white,
                  backgroundColor: Colors.black,
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            ExtendedImage.network(
              width: 160,
              height: 160,
              item.imageUrl,
              border: Border.all(color: kCustomGrey),
              shape: BoxShape.circle,
              fit: BoxFit.fill,
              borderRadius: const BorderRadius.all(
                Radius.circular(30),
              ),
              loadStateChanged: (ExtendedImageState state) {
                switch (state.extendedImageLoadState) {
                  case LoadState.completed:
                    return state.completedWidget;
                  case LoadState.failed:
                    return const Icon(
                      Icons.image_not_supported_rounded,
                    );
                  case LoadState.loading:
                    return const LoadingWidget();
                }
              },
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
                  const CustomCircularButton(
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
                    child: Text(
                      item.itemId.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.04,
                  ),
                  const CustomCircularButton(
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
            ClipPath(
              clipper: CustomClipPath(),
              child: Container(
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
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(item.currentLocation.streetName),
                        Text(
                          'Since '
                          '${item.currentLocation.createdAt.iSODateToHm()}',
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
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            LastUpdatesWidget(item: item),
          ],
        ),
      ),
    );
  }
}
