import 'package:flutter/material.dart';

import '../style/colors.dart';
import '../style/text_style.dart';
import '../text/p_text.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
          style: ButtonStyle(
            textStyle: WidgetStateProperty.all(
                title1Semibold.copyWith(color: Colors.white)),
            elevation: WidgetStateProperty.all(0),
            backgroundColor: WidgetStateProperty.all(bluePothan[800]!),
            overlayColor: WidgetStateProperty.all(bluePothan[700]!),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  side: BorderSide(width: 1.0, color: bluePothan[800]!)),
            ),
          ),
          onPressed: onPressed,
          child: SizedBox(
            child: PText(
              text,
              style: heading6Regular.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
