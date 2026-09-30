import 'package:flutter/material.dart';

class HomeBar extends StatelessWidget {
  const HomeBar({super.key, required this.currentIndex, required this.onTap});

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: onTap,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.chat_bubble_outlined),
          label: 'Chat', //index 0
          selectedIcon: Icon(Icons.chat_bubble),
        ),
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          label: 'Home', //index 1
          selectedIcon: Icon(Icons.home),
        ),
        NavigationDestination(
          icon: Icon(Icons.people_outlined),
          label: 'Councils', //index 2
          selectedIcon: Icon(Icons.people),
        ),
      ],
    );
  }
}
