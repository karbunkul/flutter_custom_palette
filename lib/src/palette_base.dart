import 'package:custom_palette/palette.dart';
import 'package:flutter/foundation.dart';

class Palette<T> {
  PaletteMode _mode = PaletteMode.light;

  @protected
  PaletteMode get mode {
    final lastMode = _mode;
    _mode = PaletteMode.light;

    return lastMode;
  }

  void _changePaletteMode(PaletteMode mode) {
    _mode = mode;
  }
}

extension PaletteNullableExtension<T> on Palette<T>? {
  T? get dark {
    this?._changePaletteMode(PaletteMode.dark);

    return this as T?;
  }
}

extension PaletteExtension<T> on Palette<T> {
  T get dark {
    _changePaletteMode(PaletteMode.dark);

    return this as T;
  }
}
