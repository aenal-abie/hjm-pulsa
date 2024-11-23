import 'package:core/component/atoms/fields/text.dart';
import 'package:core/component/styles/colors.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../styles/style.dart';

class GSTextField extends StatefulWidget {
  final String? hint;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final bool? capitalWord;
  final bool? enable;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? padding;
  final ValueChanged<String>? onChange;
  final VoidCallback? onSubmitted;
  final int? minLines;
  final TextInputAction? textInputAction;
  final int? maxLines;
  final int? maxLength;
  final Color? maxLengthColor;
  final bool? currencyFormat;
  final bool? numericOnly;

  const GSTextField(
    this.hint, {
    Key? key,
    this.controller,
    this.textInputType,
    this.capitalWord = false,
    this.prefixIcon,
    this.suffixIcon,
    this.enable,
    this.padding,
    this.maxLength,
    this.maxLengthColor,
    this.currencyFormat,
    this.onChange,
    this.onSubmitted,
    this.minLines,
    this.maxLines,
    this.textInputAction,
    this.numericOnly,
  }) : super(key: key);

  @override
  State<GSTextField> createState() => _GSTextFieldState();
}

class _GSTextFieldState extends State<GSTextField> {
  var textLength = 0;
  var defaultPadding =
      const EdgeInsets.symmetric(vertical: 11.0, horizontal: 10.0);
  final CurrencyTextInputFormatter currencyTextInputFormatter =
      CurrencyTextInputFormatter.currency(
          symbol: "", decimalDigits: 0, locale: "id_ID");

  @override
  Widget build(BuildContext context) {
    if (widget.maxLength != null) {
      defaultPadding = const EdgeInsets.fromLTRB(10.0, 10.0, 10, 10.0);
    }
    return widget.maxLength != null
        ? Stack(
            children: [
              textFormField,
              maxLengthLabel(widget.maxLengthColor),
            ],
          )
        : textFormField;
  }

  Widget get textFormField => TextFormField(
        inputFormatters: <TextInputFormatter>[
          if (widget.currencyFormat ?? false) currencyTextInputFormatter,
          if (widget.numericOnly ?? false)
            FilteringTextInputFormatter.allow(RegExp(r"^\d+\.?\d{0,2}")),
        ],
        textInputAction: widget.textInputAction,
        onChanged: (value) {
          setState(() {
            textLength = value.length;
          });
          if (widget.onChange != null) {
            widget.onChange!(value);
          }
        },
        maxLength: widget.maxLength,
        controller: widget.controller,
        textCapitalization: widget.capitalWord ?? false
            ? TextCapitalization.words
            : TextCapitalization.none,
        decoration: InputDecoration(
          filled: true,
          counterText: "",
          isDense: true,
          enabled: widget.enable ?? true,
          hintText: widget.hint,
          hintStyle: bodyStyle.copyWith(color: neutralColor200),
          contentPadding: widget.padding ?? defaultPadding,
          labelStyle: GoogleFonts.poppins(color: neutralColor200, fontSize: 12),
          fillColor: neutralColor50,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none,
          ),
          suffixIcon: widget.suffixIcon ?? widget.suffixIcon,
          prefixIconConstraints:
              const BoxConstraints(minWidth: 24, maxHeight: 24),
          prefixIcon: widget.prefixIcon ?? widget.prefixIcon,
          suffixIconConstraints:
              const BoxConstraints(minWidth: 24, maxHeight: 24),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide.none,
          ),
        ),
        keyboardType: widget.textInputType ?? TextInputType.text,
        minLines: widget.minLines,
        maxLines: widget.maxLines,
        style: bodyStyle,
        onFieldSubmitted: (val) async {
          if (widget.onSubmitted != null) {
            widget.onSubmitted!();
          }
        },
      );

  Widget maxLengthLabel(Color? maxLengthColor) => Positioned(
      right: 10,
      bottom: 10,
      child: GSText(
        '${textLength.toString()}/${widget.maxLength.toString()}',
        style: bodySmallStyle.copyWith(
          fontSize: 10,
          color: maxLengthColor ?? neutralColor200,
        ),
      ));
}
