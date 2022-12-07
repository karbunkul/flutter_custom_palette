import 'package:custom_palette/palette.dart';
import 'package:flutter/material.dart';

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

  MaterialColor get material {
    final color = value;

    return MaterialColor(
      color.value,
      <int, Color>{
        50: const Color(0xFFFFF8E1),
        100: const Color(0xFFFFECB3),
        200: const Color(0xFFFFE082),
        300: const Color(0xFFFFD54F),
        400: const Color(0xFFFFCA28),
        500: color,
        600: const Color(0xFFFFB300),
        700: const Color(0xFFFFA000),
        800: const Color(0xFFFF8F00),
        900: const Color(0xFFFF6F00),
      },
    );
  }
}
