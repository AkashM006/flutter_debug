import 'package:flutter/material.dart';
import 'package:flutter_debug/widgets/drift_debug.widget.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: const [
          DriftDebugWidget(),
        ],
      ),
      body: Center(
        child: Text(
          "Home",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
