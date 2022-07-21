// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter, lines_longer_than_80_chars, non_constant_identifier_names, require_trailing_commas

part of 'pokemon_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PokemonResultModel _$$_PokemonResultModelFromJson(
        Map<String, dynamic> json) =>
    _$_PokemonResultModel(
      count: json['count'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) =>
              PokemonNamedResultModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PokemonResultModelToJson(
        _$_PokemonResultModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'results': instance.results?.map((e) => e.toJson()).toList(),
    };
