import 'package:flutter/material.dart';

import '../data/persona_store.dart';
import '../models/persona.dart';
import '../widgets/persona_avatar.dart';
import '../presentation/avatar_editor_screen.dart';
import '../models/persona_avatar_config.dart';

class PersonaDetailScreen extends StatelessWidget {
  const PersonaDetailScreen({
    super.key,
    required this.persona,
    required this.personaStore,
  });

  final Persona persona;
  final PersonaStore personaStore;

  Future<void> _delete(BuildContext context) async {
    final shouldDelete = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete persona?'),
        content: Text('${persona.name} will be removed from this device.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (shouldDelete == true && context.mounted) {
      await personaStore.delete(persona.id);
      if (context.mounted) Navigator.pop(context);
    }
  }

  Future<void> _editAvatar(BuildContext context, Persona persona) async {
    final updatedAvatar = await Navigator.of(context).push<PersonaAvatarConfig>(
      MaterialPageRoute(
        builder: (_) => AvatarEditorScreen(initialConfig: persona.avatar),
      ),
    );

    if (updatedAvatar == null) {
      return;
    }

    final updatedPersona = persona.copyWith(avatar: updatedAvatar);

    await personaStore.update(updatedPersona);
  }

  @override
  Widget build(BuildContext context) {
    final date = MaterialLocalizations.of(context)
        .formatMediumDate(persona.createdAt);

    return ListenableBuilder(
      listenable: personaStore,
      builder: (context, child) {
        final currentPersona = personaStore.personas.firstWhere(
          (item) => item.id == persona.id,
          orElse: () => persona,
        );
        return Scaffold(
          appBar: AppBar(
            title: Text(currentPersona.name),
            actions: [
              IconButton(
                tooltip: 'Delete persona',
                onPressed: () => _delete(context),
                icon: const Icon(Icons.delete_outline),
              ),
            ],
          ),
          body: ListView(
            padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
            children: [
              Center(
                child: PersonaAvatar(config: currentPersona.avatar, size: 120),
              ),
              const SizedBox(height: 12),
              Text(
                'PERSONALITY',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                  letterSpacing: 1.4,
                  fontWeight: FontWeight.w700,
                ),
              ),

              _TraitRow(label: 'Personality', value: persona.personality),
              _TraitRow(label: 'Morality', value: persona.moralAlignment),
              _TraitRow(label: 'Purpose', value: persona.purpose),
              _TraitRow(label: 'Speech style', value: persona.speechStyle),
              const SizedBox(height: 28),
              Text(
                'CREATED',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                  letterSpacing: 1.4,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Text(date, style: Theme.of(context).textTheme.bodyLarge),
              FilledButton.tonalIcon(
                onPressed: () {
                  _editAvatar(context, currentPersona);
                },
                icon: const Icon(Icons.face_retouching_natural),
                label: const Text('Edit mirage'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _TraitRow extends StatelessWidget {
  const _TraitRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 132,
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodyLarge
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
