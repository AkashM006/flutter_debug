import 'package:drift/drift.dart';
import 'package:flutter_debug/database/database.dart';

class TaskModel {
  final int id;
  final String name;
  final String description;

  const TaskModel({
    this.id = -1,
    required this.name,
    required this.description,
  });

  TasksCompanion toCompanion() {
    return TasksCompanion(
      title: Value(name),
      description: Value(description),
    );
  }
}
