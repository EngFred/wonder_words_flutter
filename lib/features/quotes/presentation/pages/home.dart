import 'package:flutter/material.dart';
import 'package:wonder_words/features/auth/utils/shared_preferences_helper.dart';
import 'package:wonder_words/features/profile/presentation/pages/profile.dart';
import 'package:wonder_words/features/quotes/presentation/pages/quotes.dart';
import 'package:wonder_words/injection_container.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final prefs = sl<SharedPreferencesHelper>();
  int destIndex = 0;
  final navbarItems = const <NavigationDestination>[
    NavigationDestination(
      icon: Icon(Icons.format_quote_outlined),
      label: 'Quotes',
      selectedIcon: Icon(Icons.format_quote),
    ),
    NavigationDestination(
      icon: Icon(Icons.person_outline),
      label: 'Profile',
      selectedIcon: Icon(Icons.person),
    ),
  ];

  final pages = const [Quotes(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: _buildBottomNavigationBar(navbarItems),
        body: IndexedStack(
          index: destIndex,
          children: pages,
        ));
  }

  Widget _buildBottomNavigationBar(List<NavigationDestination> destinations) {
    return NavigationBar(
        // backgroundColor: Colors.black,
        // surfaceTintColor: Colors.black,
        // shadowColor: Colors.black,
        selectedIndex: destIndex,
        onDestinationSelected: (index) {
          setState(() {
            destIndex = index;
          });
        },
        destinations: destinations);
  }
}
