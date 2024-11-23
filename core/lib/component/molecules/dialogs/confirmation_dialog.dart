import 'package:core/component/atoms/buttons/index.dart';
import 'package:core/component/atoms/fields/index.dart';
import 'package:core/component/atoms/gap.dart';
import 'package:core/component/styles/colors.dart';
import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  final String? title;
  final String? textMessage;
  final Function? submit;
  final Function? cancel;
  final String? cancelLabel;
  final String? submitLabel;
  final Widget? widgetMessage;
  final Color? submitButtonColor;
  final Color? cancelOutlinedColor;
  final Widget? submitButton;

  const ConfirmationDialog({
    Key? key,
    this.cancel,
    this.submit,
    this.textMessage,
    this.title,
    this.widgetMessage,
    this.cancelLabel,
    this.submitLabel,
    this.submitButtonColor,
    this.cancelOutlinedColor,
    this.submitButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 15),
          GSText.headingSevenMedium(title),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: widgetMessage ??
                GSText.body(
                  textMessage,
                  textAlign: TextAlign.center,
                ),
          ),
          const SizedBox(height: 20),
          IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: [
                  Expanded(
                      child: _cancelButton(context,
                          cancelOutlinedColor: cancelOutlinedColor)),
                  Expanded(
                    child: submitButton ??
                        _submitButton(context,
                            submitButtonColor: submitButtonColor),
                  ),
                ],
              ),
            ),
          ),
          const GSGap(15)
        ],
      ),
    );
  }

  Widget _cancelButton(BuildContext context, {Color? cancelOutlinedColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GSOutlinedButton(
        buttonSize: ButtonSize.small,
        borderSideColor: cancelOutlinedColor ?? errorColor500,
        textColor: cancelOutlinedColor ?? errorColor500,
        onPress: cancel as Function(),
        text: cancelLabel ?? "Batal",
      ),
    );
  }

  Widget _submitButton(BuildContext context, {Color? submitButtonColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GSPrimaryButton(
        buttonSize: ButtonSize.small,
        primaryColor: submitButtonColor ?? primaryColor500,
        onPress: submit as Function(),
        text: submitLabel ?? "Konfirmasi",
      ),
    );
  }
}
