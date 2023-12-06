import 'package:flutter/material.dart';
import 'package:locator_app/constants/constants.dart';
import 'package:locator_app/home/home.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    Center(
      child: Text('Driving'),
    ),
    Center(
      child: Text('Safety'),
    ),
    Center(
      child: Text('Chat'),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        left: false,
        right: false,
        top: false,
        child: Container(
          margin: const EdgeInsets.only(
            left: kAppPadding,
            right: kAppPadding,
            bottom: kAppPadding,
          ),
          padding: const EdgeInsets.symmetric(horizontal: kAppPadding),
          color: Colors.transparent,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: SizedBox(
              child: BottomNavigationBar(
                currentIndex: _currentIndex,
                selectedItemColor: kCustomBlack,
                unselectedItemColor: Colors.grey.shade500,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white,
                iconSize: 20,
                selectedFontSize: 12,
                elevation: 0,
                onTap: (int index) {
                  setState(() => _currentIndex = index);
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.map_outlined),
                    label: 'Location',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.route_outlined),
                    label: 'Driving',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.safety_check_outlined),
                    label: 'Safety',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.chat_outlined),
                    label: 'Chat',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
    );
  }
}
