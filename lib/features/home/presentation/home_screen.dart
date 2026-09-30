import 'package:flutter/material.dart';

import '../../personas/data/persona_store.dart';
import '../../personas/models/persona.dart';
import '../../personas/presentation/persona_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.personaStore});

  final PersonaStore personaStore;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListenableBuilder(
        listenable: personaStore,
        builder: (context, child) {
          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Text('DION', style: Theme.of(context).textTheme.headlineMedium),

              const SizedBox(height: 24),

              const _NewConversationCard(),

              const SizedBox(height: 28),

              Text(
                'The Councils',
                style: Theme.of(context).textTheme.titleLarge,
              ),

              const SizedBox(height: 12),

              _PersonaGrid(
                personas: personaStore.personas,
                personaStore: personaStore,
              ),
            ],
          );
        },
      ),
    );
  }
}

class _NewConversationCard extends StatelessWidget {
  const _NewConversationCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const TextField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText: "What's up?", //next try to randomize this text with a list of prompts
                border: InputBorder.none,
              ),
            ),
            const SizedBox(height: 12),

            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.person_outline),
                ),

                const Spacer(),

                FilledButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_upward),
                  label: const Text('Send'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PersonaGrid extends StatelessWidget {
  const _PersonaGrid({required this.personas, required this.personaStore});

  final List<Persona> personas;
  final PersonaStore personaStore;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: personas.length,
      itemBuilder: (context, index) {
        final persona = personas[index];
        return _PersonaCard(persona: persona, personaStore: personaStore);
      },
    );
  }
}

class _PersonaCard extends StatelessWidget {
  const _PersonaCard({required this.persona, required this.personaStore});

  final Persona persona;
  final PersonaStore personaStore;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => PersonaDetailScreen(
                persona: persona,
                personaStore: personaStore,
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),

              Text(
                persona.name,
                style: Theme.of(context).textTheme.titleMedium,
              ),

              const SizedBox(height: 4),

              Text(
                persona.personality,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
