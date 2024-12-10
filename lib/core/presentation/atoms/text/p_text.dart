import 'package:flutter/material.dart';

import '../style/text_style.dart';

// Kelas PText untuk mempermudah penggunaan gaya teks
class PText extends Text {
  const PText(super.text, {super.key, super.style, super.overflow});

  factory PText.title1Regular(String text) => PText(text, style: title1Regular);
  factory PText.title1Medium(String text) => PText(text, style: title1Medium);
  factory PText.title1Semibold(String text) =>
      PText(text, style: title1Semibold);
  factory PText.title1Bold(String text) => PText(text, style: title1Bold);

  factory PText.title2Regular(String text) => PText(text, style: title2Regular);
  factory PText.title2Medium(String text) => PText(text, style: title2Medium);
  factory PText.title2Semibold(String text) =>
      PText(text, style: title2Semibold);
  factory PText.title2Bold(String text) => PText(text, style: title2Bold);

  factory PText.heading1Regular(String text) =>
      PText(text, style: heading1Regular);
  factory PText.heading1Medium(String text) =>
      PText(text, style: heading1Medium);
  factory PText.heading1Semibold(String text) =>
      PText(text, style: heading1Semibold);
  factory PText.heading1Bold(String text) => PText(text, style: heading1Bold);

  factory PText.heading2Regular(String text) =>
      PText(text, style: heading2Regular);
  factory PText.heading2Medium(String text) =>
      PText(text, style: heading2Medium);
  factory PText.heading2Semibold(String text) =>
      PText(text, style: heading2Semibold);
  factory PText.heading2Bold(String text) => PText(text, style: heading2Bold);

  factory PText.heading3Regular(String text) =>
      PText(text, style: heading3Regular);
  factory PText.heading3Medium(String text) =>
      PText(text, style: heading3Medium);
  factory PText.heading3Semibold(String text) =>
      PText(text, style: heading3Semibold);
  factory PText.heading3Bold(String text) => PText(text, style: heading3Bold);

  factory PText.heading4Regular(String text, {Color? color}) =>
      PText(text, style: heading4Regular.copyWith(color: color));

  factory PText.heading4Medium(String text) =>
      PText(text, style: heading4Medium);
  factory PText.heading4Semibold(String text) =>
      PText(text, style: heading4Semibold);
  factory PText.heading4Bold(String text) => PText(text, style: heading4Bold);

  factory PText.heading5Regular(String text) =>
      PText(text, style: heading5Regular);
  factory PText.heading5Medium(String text) =>
      PText(text, style: heading5Medium);
  factory PText.heading5Semibold(String text) =>
      PText(text, style: heading5Semibold);
  factory PText.heading5Bold(String text) => PText(text, style: heading5Bold);

  factory PText.heading6Regular(String text) =>
      PText(text, style: heading6Regular);
  factory PText.heading6Medium(String text) =>
      PText(text, style: heading6Medium);
  factory PText.heading6Semibold(String text) =>
      PText(text, style: heading6Semibold);
  factory PText.heading6Bold(String text) => PText(text, style: heading6Bold);

  factory PText.body1Regular(String text) => PText(text, style: body1Regular);
  factory PText.body1Medium(String text) => PText(text, style: body1Medium);
  factory PText.body1Semibold(String text) => PText(text, style: body1Semibold);
  factory PText.body1Bold(String text) => PText(text, style: body1Bold);

  factory PText.body2Regular(String text, {Color? color}) =>
      PText(text, style: body2Regular.copyWith(color: color));
  factory PText.body2Medium(String text) => PText(text, style: body2Medium);
  factory PText.body2Semibold(String text) => PText(text, style: body2Semibold);
  factory PText.body2Bold(String text) => PText(text, style: body2Bold);

  factory PText.caption1Regular(String text) =>
      PText(text, style: caption1Regular);
  factory PText.caption1Medium(String text) =>
      PText(text, style: caption1Medium);
  factory PText.caption1Semibold(String text) =>
      PText(text, style: caption1Semibold);
  factory PText.caption1Bold(String text) => PText(text, style: caption1Bold);

  factory PText.caption2Regular(String text) =>
      PText(text, style: caption2Regular);
  factory PText.caption2Medium(String text) =>
      PText(text, style: caption2Medium);
  factory PText.caption2Semibold(String text) =>
      PText(text, style: caption2Semibold);
  factory PText.caption2Bold(String text) => PText(text, style: caption2Bold);
}
