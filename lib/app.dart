import 'package:flutter/material.dart';
import 'package:flutter_debug/models/task.model.dart';
import 'package:flutter_debug/providers/task.provider.dart';
import 'package:flutter_debug/providers/tasks.provider.dart';
import 'package:flutter_debug/widgets/drift_debug.widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onGo() async {
      try {
        // Adding a Task
        const newTask = TaskModel(
          name: "Task E",
          description: "Task E description",
        );

        await ref.read(taskProvider.notifier).addTask(newTask);

        // Deleting a Task
        // await ref.read(taskProvider.notifier).deleteTask(3);

        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Done")),
        );
      } catch (e) {
        print("Error occurred");
      }
    }

    final tasks = ref.watch(tasksProvider);

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
      // body: Center(
      //   child: Text(
      //     "Hello world!",
      //     style: Theme.of(context).textTheme.headlineLarge,
      //   ),
      // ),
      body: Center(
        child: tasks.when(
          data: (data) {
            if (data.isEmpty) return const Text("No Data");

            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(data[index].name),
              ),
            );
          },
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
