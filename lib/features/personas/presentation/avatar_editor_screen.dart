import 'package:flutter/material.dart';

import '../models/persona_avatar_config.dart';
import '../widgets/persona_avatar.dart';

class AvatarEditorScreen extends StatefulWidget {
  const AvatarEditorScreen({super.key, required this.initialConfig});
  final PersonaAvatarConfig initialConfig;

  @override
  State<AvatarEditorScreen> createState() => _AvatarEditorScreenState();
}

class _AvatarEditorScreenState extends State<AvatarEditorScreen> {
  late PersonaAvatarConfig config;

  @override
  void initState() {
    super.initState();
    config = widget.initialConfig;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mirage'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(config);
            },
            child: const Text('Save'),
          ),
        ],
      ),
      body: Center(child: PersonaAvatar(config: config, size: 180)),
    );
  }
}
