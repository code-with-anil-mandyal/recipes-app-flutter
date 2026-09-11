import 'package:flutter/material.dart';

import 'recipe_list_screen.dart';
import 'recipe_search_screen.dart';
import 'settings_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    RecipeListScreen(),
    RecipeSearchScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          HeroMode(enabled: _currentIndex == 0, child: _screens[0]),

          HeroMode(enabled: _currentIndex == 1, child: _screens[1]),

          HeroMode(enabled: _currentIndex == 2, child: _screens[2]),
        ],
      ),

      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },

        backgroundColor: Colors.white,

        indicatorColor: const Color(0xFFFFD21F),

        elevation: 8,

        shadowColor: Colors.black.withValues(alpha: 0.08),

        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,

        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined, color: Colors.black54),
            selectedIcon: Icon(Icons.home_rounded, color: Colors.black),
            label: 'Home',
          ),

          NavigationDestination(
            icon: Icon(Icons.search_outlined, color: Colors.black54),
            selectedIcon: Icon(Icons.search_rounded, color: Colors.black),
            label: 'Search',
          ),

          NavigationDestination(
            icon: Icon(Icons.settings_outlined, color: Colors.black54),
            selectedIcon: Icon(Icons.settings_rounded, color: Colors.black),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
