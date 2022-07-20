import 'package:flutter/material.dart';
import 'package:flutter_mvvm_stacked_template/app/app.dart';

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

abstract class BaseView extends StatelessWidget with BaseViewMixin {
  const BaseView({super.key});

  @override
  Widget build(BuildContext context);
}
