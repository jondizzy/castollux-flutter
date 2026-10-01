import 'package:flutter/material.dart';

import '../models/persona_avatar_config.dart';
import '../widgets/persona_avatar.dart';

enum AvatarCategory {
  hair,
  eyes,
  brows,
  nose,
  lips,
  beard,
  gesture,
  clothes,
  clothesGraphic,
  glasses,
}

class AvatarEditorScreen extends StatefulWidget {
  const AvatarEditorScreen({super.key, required this.initialConfig});
  final PersonaAvatarConfig initialConfig;

  @override
  State<AvatarEditorScreen> createState() => _AvatarEditorScreenState();
}

class _AvatarEditorScreenState extends State<AvatarEditorScreen> {
  late PersonaAvatarConfig _config;

  AvatarCategory _selectedCategory = AvatarCategory.hair;

  @override
  void initState() {
    super.initState();
    _config = widget.initialConfig;
  }

  void _randomize() {
    setState(() {
      _config = PersonaAvatarConfig(
        seed: DateTime.now().millisecondsSinceEpoch.toString(),
        hair: _randomOption(_hairOptions, DateTime.now().microsecond),
        eyes: _randomOption(_eyesOptions, DateTime.now().microsecond),
        brows: _randomOption(_browsOptions, DateTime.now().microsecond),
        nose: _randomOption(_noseOptions, DateTime.now().microsecond),
        lips: _randomOption(_lipsOptions, DateTime.now().microsecond),
        beard: _randomOption(_beardOptions, DateTime.now().microsecond),
        gesture: _randomOption(
          _gestureOptions,
          DateTime.now().microsecond,
          fallback: 'hand',
        ),
        clothesVariant: _randomOption(_bodyOptions, DateTime.now().microsecond),
        clothesGraphicVariant: _randomOption(
          _bodyIconOptions,
          DateTime.now().microsecond,
          fallback: 'electric',
        ),
        glasses: _randomOption(_glassesOptions, DateTime.now().microsecond),
      );
    });
  }

  String _randomOption(
    List<String> options,
    int value, {
    String fallback = 'variant01',
  }) {
    if (options.isEmpty) {
      return fallback;
    }
    return options[value % options.length];
  }

  void _save() {
    Navigator.of(context).pop(_config);
  }

  static final List<String> _hairOptions = _variants(63);
  static final List<String> _eyesOptions = _variants(5);
  static final List<String> _browsOptions = _variants(13);
  static final List<String> _noseOptions = _variants(20);
  static final List<String> _lipsOptions = _variants(30);
  static final List<String> _beardOptions = _variants(12);
  static final List<String> _glassesOptions = _variants(11);
  static final List<String> _bodyOptions = _variants(25);
  static const List<String> _bodyIconOptions = ['electric', 'galaxy', 'saturn'];
  static const List<String> _gestureOptions = PersonaAvatarConfig.gestureOptions;

