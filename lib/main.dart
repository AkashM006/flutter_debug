import 'package:flutter/material.dart';
import 'package:flutter_debug/app.dart';
import 'package:flutter_debug/settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: kSeedColor, brightness: Brightness.light),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: kSeedColor, brightness: Brightness.light),
        useMaterial3: true,
      ),
      home: const App(),
    );
  }
}
