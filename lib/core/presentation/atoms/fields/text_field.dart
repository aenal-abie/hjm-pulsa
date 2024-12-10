import 'package:flutter/material.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';

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
  final TextStyle? hintStyle;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputAction? textInputAction;

  final ValueChanged<String>? onChanged;

  const PTextField({
    super.key,
    this.icon,
    this.controller,
    this.hintText,
    this.labelText,
    this.keyboardType,
    this.obscureText = false,
    this.style,
    this.hintStyle,
    this.contentPadding,
    this.textInputAction,
    this.onChanged,
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
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

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
            obscureText: _obscureText,
            onChanged: widget.onChanged,
            style: widget.style ?? body1Regular.copyWith(color: black[950]),
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: widget.hintStyle ??  body1Regular.copyWith(color: natural[300]),
              prefixIcon: widget.icon,
              suffixIcon: widget.obscureText
                  ? IconButton(
                      icon: Icon(
                        color: natural[300],
                        _obscureText
                            ? HeroiconsSolid.eyeSlash
                            : HeroiconsSolid.eye,
                        size: 17,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    )
                  : null,
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
