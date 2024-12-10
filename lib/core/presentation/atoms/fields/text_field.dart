import 'package:flutter/material.dart';

import '../style/colors.dart';
import '../style/text_style.dart';
import '../text/p_text.dart';
import '../utils/gap.dart';

class PTextField extends StatefulWidget {
  final Icon? icon;
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final TextStyle? style;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputAction? textInputAction;

  const PTextField({
    super.key,
    this.icon,
    this.controller,
    this.hintText,
    this.labelText,
    this.keyboardType,
    this.obscureText = false,
    this.style,
    this.contentPadding,
    this.textInputAction,
  });

  factory PTextField.password({
    Key? key,
    TextEditingController? controller,
    String? hintText,
    String? labelText,
    TextStyle? style,
    EdgeInsetsGeometry? contentPadding,
    TextInputAction? textInputAction,
  }) {
    return PTextField(
      key: key,
      controller: controller,
      hintText: hintText,
      labelText: labelText,
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      style: style,
      contentPadding: contentPadding,
      textInputAction: textInputAction,
    );
  }

  @override
  State<PTextField> createState() => _PTextFieldState();
}

class _PTextFieldState extends State<PTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.labelText != null)
          PText.body2Regular(widget.labelText ?? ""),
        if (widget.labelText != null) const Gap(5),
        SizedBox(
          height: 50,
          child: TextField(
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            obscureText: widget.obscureText,
            style: body1Regular.copyWith(color: black[950]),
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: body1Regular.copyWith(color: natural[300]),
              prefixIcon: widget.icon,
              contentPadding:
                  widget.contentPadding ?? const EdgeInsets.all(16.0),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: natural[300]!),
                borderRadius: BorderRadius.circular(5.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(color: bluePothan[700]!),
              ),
              fillColor: natural[50],
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(color: natural[300]!),
              ),
            ),
            textInputAction: widget.textInputAction,
          ),
        ),
      ],
    );
  }
}
