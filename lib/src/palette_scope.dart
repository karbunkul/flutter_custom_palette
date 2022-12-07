import 'package:flutter/widgets.dart';

class PaletteScope<T> extends InheritedWidget {
  final ValueChanged<T> change;
  const PaletteScope({
    required this.change,
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  static PaletteScope<T> of<T>(BuildContext context) {
    final PaletteScope<T>? result =
        context.dependOnInheritedWidgetOfExactType<PaletteScope<T>>();
    assert(result != null, 'No PaletteScope found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(PaletteScope oldWidget) {
    return false;
  }
}
