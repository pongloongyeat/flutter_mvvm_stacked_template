import 'package:flutter/material.dart';
import 'package:flutter_mvvm_stacked_template/app/app.dart';
import 'package:stacked/stacked.dart';

mixin BaseViewMixin on Widget {
  Future<void> showPlatformDialog(
    BuildContext context, {
    required String title,
    required String content,
    List<DialogAction> actions = const [],
  }) async {
    await GeneralHelper.showPlatformDialog(
      context,
      title: title,
      content: content,
      actions: actions,
    );
  }
}

abstract class BaseView<T extends ChangeNotifier> extends StatelessWidget
    with BaseViewMixin {
  const BaseView({super.key});

  @override
  @protected
  Widget build(BuildContext context) {
    // Use a .nonReactive here to ensure we don't rebuild the whole
    // widget. The ViewModelBuilder here is used for nothing more
    // other than to instantiate the ViewModel. To make reactive
    // rebuilds, separate your widgets into individual ViewModelWidgets.
    return ViewModelBuilder<T>.nonReactive(
      viewModelBuilder: viewModelBuilder,
      onModelReady: (viewModel) => onModelReady(context, viewModel),
      builder: (context, viewModel, _) => builder(context, viewModel),
    );
  }

  T viewModelBuilder();
  void onModelReady(BuildContext context, T viewModel);
  Widget builder(BuildContext context, T viewModel);
}
