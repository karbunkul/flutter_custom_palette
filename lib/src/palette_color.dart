import 'package:custom_palette/palette.dart';
import 'package:flutter/material.dart';
import 'package:material_color_generator/material_color_generator.dart';

class PaletteColor {
  late Color _light;
  Color? _dark;
  PaletteMode? _mode;

  PaletteColor({
    required Color light,
    Color? dark,
    PaletteMode? mode,
  }) {
    _light = light;
    _dark = dark;
    _mode = mode;
  }

  bool get isDark => _mode == PaletteMode.dark;

  Color get value {
    if (isDark) {
      return _dark ?? _light;
    }

    return _light;
  }

  MaterialColor get material => generateMaterialColor(color: value);
}
