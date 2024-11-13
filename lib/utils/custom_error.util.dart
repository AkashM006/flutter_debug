abstract class CustomError {
  final String message;
  const CustomError({required this.message});

  @override
  String toString() => message;
}

class AppError extends CustomError implements Exception {
  const AppError({required super.message});
}
