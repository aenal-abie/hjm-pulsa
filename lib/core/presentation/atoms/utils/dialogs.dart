import 'package:flutter/material.dart';

import '../buttons/primary_button.dart';
import '../style/colors.dart';
import '../style/text_style.dart';
import '../text/p_text.dart';

void showDialogSuccess(BuildContext context, String message,
    {String title = "Transaksi Sukses", VoidCallback? onPressed}) {
  showDialog(
    context: context,
    builder: (ctx) {
      return AlertDialog(
        title: PText(
          title,
          textAlign: TextAlign.center,
          style: heading4Medium.copyWith(
            color: bluePothan[700],
          ),
        ),
        content: PText.body1Regular(message),
        actions: [
          PrimaryButton(
            onPressed: onPressed ??
                () {
                  Navigator.of(ctx).pop();
                },
            text: 'OK',
          ),
        ],
      );
    },
  );
}
