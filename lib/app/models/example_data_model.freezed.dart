// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'example_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ExampleDataModel _$ExampleDataModelFromJson(Map<String, dynamic> json) {
  return _ExampleDataModel.fromJson(json);
}

/// @nodoc
mixin _$ExampleDataModel {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int? get weight => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExampleDataModelCopyWith<ExampleDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExampleDataModelCopyWith<$Res> {
  factory $ExampleDataModelCopyWith(
          ExampleDataModel value, $Res Function(ExampleDataModel) then) =
      _$ExampleDataModelCopyWithImpl<$Res>;
  $Res call({int? id, String? name, int? weight});
}

/// @nodoc
class _$ExampleDataModelCopyWithImpl<$Res>
    implements $ExampleDataModelCopyWith<$Res> {
  _$ExampleDataModelCopyWithImpl(this._value, this._then);

  final ExampleDataModel _value;
  // ignore: unused_field
  final $Res Function(ExampleDataModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? weight = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      weight: weight == freezed
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_ExampleDataModelCopyWith<$Res>
    implements $ExampleDataModelCopyWith<$Res> {
  factory _$$_ExampleDataModelCopyWith(
          _$_ExampleDataModel value, $Res Function(_$_ExampleDataModel) then) =
      __$$_ExampleDataModelCopyWithImpl<$Res>;
  @override
  $Res call({int? id, String? name, int? weight});
}

/// @nodoc
class __$$_ExampleDataModelCopyWithImpl<$Res>
    extends _$ExampleDataModelCopyWithImpl<$Res>
    implements _$$_ExampleDataModelCopyWith<$Res> {
  __$$_ExampleDataModelCopyWithImpl(
      _$_ExampleDataModel _value, $Res Function(_$_ExampleDataModel) _then)
      : super(_value, (v) => _then(v as _$_ExampleDataModel));

  @override
  _$_ExampleDataModel get _value => super._value as _$_ExampleDataModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? weight = freezed,
  }) {
    return _then(_$_ExampleDataModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      weight: weight == freezed
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ExampleDataModel implements _ExampleDataModel {
  _$_ExampleDataModel({this.id, this.name, this.weight});

  factory _$_ExampleDataModel.fromJson(Map<String, dynamic> json) =>
      _$$_ExampleDataModelFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final int? weight;

  @override
  String toString() {
    return 'ExampleDataModel(id: $id, name: $name, weight: $weight)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ExampleDataModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.weight, weight));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(weight));

  @JsonKey(ignore: true)
  @override
  _$$_ExampleDataModelCopyWith<_$_ExampleDataModel> get copyWith =>
      __$$_ExampleDataModelCopyWithImpl<_$_ExampleDataModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ExampleDataModelToJson(
      this,
    );
  }
}

abstract class _ExampleDataModel implements ExampleDataModel {
  factory _ExampleDataModel(
      {final int? id,
      final String? name,
      final int? weight}) = _$_ExampleDataModel;

  factory _ExampleDataModel.fromJson(Map<String, dynamic> json) =
      _$_ExampleDataModel.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  int? get weight;
  @override
  @JsonKey(ignore: true)
  _$$_ExampleDataModelCopyWith<_$_ExampleDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}
