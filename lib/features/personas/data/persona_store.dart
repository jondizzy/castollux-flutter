import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/persona.dart';

class PersonaStore extends ChangeNotifier {
  PersonaStore(this._preferences);

  static const _storageKey = 'personas';

  final SharedPreferences _preferences;
  List<Persona> _personas = [];

  List<Persona> get personas => List.unmodifiable(_personas);

  Future<void> load() async {
    final encoded = _preferences.getString(_storageKey);
    if (encoded == null) return;

    final records = jsonDecode(encoded) as List<dynamic>;
    _personas = records
        .map((record) => Persona.fromJson(record as Map<String, dynamic>))
        .toList();
  }

  Future<void> add(Persona persona) async {
    _personas = [..._personas, persona];
    await _persist();
    notifyListeners();
  }

  Future<void> delete(String id) async {
    _personas = _personas.where((persona) => persona.id != id).toList();
    await _persist();
    notifyListeners();
  }

  Future<void> _persist() async {
    final records = _personas.map((persona) => persona.toJson()).toList();
    await _preferences.setString(_storageKey, jsonEncode(records));
  }
}