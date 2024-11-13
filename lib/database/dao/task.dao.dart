import 'package:drift/drift.dart';
import 'package:flutter_debug/database/database.dart';
import 'package:flutter_debug/database/schema/task.schema.dart';
import 'package:flutter_debug/utils/db_error_handler.util.dart';

part 'task.dao.g.dart';

@DriftAccessor(tables: [Tasks])
class TasksDao extends DatabaseAccessor<AppDatabase> with _$TasksDaoMixin {
  TasksDao(super.db);

  Future<List<Task>> getTasks() async {
    return await select(tasks).get();
  }

  Future<void> insertTask(TasksCompanion task) async {
    handleError(() async {
      await into(tasks).insert(task);
    }, "inserting task");
  }
}
