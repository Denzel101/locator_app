import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: GoogleMap(
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
        ],
      ),
    );
  }
}
