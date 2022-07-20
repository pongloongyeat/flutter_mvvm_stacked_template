import 'package:flutter_mvvm_stacked_template/app/app.dart';
import 'package:stacked/stacked.dart' as stacked;

mixin BaseViewModelMixin on stacked.BaseViewModel {
  ShowDialogCallback? showPlatformDialog;
}

/// Override the BaseViewModel used in [stacked.BaseViewModel]
/// to inherit some generic functionality we want to provide
/// for all screens.
abstract class BaseViewModel extends stacked.BaseViewModel
    with BaseViewModelMixin {
  /// An initialisation method. You should initialise any late
  /// variables you have here.
  void initialise();
}
