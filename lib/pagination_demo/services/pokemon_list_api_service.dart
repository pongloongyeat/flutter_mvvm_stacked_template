import 'package:flutter_mvvm_stacked_template/app/app.dart';
import 'package:flutter_mvvm_stacked_template/pagination_demo/pagination_demo.dart';

class PokemonListApiService extends BaseApiService {
  Future<ResponseModel<PokemonResultModel>> fetchPokemons(
    int limit,
    int offset,
  ) async {
    final response = await callApi(
      HttpRequestType.get,
      'https://pokeapi.co/api/v2/pokemon?limit=$limit&offset=$offset',
    );

    if (!response.hasError && response.hasData) {
      return ResponseModel.success(PokemonResultModel.fromJson(response.data!));
    }

    return ResponseModel.error(response.error);
  }
}
