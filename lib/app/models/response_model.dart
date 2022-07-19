import 'package:flutter_mvvm_stacked_template/app/app.dart';

enum ResponseStatus {
  success,
  error,
}

class ResponseModel<T> {
  const ResponseModel({
    this.data,
    this.error,
    required this.status,
  });

  factory ResponseModel.success(T? data) {
    return ResponseModel(
      data: data,
      status: ResponseStatus.success,
    );
  }

  factory ResponseModel.error(ErrorModel? error) {
    return ResponseModel(
      error: error ?? ErrorModel(),
      status: ResponseStatus.error,
    );
  }

  final T? data;
  final ErrorModel? error;
  final ResponseStatus status;

  bool get hasError => status == ResponseStatus.error;
  bool get hasData => data != null;
  bool get isSuccess => status == ResponseStatus.success;

  ResponseModel<T> copyWith(
    T? data,
    ErrorModel? error,
    ResponseStatus? status,
  ) {
    return ResponseModel(
      data: data ?? this.data,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }
}
