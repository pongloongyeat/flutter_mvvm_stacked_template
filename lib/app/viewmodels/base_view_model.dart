import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_stacked_template/app/app.dart';
import 'package:stacked/stacked.dart' as stacked;

/// Override the BaseViewModel used in [stacked.BaseViewModel]
/// to inherit some generic functionality we want to provide
/// for all screens.
abstract class BaseViewModel extends stacked.BaseViewModel {
  BaseViewModel(this.context);

  /// The BuildContext corresponding to the widget that uses
  /// the current ViewModel. This context should only be set
  /// once and should never be updated again.
  final BuildContext context;

  /// An initialisation method. This does nothing internally.
  void initialise();

  Future<void> showPlatformDialog({
    required String title,
    required String content,
    List<DialogAction> actions = const [],
  }) {
    return GeneralHelper.showPlatformDialog(
      context,
      title: title,
      content: content,
      actions: actions,
    );
  }
}
