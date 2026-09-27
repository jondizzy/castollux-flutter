import 'package:castollux/features/personas/data/persona_store.dart';
import 'package:castollux/features/personas/presentation/persona_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('creates and opens a persona', (tester) async {
    SharedPreferences.setMockInitialValues({});
    final store = PersonaStore(await SharedPreferences.getInstance());
    await store.load();

    await tester.pumpWidget(
      MaterialApp(home: PersonaListScreen(personaStore: store)),
    );

    await tester.tap(find.byTooltip('Create persona'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(const ValueKey('persona-name')), 'Mira');

    await _selectOption(tester, 'personality-dropdown', 'friendly');
    await _selectOption(tester, 'moral-alignment-dropdown', 'chaotic-good');
    await _selectOption(tester, 'purpose-dropdown', 'wisdom');
    await _selectOption(tester, 'speech-style-dropdown', 'gentle');

    await tester.tap(find.byKey(const ValueKey('save-persona')));
    await tester.pumpAndSettle();

    expect(find.text('Mira'), findsOneWidget);
    await tester.tap(find.text('Mira'));
    await tester.pumpAndSettle();
    expect(find.text('chaotic-good'), findsOneWidget);
    expect(find.text('gentle'), findsOneWidget);
  });
}

Future<void> _selectOption(
  WidgetTester tester,
  String dropdownKey,
  String option,
) async {
  await tester.tap(find.byKey(ValueKey(dropdownKey)));
  await tester.pumpAndSettle();
  await tester.tap(find.text(option).last);
  await tester.pumpAndSettle();
}