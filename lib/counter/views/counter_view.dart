import 'package:flutter/material.dart';
import 'package:flutter_mvvm_stacked_template/app/app.dart';
import 'package:flutter_mvvm_stacked_template/counter/counter.dart';
import 'package:flutter_mvvm_stacked_template/l10n/l10n.dart';
import 'package:stacked/stacked.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    // Use a .nonReactive here to ensure we don't rebuild the whole
    // widget. The ViewModelBuilder here is used for nothing more
    // other than to instantiate the ViewModel. To make reactive
    // rebuilds, separate your widgets into individual ViewModelWidgets.
    return ViewModelBuilder<CounterViewModel>.nonReactive(
      viewModelBuilder: CounterViewModel.new,
      onModelReady: (viewModel) => viewModel.initialise(),
      builder: (context, viewModel, child) {
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
                    ImageButton(),
                    SizedBox(width: 8),
                    ApiButton(),
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
                child: const Icon(Icons.add),
              ),
              const SizedBox(height: 8),
              FloatingActionButton(
                onPressed: viewModel.decrement,
                child: const Icon(Icons.remove),
              ),
            ],
          ),
        );
      },
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
    showPlatformDialog(
      context,
      title: 'Copied count value',
      content: 'Just kidding I was too lazy to write code for this',
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
