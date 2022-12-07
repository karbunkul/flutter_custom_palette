import 'package:custom_palette/src/palette_scope.dart';
import 'package:custom_palette/src/palette_types.dart';
import 'package:flutter/widgets.dart';

class PaletteBuilder<T> extends StatefulWidget {
  final SchemaBuilder<T> builder;
  final T? initialData;
  const PaletteBuilder({super.key, required this.builder, this.initialData});

  @override
  State<PaletteBuilder<T>> createState() => _PaletteBuilderState<T>();
}

class _PaletteBuilderState<T> extends State<PaletteBuilder<T>> {
  T? _palette;

  @override
  void initState() {
    _palette = widget.initialData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PaletteScope<T>(
      change: _onChange,
      child: widget.builder(context, _palette),
    );
  }

  void _onChange(T value) {
    if (mounted) {
      setState(() => _palette = value);
    }
  }

  // @override
  // void didUpdateWidget(covariant PaletteBuilder<T> oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   if (widget.initialData != oldWidget.initialData) {
  //     _palette = widget.initialData;
  //   }
  // }
}
