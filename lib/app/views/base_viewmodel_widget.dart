import 'package:flutter/widgets.dart';
import 'package:flutter_mvvm_stacked_template/app/app.dart';
import 'package:stacked/stacked.dart' as stacked;

abstract class BaseViewModelWidget<T extends ChangeNotifier>
    extends stacked.ViewModelWidget<T> with BaseViewMixin {
  const BaseViewModelWidget({super.key});

  @override
  Widget build(BuildContext context, T viewModel);
}
