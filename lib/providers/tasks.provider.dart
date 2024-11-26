import 'package:flutter_debug/database/database.dart';
import 'package:flutter_debug/models/task.model.dart';
import 'package:flutter_debug/utils/custom_error.util.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tasks.provider.g.dart';

@riverpod
Future<List<TaskModel>> tasks(Ref ref) async {
  final db = ref.watch(dbProvider);

  try {
    final result = await db.tasksDao.getTasks();
    return result
        .map(
          (task) => TaskModel(
            name: task.title,
            description: task.description,
          ),
        )
        .toList();
  } catch (e) {
    print("----------------");
    print("Error:");
    print(e);
    print("----------------");
    throw const AppError(message: "Something went wrong");
  }
}
