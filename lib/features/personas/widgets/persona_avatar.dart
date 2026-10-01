import 'package:flutter/material.dart';
import 'package:dice_bear/dice_bear.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/persona_avatar_config.dart';

class PersonaAvatar extends StatelessWidget {
  const PersonaAvatar({super.key, required this.config, this.size = 80});

  final PersonaAvatarConfig config;
  final double size;

  @override
  Widget build(BuildContext context) {
    final request = DiceBearRequest<DiceBearNotionistsOptions>(
      style: DiceBearStyle.notionists,
      coreOptions: DiceBearCoreOptions(seed: config.seed),
      styleOptions: DiceBearNotionistsOptions(
        hair: [config.hair],
        eyes: [config.eyes],
        brows: [config.brows],
        nose: [config.nose],
        lips: [config.lips],
        beard: config.beard != null ? [config.beard!] : null,
        beardProbability: config.beard != null ? 100 : 0,
        gestureProbability: config.gesture != null ? 100 : 0,
        body: [config.clothesVariant],
        bodyIcon: [config.clothesGraphicVariant],
        glasses: config.glasses != null ? [config.glasses!] : null,
        glassesProbability: config.glasses != null ? 100 : 0,
      ),
    );
    // dice_bear 1.0.4 validates gesture names against an incorrect enum.
    // Add the API-supported value after its other options are validated.
    final uri = request.uri.replace(
      queryParameters: {
        ...request.queryParameters,
        if (config.gesture != null) 'gesture': config.gesture!,
      },
    );
    return SizedBox(
      width: size,
      height: size,
      child: SvgPicture.network(
        uri.toString(),
        width: size,
        height: size,
        fit: BoxFit.contain,
        placeholderBuilder: (_) =>
            const Center(child: CircularProgressIndicator()),
        errorBuilder: (_, error, stackTrace) =>
            const Center(child: Icon(Icons.person_outline)),
      ),
    );
  }
}
