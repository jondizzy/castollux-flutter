import 'package:flutter/material.dart';
import 'package:dice_bear/dice_bear.dart';

import '../models/persona_avatar_config.dart';

class PersonaAvatar extends StatelessWidget {
  const PersonaAvatar({super.key, required this.config, this.size = 80});

  final PersonaAvatarConfig config;
  final double size;

  @override
  Widget build(BuildContext context) {
    final request = DiceBearRequest(
      style: DiceBearStyle.notionists,
      coreOptions: DiceBearCoreOptions(seed: config.seed),
    );
    return SizedBox(
      width: size,
      height: size,
      child: ClipOval(
        child: request.toImage(width: size, height: size),
      ),
    );
  }
}
