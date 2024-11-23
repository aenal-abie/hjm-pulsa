import 'package:core/component/molecules/dialogs/sucess_dialog.dart';
import 'package:flutter/material.dart';

import 'confirmation_dialog.dart';
import 'info_dialog.dart';

class GSDialog {
  static void confirmationDialog(
    BuildContext context, {
    required String title,
    String? textMessage,
    Widget? widgetMessage,
    required Function cancelPressed,
    String? cancelLabel,
    bool? barrierDismissible,
    required Function submitPressed,
    String? submitLabel,
    Color? submitButtonColor,
    Color? cancelOutlinedColor,
    Widget? submitButton,
  }) {
    showDialog(
        barrierDismissible: barrierDismissible ?? true,
        context: context,
        builder: (context) {
          return ConfirmationDialog(
            title: title ?? "",
            widgetMessage: widgetMessage,
            textMessage: textMessage,
            cancelLabel: cancelLabel,
            submitLabel: submitLabel,
            cancel: cancelPressed,
            submit: submitPressed,
            cancelOutlinedColor: cancelOutlinedColor,
            submitButtonColor: submitButtonColor,
            submitButton: submitButton,
          );
        });
  }

  static void successDialog(BuildContext context,
      {String? textMessage, bool? barrierDismissible, Function? submitBtn}) {
    showDialog(
        barrierDismissible: barrierDismissible ?? true,
        context: context,
        builder: (context) {
          return GSSuccessDialog(
            textMessage: textMessage,
            submit: submitBtn!,
          );
        });
  }

  static void showModalBottomSheetDialog(BuildContext context, Widget body) {
    showModalBottomSheet(
        isDismissible: true,
        enableDrag: true,
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.white,
        builder: (context) {
          return body;
        });
  }

  static void showInfoDialog(BuildContext context, String message,
      {String? buttonText, VoidCallback? onConfirm}) {
    showDialog(
        context: context,
        builder: (_) => InfoDialogWidget(
              message: message,
              buttonText: buttonText,
              onConfirm: onConfirm,
            ));
  }
}
