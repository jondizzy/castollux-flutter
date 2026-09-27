import 'package:flutter/material.dart';

import '../models/persona.dart';

class PersonaFormScreen extends StatefulWidget {
  const PersonaFormScreen({super.key});

  @override
  State<PersonaFormScreen> createState() => _PersonaFormScreenState();
}

class _PersonaFormScreenState extends State<PersonaFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  String? _personality;
  String? _moralAlignment;
  String? _purpose;
  String? _speechStyle;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _save() {
    if (!_formKey.currentState!.validate()) return;

    Navigator.of(context).pop(
      Persona.create(
        name: _nameController.text,
        personality: _personality!,
        moralAlignment: _moralAlignment!,
        purpose: _purpose!,
        speechStyle: _speechStyle!,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New persona')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
          children: [
            Text(
              'Identity and disposition',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            TextFormField(
              key: const ValueKey('persona-name'),
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                hintText: 'This is...',
              ),
              textCapitalization: TextCapitalization.words,
              validator: (value) =>
                  value == null || value.trim().isEmpty ? 'Enter a name' : null,
            ),
            const SizedBox(height: 16),
            _TraitDropdown(
              key: const ValueKey('personality-dropdown'),
              label: 'Personality',
              hint: 'Choose an energy type',
              options: PersonaOptions.personalities,
              value: _personality,
              onChanged: (value) => setState(() => _personality = value),
            ),
            const SizedBox(height: 16),
            _TraitDropdown(
              key: const ValueKey('moral-alignment-dropdown'),
              label: 'Moral alignment',
              hint: 'Choose a moral compass',
              options: PersonaOptions.moralAlignments,
              value: _moralAlignment,
              onChanged: (value) => setState(() => _moralAlignment = value),
            ),
            const SizedBox(height: 16),
            _TraitDropdown(
              key: const ValueKey('purpose-dropdown'),
              label: 'Purpose',
              hint: 'Choose a purpose or dream',
              options: PersonaOptions.purposes,
              value: _purpose,
              onChanged: (value) => setState(() => _purpose = value),
            ),
            const SizedBox(height: 16),
            _TraitDropdown(
              key: const ValueKey('speech-style-dropdown'),
              label: 'Speech style',
              hint: 'Choose a speech style',
              options: PersonaOptions.speechStyles,
              value: _speechStyle,
              onChanged: (value) => setState(() => _speechStyle = value),
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              key: const ValueKey('save-persona'),
              onPressed: _save,
              icon: const Icon(Icons.check),
              label: const Text('Save persona'),
            ),
          ],
        ),
      ),
    );
  }
}

class _TraitDropdown extends StatelessWidget {
  const _TraitDropdown({
    super.key,
    required this.label,
    required this.hint,
    required this.options,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final String hint;
  final List<String> options;
  final String? value;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(labelText: label),
      hint: Text(hint),
      items: [
        for (final option in options)
          DropdownMenuItem(value: option, child: Text(option)),
      ],
      onChanged: onChanged,
      validator: (selection) => selection == null ? 'Choose $label' : null,
    );
  }
}
