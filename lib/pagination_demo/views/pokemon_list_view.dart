import 'package:flutter/material.dart';
import 'package:flutter_mvvm_stacked_template/app/app.dart';
import 'package:flutter_mvvm_stacked_template/pagination_demo/pagination_demo.dart';

class PokemonListView extends BaseView<PokemonListViewModel> {
  const PokemonListView({super.key});

  static final controller = ScrollController();

  @override
  PokemonListViewModel viewModelBuilder() {
    return PokemonListViewModel();
  }

  @override
  void onModelReady(BuildContext context, PokemonListViewModel viewModel) {
    viewModel
      ..initialise()
      ..showPlatformDialog = (title, content) =>
          showPlatformDialog(context, title: title, content: content);

    controller.addListener(() {
      if (controller.offset > 0.8 * controller.position.maxScrollExtent) {
        viewModel.onScrollThresholdExceeded();
      }
    });
  }

  @override
  Widget builder(BuildContext context, PokemonListViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagination demo'),
      ),
      body: SafeArea(
        child: PokemonListing(controller),
      ),
    );
  }
}

class PokemonListing extends BaseViewModelWidget<PokemonListViewModel> {
  const PokemonListing(this.controller, {super.key});

  final ScrollController controller;

  @override
  Widget build(BuildContext context, PokemonListViewModel viewModel) {
    if (viewModel.data.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return RefreshIndicator(
      onRefresh: viewModel.refreshData,
      child: ListView.builder(
        controller: controller,
        // +1 here to show the loading indicator at the bottom
        itemCount: viewModel.data.length + 1,
        itemBuilder: (context, index) {
          if (index == viewModel.data.length) {
            if (viewModel.hasDataReachedEnd) {
              return Container();
            }

            return const Center(child: CircularProgressIndicator());
          }

          final data = viewModel.data[index];

          return ListTile(
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('${index + 1}')],
            ),
            title: Text('${data.name}'),
            onTap: () => viewModel.showPokemonDetails(index),
          );
        },
      ),
    );
  }
}
