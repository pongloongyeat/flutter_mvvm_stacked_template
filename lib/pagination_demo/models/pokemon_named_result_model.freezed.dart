// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pokemon_named_result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PokemonNamedResultModel _$PokemonNamedResultModelFromJson(
    Map<String, dynamic> json) {
  return _PokemonNamedResultModel.fromJson(json);
}

/// @nodoc
mixin _$PokemonNamedResultModel {
  String? get name => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PokemonNamedResultModelCopyWith<PokemonNamedResultModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonNamedResultModelCopyWith<$Res> {
  factory $PokemonNamedResultModelCopyWith(PokemonNamedResultModel value,
          $Res Function(PokemonNamedResultModel) then) =
      _$PokemonNamedResultModelCopyWithImpl<$Res>;
  $Res call({String? name, String? url});
}

/// @nodoc
class _$PokemonNamedResultModelCopyWithImpl<$Res>
    implements $PokemonNamedResultModelCopyWith<$Res> {
  _$PokemonNamedResultModelCopyWithImpl(this._value, this._then);

  final PokemonNamedResultModel _value;
  // ignore: unused_field
  final $Res Function(PokemonNamedResultModel) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_PokemonNamedResultModelCopyWith<$Res>
    implements $PokemonNamedResultModelCopyWith<$Res> {
  factory _$$_PokemonNamedResultModelCopyWith(_$_PokemonNamedResultModel value,
          $Res Function(_$_PokemonNamedResultModel) then) =
      __$$_PokemonNamedResultModelCopyWithImpl<$Res>;
  @override
  $Res call({String? name, String? url});
}

/// @nodoc
class __$$_PokemonNamedResultModelCopyWithImpl<$Res>
    extends _$PokemonNamedResultModelCopyWithImpl<$Res>
    implements _$$_PokemonNamedResultModelCopyWith<$Res> {
  __$$_PokemonNamedResultModelCopyWithImpl(_$_PokemonNamedResultModel _value,
      $Res Function(_$_PokemonNamedResultModel) _then)
      : super(_value, (v) => _then(v as _$_PokemonNamedResultModel));

  @override
  _$_PokemonNamedResultModel get _value =>
      super._value as _$_PokemonNamedResultModel;

  @override
  $Res call({
    Object? name = freezed,
    Object? url = freezed,
  }) {
    return _then(_$_PokemonNamedResultModel(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PokemonNamedResultModel implements _PokemonNamedResultModel {
  _$_PokemonNamedResultModel({this.name, this.url});

  factory _$_PokemonNamedResultModel.fromJson(Map<String, dynamic> json) =>
      _$$_PokemonNamedResultModelFromJson(json);

  @override
  final String? name;
  @override
  final String? url;

  @override
  String toString() {
    return 'PokemonNamedResultModel(name: $name, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PokemonNamedResultModel &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.url, url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(url));

  @JsonKey(ignore: true)
  @override
  _$$_PokemonNamedResultModelCopyWith<_$_PokemonNamedResultModel>
      get copyWith =>
          __$$_PokemonNamedResultModelCopyWithImpl<_$_PokemonNamedResultModel>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PokemonNamedResultModelToJson(
      this,
    );
  }
}

abstract class _PokemonNamedResultModel implements PokemonNamedResultModel {
  factory _PokemonNamedResultModel({final String? name, final String? url}) =
      _$_PokemonNamedResultModel;

  factory _PokemonNamedResultModel.fromJson(Map<String, dynamic> json) =
      _$_PokemonNamedResultModel.fromJson;

  @override
  String? get name;
  @override
  String? get url;
  @override
  @JsonKey(ignore: true)
  _$$_PokemonNamedResultModelCopyWith<_$_PokemonNamedResultModel>
      get copyWith => throw _privateConstructorUsedError;
}