  static List<String> _variants(int count) {
    return List.generate(
      count,
      (index) => 'variant${(index + 1).toString().padLeft(2, '0')}',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mirage'),
        actions: [TextButton(onPressed: _save, child: const Text('Save'))],
      ),
      body: SafeArea(
        child: Column(
          children: [
            _buildPreview(),
            _buildCategories(),
            const Divider(height: 1),
            Expanded(child: _buildVariantGrid()),
          ],
        ),
      ),
    );
  }

  Widget _buildPreview() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 20),
      child: Column(
        children: [
          PersonaAvatar(config: _config, size: 190),

          const SizedBox(height: 12),

          IconButton.filledTonal(
            tooltip: 'Imagine',
            onPressed: _randomize,
            icon: const Icon(Icons.casino_outlined),
          ),
        ],
      ),
    );
  }

  Widget _buildCategories() {
    return SizedBox(
      height: 58,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        scrollDirection: Axis.horizontal,
        itemCount: AvatarCategory.values.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final category = AvatarCategory.values[index];
          final selected = category == _selectedCategory;

          return ChoiceChip(
            label: Text(_categoryLabel(category)),
            selected: selected,
            onSelected: (_) {
              setState(() {
                _selectedCategory = category;
              });
            },
          );
        },
      ),
    );
  }

  String _categoryLabel(AvatarCategory category) {
    switch (category) {
      case AvatarCategory.hair:
        return 'Hair';

      case AvatarCategory.eyes:
        return 'Eyes';

      case AvatarCategory.brows:
        return 'Brows';

      case AvatarCategory.nose:
        return 'Nose';

      case AvatarCategory.lips:
        return 'Lips';

      case AvatarCategory.beard:
        return 'Beard';

      case AvatarCategory.gesture:
        return 'Gesture';

      case AvatarCategory.clothes:
        return 'Clothes';

      case AvatarCategory.clothesGraphic:
        return 'Clothes Icon';

      case AvatarCategory.glasses:
        return 'Glasses';
    }
  }

  Widget _buildVariantGrid() {
    final options = _optionsForCategory(_selectedCategory);

    final supportsNone =
        _selectedCategory == AvatarCategory.beard ||
        _selectedCategory == AvatarCategory.glasses;

    final totalItems = options.length + (supportsNone ? 1 : 0);

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: totalItems,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.9,
      ),
      itemBuilder: (context, index) {
        if (supportsNone && index == 0) {
          return _buildNoneTile();
        }

        final optionIndex = index - (supportsNone ? 1 : 0);
        final option = options[optionIndex];
        return _buildVariantTile(option);
      },
    );
  }

  List<String> _optionsForCategory(AvatarCategory category) {
    switch (category) {
      case AvatarCategory.hair:
        return _hairOptions;
      case AvatarCategory.eyes:
        return _eyesOptions;
      case AvatarCategory.brows:
        return _browsOptions;
      case AvatarCategory.nose:
        return _noseOptions;
      case AvatarCategory.lips:
        return _lipsOptions;
      case AvatarCategory.beard:
        return _beardOptions;
      case AvatarCategory.gesture:
        return _gestureOptions;
      case AvatarCategory.clothes:
        return _bodyOptions;
      case AvatarCategory.clothesGraphic:
        return _bodyIconOptions;
      case AvatarCategory.glasses:
        return _glassesOptions;
    }
  }

  Widget _buildVariantTile(String option) {
    final isSelected = _selectedValue() == option;
    final previewConfig = _configForOption(option);

    return Material(
      color: isSelected
          ? Theme.of(context).colorScheme.secondaryContainer
          : Theme.of(context).colorScheme.surfaceContainer,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          _selectOption(option);
        },
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Expanded(child: PersonaAvatar(config: previewConfig, size: 80)),
              const SizedBox(height: 6),
              Text(
                option,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.labelSmall,
              ),
              if (isSelected)
                const Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: Icon(Icons.check_circle, size: 18),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNoneTile() {
    final selected = _selectedValue() == null;
    return Material(
      color: selected
          ? Theme.of(context).colorScheme.secondaryContainer
          : Theme.of(context).colorScheme.surfaceContainer,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: _selectNone,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.block, size: 38),
            const SizedBox(height: 8),
            const Text('None'),

            if (selected) ...[
              const SizedBox(height: 8),
              const Icon(Icons.check_circle, size: 18),
            ],
          ],
        ),
      ),
    );
  }

  String? _selectedValue() {
    switch (_selectedCategory) {
      case AvatarCategory.hair:
        return _config.hair;
      case AvatarCategory.eyes:
        return _config.eyes;
      case AvatarCategory.brows:
        return _config.brows;
      case AvatarCategory.nose:
        return _config.nose;
      case AvatarCategory.lips:
        return _config.lips;
      case AvatarCategory.beard:
        return _config.beard;
      case AvatarCategory.gesture:
        return _config.gesture;
      case AvatarCategory.clothes:
        return _config.clothesVariant;
      case AvatarCategory.clothesGraphic:
        return _config.clothesGraphicVariant;
      case AvatarCategory.glasses:
        return _config.glasses;
    }
  }

  void _selectOption(String option) {
    setState(() {
      switch (_selectedCategory) {
        case AvatarCategory.hair:
          _config = _config.copyWith(hair: option);
          break;
        case AvatarCategory.eyes:
          _config = _config.copyWith(eyes: option);
          break;
        case AvatarCategory.brows:
          _config = _config.copyWith(brows: option);
          break;
        case AvatarCategory.nose:
          _config = _config.copyWith(nose: option);
          break;
        case AvatarCategory.lips:
          _config = _config.copyWith(lips: option);
          break;
        case AvatarCategory.beard:
          _config = _config.copyWith(beard: option);
          break;
        case AvatarCategory.gesture:
          _config = _config.copyWith(gesture: option);
          break;
        case AvatarCategory.clothes:
          _config = _config.copyWith(clothesVariant: option);
          break;
        case AvatarCategory.clothesGraphic:
          _config = _config.copyWith(clothesGraphicVariant: option);
          break;
        case AvatarCategory.glasses:
          _config = _config.copyWith(glasses: option);
          break;
      }
    });
  }

  void _selectNone() {
    setState(() {
      switch (_selectedCategory) {
        case AvatarCategory.beard:
          _config = _config.copyWith(beard: null);
          break;
        case AvatarCategory.glasses:
          _config = _config.copyWith(glasses: null);
          break;

        default:
          break;
      }
    });
  }

  PersonaAvatarConfig _configForOption(String option) {
    switch (_selectedCategory) {
      case AvatarCategory.hair:
        return _config.copyWith(hair: option);

      case AvatarCategory.eyes:
        return _config.copyWith(eyes: option);

      case AvatarCategory.brows:
        return _config.copyWith(brows: option);

      case AvatarCategory.nose:
        return _config.copyWith(nose: option);

      case AvatarCategory.lips:
        return _config.copyWith(lips: option);

      case AvatarCategory.beard:
        return _config.copyWith(beard: option);

      case AvatarCategory.gesture:
        return _config.copyWith(gesture: option);

      case AvatarCategory.clothes:
        return _config.copyWith(clothesVariant: option);

      case AvatarCategory.clothesGraphic:
        return _config.copyWith(clothesGraphicVariant: option);

      case AvatarCategory.glasses:
        return _config.copyWith(glasses: option);
    }
  }
}
