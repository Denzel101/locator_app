import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:locator_app/components/components.dart';
import 'package:locator_app/constants/constants.dart';
import 'package:locator_app/home/home.dart';
import 'package:locator_app/router/router.dart';

class HomeBottomInfo extends StatefulWidget {
  const HomeBottomInfo({
    super.key,
  });

  @override
  State<HomeBottomInfo> createState() => _HomeBottomInfoState();
}

class _HomeBottomInfoState extends State<HomeBottomInfo> {
  int selectedIndex = 0;
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
                                return GestureDetector(
                                  onTap: () =>
                                      setState(() => selectedIndex = index),
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
                          CustomCircularButton(
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
                                    InternetImage(
                                      imageUrl: item.imageUrl,
                                      height: 50,
                                      width: 50,
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
                                        CustomCircularButton(
                                          icon: FontAwesomeIcons.batteryHalf,
                                          iconSize: 18,
                                          backgroundColor: Colors.transparent,
                                          containerHeight: 30,
                                          containerWidth: 30,
                                          hasShadow: false,
                                          borderColor: Colors.green.shade500,
                                        ),
                                        SizedBox(width: size.width * 0.02),
                                        const CustomCircularButton(
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
