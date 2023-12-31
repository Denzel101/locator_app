import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:locator_app/components/components.dart';
import 'package:locator_app/constants/constants.dart';
import 'package:locator_app/home/home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng _kMapCenter =
      LatLng(-1.285573259296906, 36.82231921111649);

  static const CameraPosition _kInitialPosition =
      CameraPosition(target: _kMapCenter, zoom: 17);

  final locations = <FetchLocationItem>[];

  @override
  void initState() {
    context.read<FetchLocationCubit>().fetchUserLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: BlocListener<FetchLocationCubit, FetchLocationState>(
              listener: (context, state) {
                state.mapOrNull(
                  loaded: (result) {
                    for (final location in result.response.data.items) {
                      locations.add(
                        FetchLocationItem(
                          itemId: location.itemId,
                          itemName: location.itemName,
                          imageUrl: location.imageUrl,
                          currentLocation: location.currentLocation,
                          locationHistory: location.locationHistory,
                        ),
                      );
                    }
                  },
                );
              },
              child: BlocBuilder<FetchLocationCubit, FetchLocationState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: SizedBox.shrink,
                    error: (result) => Center(
                      child: Text(result),
                    ),
                    loading: () => const LoadingWidget(),
                    loaded: (result) {
                      Set<Marker> createMarkers() {
                        return locations.map((loc) {
                          return Marker(
                            markerId: MarkerId(loc.currentLocation.streetName),
                            position: LatLng(
                              loc.currentLocation.latitude,
                              loc.currentLocation.longitude,
                            ),
                            infoWindow: InfoWindow(
                              title: loc.itemName,
                              snippet: loc.currentLocation.streetName,
                            ),
                          );
                        }).toSet();
                      }

                      return GoogleMap(
                        zoomControlsEnabled: false,
                        mapType: MapType.terrain,
                        initialCameraPosition: _kInitialPosition,
                        onMapCreated: _controller.complete,
                        markers: createMarkers(),
                      );
                    },
                  );
                },
              ),
            ),
          ),
          const Positioned(
            top: 60,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: kAppPadding),
              child: CustomCircularButton(
                icon: Icons.search_rounded,
              ),
            ),
          ),
          const Positioned(
            top: 60,
            right: 0,
            child: Padding(
              padding: EdgeInsets.only(right: kAppPadding),
              child: CustomCircularButton(
                icon: Icons.settings_outlined,
              ),
            ),
          ),
          const Positioned(
            top: 300,
            child: Padding(
              padding: EdgeInsets.only(left: kAppPadding),
              child: CustomCircularButton(
                icon: Icons.add_rounded,
              ),
            ),
          ),
          const Positioned(
            top: 360,
            child: Padding(
              padding: EdgeInsets.only(left: kAppPadding),
              child: CustomCircularButton(
                icon: Icons.remove_rounded,
              ),
            ),
          ),
          const Positioned(
            top: 420,
            child: Padding(
              padding: EdgeInsets.only(left: kAppPadding),
              child: CustomCircularButton(
                icon: FontAwesomeIcons.locationArrow,
              ),
            ),
          ),
          Positioned(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kAppPadding),
              child: Row(
                children: [
                  Expanded(
                    child: AddNewButton(
                      label: 'Add new tag',
                      onTap: () {},
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.04,
                  ),
                  Expanded(
                    child: AddNewButton(
                      label: 'Add new item',
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
          const HomeBottomInfo(),
        ],
      ),
    );
  }
}
