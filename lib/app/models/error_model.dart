import 'package:flutter_mvvm_stacked_template/app/app.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_model.freezed.dart';
part 'error_model.g.dart';

@freezed
class ErrorModel with _$ErrorModel {
  factory ErrorModel({
    int? errorCode,
    String? errorMessage,
    String? errorCodeDescription,
  }) = _ErrorModel;

  factory ErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorModelFromJson(json);

  ErrorModel._();

  bool get isUnauthorisedError =>
      errorCode == ApiStatusCode.forbidden ||
      errorCode == ApiStatusCode.unauthorised;
}
