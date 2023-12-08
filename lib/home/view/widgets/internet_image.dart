import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:locator_app/components/components.dart';
import 'package:locator_app/constants/constants.dart';

class InternetImage extends StatelessWidget {
  const InternetImage({
    required this.imageUrl,
    required this.height,
    required this.width,
    super.key,
  });

  final String imageUrl;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ExtendedImage.network(
      width: width,
      height: height,
      imageUrl,
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
    );
  }
}
