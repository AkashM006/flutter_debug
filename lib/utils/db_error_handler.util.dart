import 'package:flutter_debug/utils/custom_error.util.dart';

Future<T> handleError<T>(
  Future<T> Function() operation,
  String somethingWentWrongMsgAction,
) async {
  try {
    return await operation();
  } catch (e) {
    if (e is AppError) rethrow;
    throw const AppError(
      message:
          "Something went wrong when executing the query. Please try again later",
    );
  }
}
