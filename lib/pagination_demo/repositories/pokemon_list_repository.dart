import 'package:flutter_mvvm_stacked_template/app/app.dart';
import 'package:flutter_mvvm_stacked_template/pagination_demo/pagination_demo.dart';

class PokemonListRepository extends BaseRepository {
  final _apiService = PokemonListApiService();

  @override
  PokemonListApiService get apiService => _apiService;

  Future<ResponseModel<PokemonResultModel>> fetchPokemons(
    int limit,
    int offset,
  ) {
    return apiService.fetchPokemons(limit, offset);
  }
}
