import 'package:flutter/material.dart';

import '../data/persona_store.dart';
import '../models/persona.dart';
import 'persona_detail_screen.dart';
import 'persona_form_screen.dart';

class PersonaListScreen extends StatelessWidget {
  const PersonaListScreen({super.key, required this.personaStore});

  final PersonaStore personaStore;

  Future<void> _createPersona(BuildContext context) async {
    final persona = await Navigator.of(context).push<Persona>(
      MaterialPageRoute(builder: (_) => const PersonaFormScreen()),
    );
    if (persona != null) await personaStore.add(persona);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Castollux')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _createPersona(context),
        tooltip: 'Create persona',
        child: const Icon(Icons.add),
      ),
      body: AnimatedBuilder(
        animation: personaStore,
        builder: (context, _) {
          final personas = personaStore.personas;
          if (personas.isEmpty) return const _EmptyPersonas();

          return ListView(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 96),
            children: [
              Text(
                'CHARACTER INDEX',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                  letterSpacing: 1.4,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'The Selves',
                style: Theme.of(context).textTheme.headlineLarge
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 24),
              for (final persona in personas)
                _PersonaRow(
                  persona: persona,
                  onTap: () => Navigator.of(context).push<void>(
                    MaterialPageRoute(
                      builder: (_) => PersonaDetailScreen(
                        persona: persona,
                        personaStore: personaStore,
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _PersonaRow extends StatelessWidget {
  const _PersonaRow({required this.persona, required this.onTap});

  final Persona persona;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 8),
          onTap: onTap,
          title: Text(
            persona.name,
            style: Theme.of(context).textTheme.titleLarge
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text('${persona.personality}  ·  ${persona.purpose}'),
          ),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        ),
        const Divider(height: 1),
      ],
    );
  }
}

class _EmptyPersonas extends StatelessWidget {
  const _EmptyPersonas();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.person_outline,
              size: 40,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 16),
            Text(
              'No personas yet',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            const Text('Create a persona to begin your character index.'),
          ],
        ),
      ),
    );
  }
}
