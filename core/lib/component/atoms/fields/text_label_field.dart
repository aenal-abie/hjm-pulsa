import 'package:core/component/atoms/fields/index.dart';
import 'package:core/component/styles/colors.dart';
import 'package:core/component/styles/style.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class GSTextLabelField extends StatefulWidget {
  const GSTextLabelField(
    this.hint, {
    Key? key,
    this.controller,
    this.textInputType,
    this.capitalWord,
    this.prefixIcon,
    this.suffixIcon,
    this.enable,
    this.height,
    this.maxLength,
    this.onChange,
    this.onTap,
    this.maxLines,
    this.currencyFormat,
    this.fillColor,
    this.charOnly,
    this.readOnly,
    this.npwpFormat,
    this.maxLengthColor,
    this.disableColor,
    this.numericOnly,
  }) : super(key: key);
  final String? hint;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final bool? capitalWord;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? enable;
  final double? height;
  final int? maxLength;
  final bool? readOnly;
  final ValueChanged<String>? onChange;
  final GestureTapCallback? onTap;
  final int? maxLines;
  final Color? maxLengthColor;
  final bool? currencyFormat;
  final bool? charOnly;
  final bool? numericOnly;
  final bool? npwpFormat;
  final Color? fillColor;
  final Color? disableColor;

  @override
  State<GSTextLabelField> createState() => _GSTextLabelFieldState();
}

class _GSTextLabelFieldState extends State<GSTextLabelField> {
  var textLength = 0;
  final CurrencyTextInputFormatter currencyTextInputFormatter =
  CurrencyTextInputFormatter.currency(
      symbol: "", decimalDigits: 0, locale: "id_ID");

  final MaskTextInputFormatter npwpFormatter = MaskTextInputFormatter(
      mask: '##.###.###.#-###.###',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.eager);

  final FocusNode _focusNode = FocusNode();
  double _topContentPadding = 10;

  @override
  void initState() {
    super.initState();
    initTopContentPadding();
    setFocusNode();
  }

  void initTopContentPadding() {
    setState(() {
      _topContentPadding = (widget.maxLines ?? 1) > 1 ? 0 : 10;
    });
  }

  void setFocusNode() {
    _focusNode.addListener(() {
      setState(() {
        if (_focusNode.hasFocus) {
          _topContentPadding = 10;
        } else if (textLength == 0 && (widget.maxLines ?? 1) > 1) {
          _topContentPadding = 0;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.maxLength != null
        ? Stack(
            children: [
              textFormField(),
              maxLengthLabel(widget.maxLengthColor),
            ],
          )
        : textFormField();
  }

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

  Widget textFormField() => SizedBox(
        height: widget.height ?? 44,
        child: TextFormField(
          focusNode: _focusNode,
          inputFormatters: <TextInputFormatter>[
            if (widget.currencyFormat ?? false) currencyTextInputFormatter,
            if (widget.npwpFormat ?? false) npwpFormatter,
            if (widget.charOnly ?? false)
              FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z\s]")),
            if (widget.numericOnly ?? false)
              FilteringTextInputFormatter.allow(RegExp(r"^\d+\.?\d{0,2}")),
          ],
          maxLines: widget.maxLines ?? 1,
          onChanged: (value) {
            setState(() {
              textLength = value.length;
            });
            widget.onChange!((widget.currencyFormat ?? false)
                ? value.replaceAll(".", "")
                : value);
          },
          controller: widget.controller,
          textCapitalization: (widget.capitalWord ?? false)
              ? TextCapitalization.words
              : TextCapitalization.none,
          onTap: widget.onTap,
          readOnly: widget.readOnly ?? false,
          maxLength: widget.maxLength,
          decoration: InputDecoration(
            alignLabelWithHint: widget.maxLines != null ? true : false,
            enabled: widget.enable ?? true,
            counterText: "",
            filled: true,
            isDense: true,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            suffixIconConstraints:
                const BoxConstraints(minWidth: 24, maxHeight: 24),
            prefixIconConstraints:
                const BoxConstraints(minWidth: 24, maxHeight: 24),
            labelText: widget.hint,
            hintStyle: bodySmallStyle,
            contentPadding: EdgeInsets.only(
                left: 10, right: 10, top: _topContentPadding, bottom: 8),
            labelStyle: bodyStyle.copyWith(color: neutralColor200),
            fillColor: widget.fillColor ?? neutralColor50,
            focusedBorder: const UnderlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide.none),
            border: const UnderlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide.none),
          ),
          keyboardType: (widget.currencyFormat ?? false)
              ? TextInputType.number
              : widget.textInputType ?? TextInputType.text,
          style: bodyStyle.copyWith(
            color: widget.disableColor ??
                (widget.enable == false ? neutralColor200 : neutralColor500),
          ),
        ),
      );

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}
