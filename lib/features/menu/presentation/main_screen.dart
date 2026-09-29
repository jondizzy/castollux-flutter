import 'package:flutter/material.dart';

import 'homebar.dart';
import '../../personas/presentation/persona_list_screen.dart';
import '../../personas/data/persona_store.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.personaStore});

  final PersonaStore personaStore;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildCurrentScreen(),

      bottomNavigationBar: HomeBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  } //Widget build(BuildContext context)

  Widget _buildCurrentScreen() {
    switch (currentIndex) {
      case 0:
        return const Center(child: Text('Home'));
      case 1:
        return PersonaListScreen(personaStore: widget.personaStore);
      case 2:
        return const Center(child: Text('Chat'));
      default:
        return const SizedBox.shrink();
    }
  } //Widget _buildCurrentScreen()
}
