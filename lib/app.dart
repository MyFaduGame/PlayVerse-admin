import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  // int _selectedIndex = 0;

  NavigationRailDestination getNavigationRailIcon(
    String unselectedIconPath,
    String selectedIconPath,
    String name,
  ) {
    return NavigationRailDestination(
      selectedIcon: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Image.asset(
              color: Colors.white70,
              selectedIconPath,
              scale: 2.8,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white70,
              ),
            ),
          ),
        ],
      ),
      icon: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Image.asset(
              color: Colors.white38,
              unselectedIconPath,
              scale: 2.8,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: Colors.white38,
              ),
            ),
          ),
        ],
      ),
      label: const SizedBox.shrink(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Row(
      children: [],
    ));
  }
}
