import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Essentially just overrides the [CupertinoDialogAction].
/// The class is renamed to ensure we don't make code look
/// confusing when dealing with platform-based dialogs.
class DialogAction extends CupertinoDialogAction {
  const DialogAction({
    super.key,
    super.isDefaultAction,
    super.isDestructiveAction,
    required super.onPressed,
    required super.child,
  });
}

class GeneralHelper {
  const GeneralHelper._();

  static Future<void> showPlatformDialog(
    BuildContext context, {
    required String title,
    required String content,
    bool isDismissable = true,
    List<DialogAction> actions = const [],
  }) {
    if (Platform.isAndroid) {
      return _showAndroidDialog(
        context,
        title: title,
        content: content,
        isDismissable: isDismissable,
        actions: actions,
      );
    }

    if (Platform.isIOS) {
      return _showIosDialog(
        context,
        title: title,
        content: content,
        isDismissable: isDismissable,
        actions: actions,
      );
    }

    throw UnsupportedError('This platform is not supported');
  }

  static Future<void> _showAndroidDialog(
    BuildContext context, {
    required String title,
    required String content,
    bool isDismissable = true,
    List<DialogAction> actions = const [],
  }) async {
    final androidActions = actions
        .map(
          (e) => TextButton(
            onPressed: e.onPressed,
            child: e.child,
          ),
        )
        .toList();

    return showDialog(
      context: context,
      barrierDismissible: isDismissable,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: androidActions,
        );
      },
    );
  }

  static Future<void> _showIosDialog(
    BuildContext context, {
    required String title,
    required String content,
    bool isDismissable = true,
    List<DialogAction> actions = const [],
  }) async {
    return showCupertinoDialog(
      context: context,
      barrierDismissible: isDismissable,
      builder: (dialogContext) {
        return CupertinoAlertDialog(
          title: Text(title),
          content: Text(content),
          actions: actions,
        );
      },
    );
  }
}
