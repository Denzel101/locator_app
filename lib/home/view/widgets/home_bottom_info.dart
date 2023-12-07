import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:locator_app/components/components.dart';
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
      child: ClipPath(
        clipper: CustomClipPath(),
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
          child: BlocBuilder<FetchLocationCubit, FetchLocationState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: SizedBox.shrink,
                error: (result) => Center(
                  child: Text(result),
                ),
                loading: () => const LoadingWidget(),
                loaded: (result) {
                  if (result.data.items.isEmpty) {
                    return const Center(
                      child: Text('No people or items to display yet 😊'),
                    );
                  }
                  return Column(
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
                                late var selectedIndex = 0;
                                return GestureDetector(
                                  onTap: () {
                                    selectedIndex = index;
                                  },
                                  child: Container(
                                    width: 70,
                                    alignment: Alignment.center,
                                    margin: const EdgeInsets.only(
                                      right: kAppPadding / 2,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 2,
                                      horizontal: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF95f500),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      item,
                                      style: TextStyle(
                                        color: selectedIndex == index
                                            ? Colors.black
                                            : Colors.grey,
                                      ),
                                    ),
                                  ),
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
                      Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          physics: const BouncingScrollPhysics(),
                          itemCount: result.data.items.length,
                          itemBuilder: (context, index) {
                            final item = result.data.items[index];
                            return GestureDetector(
                              onTap: () => Navigator.pushNamed(
                                context,
                                AppRouter.itemTagDetailsRoute,
                                arguments: item,
                              ),
                              child: SizedBox(
                                width: double.infinity,
                                height: 70,
                                child: Row(
                                  children: [
                                    ExtendedImage.network(
                                      width: 50,
                                      height: 50,
                                      item.imageUrl,
                                      border: Border.all(color: kCustomGrey),
                                      shape: BoxShape.circle,
                                      fit: BoxFit.fill,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(30),
                                      ),
                                      loadStateChanged:
                                          (ExtendedImageState state) {
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
                                      width: size.width * 0.02,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(item.itemName),
                                        Text(
                                          item.currentLocation.streetName,
                                          style: TextStyle(
                                            color: Colors.grey.shade700,
                                          ),
                                        ),
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
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
