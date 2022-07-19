import 'package:freezed_annotation/freezed_annotation.dart';

part 'example_data_model.freezed.dart';
part 'example_data_model.g.dart';

@freezed
class ExampleDataModel with _$ExampleDataModel {
  factory ExampleDataModel({
    int? id,
    String? name,
    int? weight,
  }) = _ExampleDataModel;

  factory ExampleDataModel.fromJson(Map<String, dynamic> json) =>
      _$ExampleDataModelFromJson(json);
}
