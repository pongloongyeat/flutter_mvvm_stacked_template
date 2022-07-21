import 'package:flutter_mvvm_stacked_template/pagination_demo/pagination_demo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_result_model.freezed.dart';
part 'pokemon_result_model.g.dart';

@freezed
class PokemonResultModel with _$PokemonResultModel {
  factory PokemonResultModel({
    int? count,
    List<PokemonNamedResultModel>? results,
  }) = _PokemonResultModel;

  factory PokemonResultModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonResultModelFromJson(json);
}
