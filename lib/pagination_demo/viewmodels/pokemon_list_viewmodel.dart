import 'package:flutter_mvvm_stacked_template/app/app.dart';
import 'package:flutter_mvvm_stacked_template/pagination_demo/pagination_demo.dart';

class PokemonListViewModel extends PaginatedViewModel {
  bool hasDataReachedEnd = false;
  List<PokemonNamedResultModel> data = [];

  final repository = PokemonListRepository();

  @override
  void initialise() {
    loadData();
  }

  @override
  Future<void> loadData() async {
    setBusy(true);

    final response = await repository.fetchPokemons(ApiDefaults.defaultTake, 0);

    if (response.hasData && response.data!.results != null) {
      data = response.data!.results!.toList();
      hasDataReachedEnd =
          response.data!.results?.length == response.data!.count;
    }

    setBusy(false);
  }

  @override
  Future<void> loadMoreData() async {
    if (hasDataReachedEnd) {
      return;
    }

    setBusy(true);

    final response = await repository.fetchPokemons(
      ApiDefaults.defaultTake,
      currentPage * ApiDefaults.defaultTake,
    );

    if (response.hasData && response.data!.results != null) {
      data.addAll(response.data!.results!);
      hasDataReachedEnd =
          response.data!.results?.length == response.data!.count;
    }

    setBusy(false);
  }
}
