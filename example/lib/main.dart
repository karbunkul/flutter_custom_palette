import 'package:custom_palette/palette.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class CustomPalette extends Palette<CustomPalette> {
  final Color lightColor;
  final Color darkColor;

  CustomPalette({required this.lightColor, required this.darkColor});
  PaletteColor get appBar {
    return PaletteColor(
      light: Colors.white,
      dark: Colors.black87,
      mode: mode,
    );
  }

  PaletteColor get primary {
    return PaletteColor(light: lightColor, dark: darkColor, mode: mode);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return PaletteBuilder<CustomPalette>(
      initialData: CustomPalette(
        lightColor: const Color(0xFFffcf4c),
        darkColor: Colors.teal,
      ),
      builder: (context, palette) {
        return MaterialApp(
          home: const DemoPage(),
          themeMode: ThemeMode.system,
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              backgroundColor: palette?.appBar.value,
              foregroundColor: palette?.dark.appBar.value,
              elevation: 0,
            ),
            // primarySwatch: palette?.primary.material,
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: palette?.primary.value,
            ),
          ),
          darkTheme: ThemeData(
            appBarTheme: AppBarTheme(
              foregroundColor: palette?.appBar.material,
              elevation: 0,
            ),
            brightness: Brightness.dark,
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: palette?.dark.primary.value,
            ),
          ),
        );
      },
    );
  }
}

class DemoPage extends StatelessWidget {
  const DemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Palette demo'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          PaletteScope.of<CustomPalette>(context).change(
            CustomPalette(lightColor: Colors.indigo, darkColor: Colors.red),
          );
        },
        child: const Icon(Icons.palette),
      ),
    );
  }
}
