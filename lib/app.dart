import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_debug/database/database.dart';
import 'package:flutter_debug/widgets/drift_debug.widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onGo() {
      try {
        const newTask = TasksCompanion(
          title: Value("Take out trash"),
          description:
              Value("Take out the trash and wait for the collector to pick up"),
        );

        ref.read(dbProvider).tasksDao.insertTask(newTask);
      } catch (e) {
        print("Error occurred");
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: const [
          DriftDebugWidget(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onGo,
        child: const Icon(Icons.air_outlined),
      ),
      body: Center(
        child: Text(
          "Hello world!",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
