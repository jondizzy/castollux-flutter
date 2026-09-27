import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/castollux_app.dart';
import 'features/personas/data/persona_store.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final preferences = await SharedPreferences.getInstance();
  final personaStore = PersonaStore(preferences);
  await personaStore.load();

  runApp(CastolluxApp(personaStore: personaStore));
}