import 'persona_avatar_config.dart';

class Persona {
  const Persona({
    required this.id,
    required this.name,
    required this.personality,
    required this.moralAlignment,
    required this.purpose,
    required this.speechStyle,
    required this.createdAt,
    required this.avatar,
  });

  final String id;
  final String name;
  final String personality;
  final String moralAlignment;
  final String purpose;
  final String speechStyle;
  final DateTime createdAt;

  final PersonaAvatarConfig avatar;

  Persona copyWith({
    String? id,
    String? name,
    String? personality,
    String? moralAlignment,
    String? purpose,
    String? speechStyle,
    DateTime? createdAt,
    PersonaAvatarConfig? avatar,
  }) {
    return Persona(
      id: id ?? this.id,
      name: name ?? this.name,
      personality: personality ?? this.personality,
      moralAlignment: moralAlignment ?? this.moralAlignment,
      purpose: purpose ?? this.purpose,
      speechStyle: speechStyle ?? this.speechStyle,
      createdAt: createdAt ?? this.createdAt,
      avatar: avatar ?? this.avatar,
    );
  }

  factory Persona.create({
    required String name,
    required String personality,
    required String moralAlignment,
    required String purpose,
    required String speechStyle,
    required PersonaAvatarConfig avatar,
  }) {
    final createdAt = DateTime.now();
    return Persona(
      id: createdAt.microsecondsSinceEpoch.toString(),
      name: name.trim(),
      personality: personality,
      moralAlignment: moralAlignment,
      purpose: purpose,
      speechStyle: speechStyle,
      createdAt: createdAt,
      avatar: avatar,
    );
  }

  factory Persona.fromJson(Map<String, dynamic> json) {
    return Persona(
      id: json['id'] as String,
      name: json['name'] as String,
      personality: json['personality'] as String,
      moralAlignment: json['moralAlignment'] as String,
      purpose: json['purpose'] as String,
      speechStyle: json['speechStyle'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      avatar: json['avatar'] != null
          ? PersonaAvatarConfig.fromJson(json['avatar'] as Map<String, dynamic>)
          : PersonaAvatarConfig(
              seed: json['id'] as String,
              style: 'notionists',
            ),
    );
  }

  Map<String, Object> toJson() => {
    'id': id,
    'name': name,
    'personality': personality,
    'moralAlignment': moralAlignment,
    'purpose': purpose,
    'speechStyle': speechStyle,
    'createdAt': createdAt.toIso8601String(),
    'avatar': avatar.toJson(),
  };
}

abstract final class PersonaOptions {
  static const personalities = ['pessimistic', 'friendly', 'pragmatic', 'numb'];

  static const moralAlignments = [
    'neutral-evil',
    'chaotic-good',
    'neutral-neutral',
    'lawful-neutral',
  ];

  static const purposes = [
    'personal-gain',
    'peace-and-love',
    'wisdom',
    'clarity',
  ];

  static const speechStyles = ['narcissist', 'hopeful', 'gentle', 'direct'];
}
