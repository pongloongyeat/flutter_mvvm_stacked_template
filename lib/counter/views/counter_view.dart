import 'package:flutter/material.dart';
import 'package:flutter_mvvm_stacked_template/app/app.dart';
import 'package:flutter_mvvm_stacked_template/counter/counter.dart';
import 'package:flutter_mvvm_stacked_template/l10n/l10n.dart';
import 'package:flutter_mvvm_stacked_template/pagination_demo/pagination_demo.dart';

class CounterView extends BaseView<CounterViewModel> {
  const CounterView({super.key});

  @override
  CounterViewModel viewModelBuilder() {
    return CounterViewModel();
  }

  @override
  void onModelReady(BuildContext context, CounterViewModel viewModel) {
    viewModel
      ..initialise()
      ..showPlatformDialog = (title, content) =>
          showPlatformDialog(context, title: title, content: content);
  }

  @override
  Widget builder(BuildContext context, CounterViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.counterAppBarTitle)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CounterText(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                ShowCountButton(),
                SizedBox(width: 8),
                ApiButton(),
                SizedBox(width: 8),
                ImageButton(),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: viewModel.increment,
            heroTag: null,
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: viewModel.decrement,
            heroTag: null,
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

class CounterText extends BaseViewModelWidget<CounterViewModel> {
  const CounterText({super.key});

  @override
  Widget build(BuildContext context, CounterViewModel viewModel) {
    final theme = Theme.of(context);
    final count = viewModel.count;
    return Text('$count', style: theme.textTheme.headline1);
  }
}

class ShowCountButton extends BaseViewModelWidget<CounterViewModel> {
  const ShowCountButton({super.key});

  @override
  Widget build(BuildContext context, CounterViewModel viewModel) {
    return ElevatedButton(
      onPressed: () => showCurrentCount(context, count: viewModel.count),
      child: const Text('Show count'),
    );
  }

  void showCurrentCount(
    BuildContext context, {
    required int count,
  }) {
    showPlatformDialog(
      context,
      title: 'Current count',
      content: count.toString(),
    );
  }
}

class ImageButton extends BaseViewModelWidget<CounterViewModel> {
  const ImageButton({super.key});

  @override
  Widget build(BuildContext context, CounterViewModel viewModel) {
    // A sample image showcasing safe asset reference
    return ElevatedButton(
      onPressed: () => onCopyButtonPressed(context),
      child: Image.asset(
        Assets.sample.path,
        color: Colors.white,
      ),
    );
  }

  void onCopyButtonPressed(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) {
          return const PokemonListView();
        },
      ),
    );
  }
}

class ApiButton extends BaseViewModelWidget<CounterViewModel> {
  const ApiButton({super.key});

  @override
  Widget build(BuildContext context, CounterViewModel viewModel) {
    // A sample image showcasing safe asset reference
    return ElevatedButton(
      onPressed: viewModel.callApi,
      child: viewModel.isApiLoading
          ? const SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2,
              ),
            )
          : const Text('Call API'),
    );
  }
}
