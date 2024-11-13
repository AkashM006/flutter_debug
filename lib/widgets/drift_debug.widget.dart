import 'package:flutter/material.dart';
import 'package:flutter_debug/database/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:drift_db_viewer/drift_db_viewer.dart';

class DriftDebugWidget extends ConsumerWidget {
  const DriftDebugWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(dbProvider);

    void onDebug() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => DriftDbViewer(db),
        ),
      );
    }

    return IconButton(
      onPressed: onDebug,
      icon: const Icon(Icons.bug_report),
      color: Theme.of(context).colorScheme.error,
    );
  }
}
