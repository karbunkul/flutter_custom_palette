import 'package:flutter/widgets.dart';

enum PaletteMode { light, dark }

typedef SchemaBuilder<T> = Widget Function(BuildContext context, T? palette);
