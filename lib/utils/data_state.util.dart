import 'package:flutter_debug/utils/custom_error.util.dart';

abstract class DataState<T> {}

class DataSuccess<T> extends DataState<T> {
  final T data;
  DataSuccess(this.data);

  @override
  String toString() {
    return data.toString();
  }
}

class DataFailure<T> extends DataState<T> {
  final CustomError error;
  DataFailure(this.error);

  @override
  String toString() {
    return error.toString();
  }
}

class DataLoading<T> extends DataState<T> {}

extension DataStateExtension<T> on DataState<T> {
  bool get isLoading => this is DataLoading;

  // Used to set state data
  R fold<R>({
    required R Function(T data) onSuccess,
    required R Function(CustomError error) onFailure,
  }) {
    if (this is DataSuccess<T>) {
      return onSuccess((this as DataSuccess<T>).data);
    }
    return onFailure((this as DataFailure<T>).error);
  }

  // Used to handle UI
  void on({
    required void Function(T data) success,
    required void Function(CustomError error) failed,
    void Function()? loading,
  }) {
    if (this is DataSuccess<T>) {
      return success((this as DataSuccess<T>).data);
    } else if (this is DataFailure<T>) {
      return failed((this as DataFailure<T>).error);
    }

    if (loading != null) loading();
  }
}
