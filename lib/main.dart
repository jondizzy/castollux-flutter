import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/castollux_app.dart';
import 'features/personas/data/persona_store.dart';
import 'features/menu/presentation/homebar.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final preferences = await SharedPreferences.getInstance();
  final personaStore = PersonaStore(preferences);
  final homeBar = const HomeBar();
  await personaStore.load();

  runApp(CastolluxApp(personaStore: personaStore, homeBar: homeBar));
}
