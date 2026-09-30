class PersonaAvatarConfig {
  const PersonaAvatarConfig({required this.seed, required this.style});

  final String seed;
  final String style;

  Map<String, dynamic> toJson() {
    return {'seed': seed, 'style': style};
  }

  factory PersonaAvatarConfig.fromJson(Map<String, dynamic> json) {
    return PersonaAvatarConfig(
      seed: json['seed'] as String,
      style: json['style'] as String,
    );
  }
}
