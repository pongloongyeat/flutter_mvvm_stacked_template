import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_named_result_model.freezed.dart';
part 'pokemon_named_result_model.g.dart';

@freezed
class PokemonNamedResultModel with _$PokemonNamedResultModel {
  factory PokemonNamedResultModel({
    String? name,
    String? url,
  }) = _PokemonNamedResultModel;

  factory PokemonNamedResultModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonNamedResultModelFromJson(json);
}
