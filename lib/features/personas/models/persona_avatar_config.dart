class PersonaAvatarConfig {
  const PersonaAvatarConfig({
    required this.seed,
    this.style = 'notionists',
    this.hair = 'variant01',
    this.eyes = 'variant01',
    this.brows = 'variant01',
    this.nose = 'variant01',
    this.lips = 'variant01',
    this.beard,
    this.gesture = 'hand',
    this.clothesVariant = 'variant01',
    this.clothesGraphicVariant = 'electric',
    this.glasses,
  });

  final String seed;
  final String style;

  final String hair;
  final String eyes;
  final String brows;
  final String nose;
  final String lips;
  final String? beard;
  final String? gesture;
  final String clothesVariant;
  final String clothesGraphicVariant;
  final String? glasses;

  static const gestureOptions = [
    'wavePointLongArms',
    'waveOkLongArms',
    'waveLongArms',
    'waveLongArm',
    'pointLongArm',
    'okLongArm',
    'point',
    'ok',
    'hand',
    'handPhone',
  ];

  static const _unset = Object();
  // Creates a copy of this PersonaAvatarConfig with the given fields replaced with new values.
  PersonaAvatarConfig copyWith({
    String? seed,
    String? style,
    String? hair,
    String? eyes,
    String? brows,
    String? nose,
    String? lips,
    Object? beard = _unset,
    Object? gesture = _unset,
    String? clothesVariant,
    String? clothesGraphicVariant,
    Object? glasses = _unset,
  }) {
    return PersonaAvatarConfig(
      seed: seed ?? this.seed,
      style: style ?? this.style,
      hair: hair ?? this.hair,
      eyes: eyes ?? this.eyes,
      brows: brows ?? this.brows,
      nose: nose ?? this.nose,
      lips: lips ?? this.lips,
      beard: identical(beard, _unset) ? this.beard : beard as String?,
      gesture: identical(gesture, _unset) ? this.gesture : gesture as String?,
      clothesVariant: clothesVariant ?? this.clothesVariant,
      clothesGraphicVariant:
          clothesGraphicVariant ?? this.clothesGraphicVariant,
      glasses: identical(glasses, _unset) ? this.glasses : glasses as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'seed': seed,
      'style': style,
      'hair': hair,
      'eyes': eyes,
      'brows': brows,
      'nose': nose,
      'lips': lips,
      'beard': beard,
      'gesture': gesture,
      'clothesVariant': clothesVariant,
      'clothesGraphicVariant': clothesGraphicVariant,
      'glasses': glasses,
    };
  }

  factory PersonaAvatarConfig.fromJson(Map<String, dynamic> json) {
    return PersonaAvatarConfig(
      seed: json['seed'] as String? ?? 'default',
      style: json['style'] as String? ?? 'notionists',
      hair: json['hair'] as String? ?? 'variant01',
      eyes: json['eyes'] as String? ?? 'variant01',
      brows: json['brows'] as String? ?? 'variant01',
      nose: json['nose'] as String? ?? 'variant01',
      lips: json['lips'] as String? ?? 'variant01',
      beard: json['beard'] as String?,
      gesture: json.containsKey('gesture') && json['gesture'] == null
          ? null
          : gestureOptions.contains(json['gesture'])
          ? json['gesture'] as String
          : 'hand',
      clothesVariant: json['clothesVariant'] as String? ?? 'variant01',
      clothesGraphicVariant: json['clothesGraphicVariant'] == 'variant01'
          ? 'electric'
          : json['clothesGraphicVariant'] as String? ?? 'electric',
      glasses: json['glasses'] as String?,
    );
  }
}
