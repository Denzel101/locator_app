import 'package:flutter/material.dart';
import 'package:locator_app/components/components.dart';
import 'package:locator_app/constants/constants.dart';
import 'package:locator_app/home/home.dart';

class LastUpdatesWidget extends StatelessWidget {
  const LastUpdatesWidget({
    required this.item,
    super.key,
  });

  final FetchLocationItem item;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomClipPath(),
      child: ExpansionTile(
        childrenPadding: const EdgeInsets.only(
          left: kAppPadding,
          right: kAppPadding,
          bottom: kAppPadding,
        ),
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
          ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: item.locationHistory.length,
            itemBuilder: (context, index) {
              final history = item.locationHistory[index];
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(history.streetName),
                  Text(
                    history.createdAt.iSODateToHm(),
                    style: kTextLabelStyle.copyWith(fontSize: 15),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
