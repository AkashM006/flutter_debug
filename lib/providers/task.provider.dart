import 'package:flutter_debug/database/database.dart';
import 'package:flutter_debug/models/task.model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'task.provider.g.dart';

@riverpod
class Task extends _$Task {
  @override
  void build() {}

  Future<void> addTask(TaskModel task) async {
    try {
      await ref.read(dbProvider).tasksDao.insertTask(task.toCompanion());
    } catch (e) {
      print("Error occurred;");
    }
  }

  Future<void> deleteTask(int id) async {
    try {
      await ref.read(dbProvider).tasksDao.deleteTask(id);
    } catch (e) {
      print("Error occurred;");
    }
  }
}
