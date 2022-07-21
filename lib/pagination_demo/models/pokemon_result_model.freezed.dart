// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pokemon_result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PokemonResultModel _$PokemonResultModelFromJson(Map<String, dynamic> json) {
  return _PokemonResultModel.fromJson(json);
}

/// @nodoc
mixin _$PokemonResultModel {
  int? get count => throw _privateConstructorUsedError;
  List<PokemonNamedResultModel>? get results =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PokemonResultModelCopyWith<PokemonResultModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonResultModelCopyWith<$Res> {
  factory $PokemonResultModelCopyWith(
          PokemonResultModel value, $Res Function(PokemonResultModel) then) =
      _$PokemonResultModelCopyWithImpl<$Res>;
  $Res call({int? count, List<PokemonNamedResultModel>? results});
}

/// @nodoc
class _$PokemonResultModelCopyWithImpl<$Res>
    implements $PokemonResultModelCopyWith<$Res> {
  _$PokemonResultModelCopyWithImpl(this._value, this._then);

  final PokemonResultModel _value;
  // ignore: unused_field
  final $Res Function(PokemonResultModel) _then;

  @override
  $Res call({
    Object? count = freezed,
    Object? results = freezed,
  }) {
    return _then(_value.copyWith(
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      results: results == freezed
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<PokemonNamedResultModel>?,
    ));
  }
}

/// @nodoc
abstract class _$$_PokemonResultModelCopyWith<$Res>
    implements $PokemonResultModelCopyWith<$Res> {
  factory _$$_PokemonResultModelCopyWith(_$_PokemonResultModel value,
          $Res Function(_$_PokemonResultModel) then) =
      __$$_PokemonResultModelCopyWithImpl<$Res>;
  @override
  $Res call({int? count, List<PokemonNamedResultModel>? results});
}

/// @nodoc
class __$$_PokemonResultModelCopyWithImpl<$Res>
    extends _$PokemonResultModelCopyWithImpl<$Res>
    implements _$$_PokemonResultModelCopyWith<$Res> {
  __$$_PokemonResultModelCopyWithImpl(
      _$_PokemonResultModel _value, $Res Function(_$_PokemonResultModel) _then)
      : super(_value, (v) => _then(v as _$_PokemonResultModel));

  @override
  _$_PokemonResultModel get _value => super._value as _$_PokemonResultModel;

  @override
  $Res call({
    Object? count = freezed,
    Object? results = freezed,
  }) {
    return _then(_$_PokemonResultModel(
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      results: results == freezed
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<PokemonNamedResultModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PokemonResultModel implements _PokemonResultModel {
  _$_PokemonResultModel(
      {this.count, final List<PokemonNamedResultModel>? results})
      : _results = results;

  factory _$_PokemonResultModel.fromJson(Map<String, dynamic> json) =>
      _$$_PokemonResultModelFromJson(json);

  @override
  final int? count;
  final List<PokemonNamedResultModel>? _results;
  @override
  List<PokemonNamedResultModel>? get results {
    final value = _results;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PokemonResultModel(count: $count, results: $results)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PokemonResultModel &&
            const DeepCollectionEquality().equals(other.count, count) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(count),
      const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  _$$_PokemonResultModelCopyWith<_$_PokemonResultModel> get copyWith =>
      __$$_PokemonResultModelCopyWithImpl<_$_PokemonResultModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PokemonResultModelToJson(
      this,
    );
  }
}

abstract class _PokemonResultModel implements PokemonResultModel {
  factory _PokemonResultModel(
      {final int? count,
      final List<PokemonNamedResultModel>? results}) = _$_PokemonResultModel;

  factory _PokemonResultModel.fromJson(Map<String, dynamic> json) =
      _$_PokemonResultModel.fromJson;

  @override
  int? get count;
  @override
  List<PokemonNamedResultModel>? get results;
  @override
  @JsonKey(ignore: true)
  _$$_PokemonResultModelCopyWith<_$_PokemonResultModel> get copyWith =>
      throw _privateConstructorUsedError;
}
