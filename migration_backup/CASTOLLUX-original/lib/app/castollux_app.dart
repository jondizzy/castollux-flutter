import 'package:flutter/material.dart';

import '../features/personas/data/persona_store.dart';
import '../features/personas/presentation/persona_list_screen.dart';
import 'theme/app_theme.dart';

class CastolluxApp extends StatelessWidget {
  const CastolluxApp({super.key, required this.personaStore});

  final PersonaStore personaStore;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Castollux',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: PersonaListScreen(personaStore: personaStore),
    );
  }
}
