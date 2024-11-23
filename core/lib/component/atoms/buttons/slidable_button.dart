import 'package:core/component/styles/colors.dart';
import 'package:core/component/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:slidable_button/slidable_button.dart';

import '../fields/text.dart';

class GSSlidableButton extends StatelessWidget {
  const GSSlidableButton({
    super.key,
    required this.text,
    this.buttonColor,
    this.color,
    this.buttonWidth,
    required this.onProgress,
    required this.action,
    this.textColor,
  });
  final Color? color;
  final Color? buttonColor;
  final double? buttonWidth;
  final bool onProgress;
  final String text;
  final Color? textColor;
  final Function action;

  @override
  Widget build(BuildContext context) {
    return onProgress
        ? _Progress(
            buttonColor: buttonColor ?? primaryColor500,
            buttonWidth: buttonWidth ?? 46,
            textColor: textColor,
            text: text)
        : _SlidableButton(
            color: color ?? primaryColor200,
            buttonColor: buttonColor,
            text: text,
            action: action,
            textColor: textColor,
          );
  }
}

class _Progress extends StatelessWidget {
  const _Progress({
    Key? key,
    required this.text,
    required this.buttonColor,
    required this.buttonWidth,
    this.textColor,
  }) : super(key: key);
  final Color buttonColor;
  final String text;
  final Color? textColor;
  final double buttonWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Stack(
        children: [
          Center(
              child: GSText(
            text,
            style: bodyStyle.copyWith(color: optionalColor500),
          )),
          Positioned(
            right: 0,
            bottom: 0,
            top: 0,
            child: Container(
              width: buttonWidth,
              decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const SpinKitCircle(
                color: optionalColor500,
                size: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _SlidableButton extends StatelessWidget {
  const _SlidableButton(
      {Key? key,
      required this.color,
      required this.text,
      required this.action,
      this.textColor,
      required this.buttonColor})
      : super(key: key);
  final Color? color;
  final String text;
  final Color? buttonColor;
  final Color? textColor;
  final Function action;

  @override
  Widget build(BuildContext context) {
    return HorizontalSlidableButton(
        color: color ?? primaryColor200,
        width: MediaQuery.of(context).size.width / 1,
        height: 42,
        buttonColor: buttonColor ?? primaryColor500,
        dismissible: false,
        borderRadius: BorderRadius.circular(5),
        label: const Center(
            child: Icon(
          Icons.arrow_forward,
          color: optionalColor500,
        )),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GSText(
                text,
                style: bodyStyle.copyWith(color: textColor ?? optionalColor500),
              )
            ],
          ),
        ),
        onChanged: (position) async {
          if (position == SlidableButtonPosition.end) {
            action();
          }
        });
  }
}
