import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: GoogleMap(
              zoomControlsEnabled: false,
              mapType: MapType.terrain,
              initialCameraPosition: _kInitialPosition,
              onMapCreated: _controller.complete,
              markers: {
                const Marker(
                  markerId: MarkerId('kimathi'),
                  position: _kMapCenter,
                  infoWindow: InfoWindow(
                    title: 'First Community Bank',
                    snippet: 'Kimathi Street Branch',
                  ),
                ),
              },
            ),
          ),
          const Positioned(
            top: 60,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: kAppPadding),
              child: TopAppButton(
                icon: Icons.search_rounded,
              ),
            ),
          ),
          const Positioned(
            top: 60,
            right: 0,
            child: Padding(
              padding: EdgeInsets.only(right: kAppPadding),
              child: TopAppButton(
                icon: Icons.settings_outlined,
              ),
            ),
          ),
          const Positioned(
            top: 300,
            child: Padding(
              padding: EdgeInsets.only(left: kAppPadding),
              child: TopAppButton(
                icon: Icons.add_rounded,
              ),
            ),
          ),
          const Positioned(
            top: 360,
            child: Padding(
              padding: EdgeInsets.only(left: kAppPadding),
              child: TopAppButton(
                icon: Icons.remove_rounded,
              ),
            ),
          ),
          const Positioned(
            top: 420,
            child: Padding(
              padding: EdgeInsets.only(left: kAppPadding),
              child: TopAppButton(
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
