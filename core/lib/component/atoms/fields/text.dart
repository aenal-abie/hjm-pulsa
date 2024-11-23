import 'package:flutter/material.dart';

import '../../styles/style.dart';

class GSText extends StatelessWidget {
  final String? text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const GSText(this.text,
      {Key? key, this.style, this.textAlign, this.maxLines, this.overflow})
      : super(key: key);

  factory GSText.displayOne(String? text, {Key? key}) {
    return GSText(text, key: key, style: display1Style);
  }

  factory GSText.displayTwo(String? text, {Key? key}) {
    return GSText(text, key: key, style: display2Style);
  }

  factory GSText.headingOne(String? text, {Key? key}) {
    return GSText(text, key: key, style: heading1Style);
  }

  factory GSText.headingTwo(String? text, {Key? key}) {
    return GSText(text, key: key, style: heading2Style);
  }

  factory GSText.headingThree(String? text, {Key? key}) {
    return GSText(text, key: key, style: heading3Style);
  }

  factory GSText.headingFour(String? text, {Key? key}) {
    return GSText(text, key: key, style: heading4Style);
  }

  factory GSText.headingFive(String? text, {Key? key}) {
    return GSText(text, key: key, style: heading5Style);
  }

  factory GSText.headingSix(String? text, {Key? key}) {
    return GSText(text, key: key, style: heading6Style);
  }

  factory GSText.headingSixMedium(String? text, {Key? key, Color? color}) {
    return GSText(
      text,
      key: key,
      style: heading6Style.copyWith(fontWeight: FontWeight.w600, color: color),
    );
  }

  factory GSText.headingSixSemiBold(String? text, {Key? key}) {
    return GSText(
      text,
      key: key,
      style: heading6Style.copyWith(
        fontWeight: FontWeight.w600,
      ),
    );
  }

  factory GSText.headingSixBold(String? text, {Key? key}) {
    return GSText(
      text,
      key: key,
      style: heading6Style.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  factory GSText.headingSeven(String? text,
      {Key? key,
      Color? color,
      TextAlign? textAlign,
      int? maxLines,
      TextOverflow? overflow}) {
    return GSText(
      text,
      key: key,
      maxLines: maxLines,
      overflow: overflow,
      style: heading7Style.copyWith(color: color),
      textAlign: textAlign,
    );
  }

  factory GSText.headingSevenMedium(String? text,
      {Key? key,
      Color? color,
      TextAlign? textAlign,
      int? maxLines,
      TextOverflow? overflow}) {
    return GSText(
      text,
      maxLines: maxLines,
      overflow: overflow,
      key: key,
      textAlign: textAlign,
      style: heading7Style.copyWith(fontWeight: FontWeight.w600, color: color),
    );
  }

  factory GSText.headingSevenSemiBold(String? text, {Key? key}) {
    return GSText(
      text,
      key: key,
      style: heading7Style.copyWith(
        fontWeight: FontWeight.w600,
      ),
    );
  }

  factory GSText.headingSevenBold(String? text, {Key? key}) {
    return GSText(
      text,
      key: key,
      style: heading7Style.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  factory GSText.body(
    String? text, {
    Key? key,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return GSText(
      text,
      key: key,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: bodyStyle.copyWith(color: color),
    );
  }

  factory GSText.bodyMedium(
    String? text, {
    Key? key,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return GSText(
      text,
      key: key,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: bodyStyle.copyWith(
        fontWeight: FontWeight.w600, // Medium
        color: color,
      ),
    );
  }

  factory GSText.bodySemiBold(
    String? text, {
    Key? key,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return GSText(
      text,
      key: key,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: bodyStyle.copyWith(
        fontWeight: FontWeight.w600,
        color: color,
      ),
    );
  }

  factory GSText.bodyBold(
    String? text, {
    Key? key,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return GSText(
      text,
      key: key,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: bodyStyle.copyWith(
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }

  factory GSText.bodySmall(String? text,
      {Key? key, Color? color, TextAlign? textAlign}) {
    return GSText(
      text,
      key: key,
      style: bodySmallStyle.copyWith(
        color: color,
      ),
      textAlign: textAlign,
    );
  }

  factory GSText.paragraphOne(String? text, {Key? key}) {
    return GSText(text, key: key, style: paragraph1Style);
  }

  factory GSText.paragraphTwo(String? text, {Key? key}) {
    return GSText(text, key: key, style: paragraph2Style);
  }

  factory GSText.paragraphThree(String? text, {Key? key}) {
    return GSText(text, key: key, style: paragraph3Style);
  }

  factory GSText.paragraphFour(String? text, {Key? key}) {
    return GSText(text, key: key, style: heading4Style);
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
