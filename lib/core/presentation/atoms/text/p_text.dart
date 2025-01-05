import 'package:flutter/material.dart';

import '../style/text_style.dart';

// Kelas PText untuk mempermudah penggunaan gaya teks
class PText extends Text {
  const PText(super.text,
      {super.key, super.style, super.overflow, super.textAlign});

  // Title
  factory PText.title1Regular(String text,
          {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: title1Regular.copyWith(color: color), textAlign: textAlign);

  factory PText.title1Medium(String text,
          {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: title1Medium.copyWith(color: color), textAlign: textAlign);

  factory PText.title1Semibold(String text,
          {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: title1Semibold.copyWith(color: color), textAlign: textAlign);

  factory PText.title1Bold(String text, {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: title1Bold.copyWith(color: color), textAlign: textAlign);

  factory PText.title1Light(String text,
          {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: title1Light.copyWith(color: color), textAlign: textAlign);

  factory PText.title2Regular(String text,
          {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: title2Regular.copyWith(color: color), textAlign: textAlign);

  factory PText.title2Medium(String text,
          {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: title2Medium.copyWith(color: color), textAlign: textAlign);

  factory PText.title2Semibold(String text,
          {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: title2Semibold.copyWith(color: color), textAlign: textAlign);

  factory PText.title2Bold(String text, {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: title2Bold.copyWith(color: color), textAlign: textAlign);

  factory PText.title2Light(String text,
          {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: title2Light.copyWith(color: color), textAlign: textAlign);

  // Heading 1
  factory PText.heading1Regular(String text,
          {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: heading1Regular.copyWith(color: color), textAlign: textAlign);

  factory PText.heading1Medium(String text,
          {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: heading1Medium.copyWith(color: color), textAlign: textAlign);

  factory PText.heading1Semibold(String text,
          {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: heading1Semibold.copyWith(color: color), textAlign: textAlign);

  factory PText.heading1Bold(String text,
          {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: heading1Bold.copyWith(color: color), textAlign: textAlign);

  factory PText.heading1Light(String text,
          {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: heading1Light.copyWith(color: color), textAlign: textAlign);

  // Heading 2
  factory PText.heading2Regular(String text,
          {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: heading2Regular.copyWith(color: color), textAlign: textAlign);

  factory PText.heading2Medium(String text,
          {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: heading2Medium.copyWith(color: color), textAlign: textAlign);

  factory PText.heading2Semibold(String text,
          {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: heading2Semibold.copyWith(color: color), textAlign: textAlign);

  factory PText.heading2Bold(String text,
          {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: heading2Bold.copyWith(color: color), textAlign: textAlign);

  factory PText.heading2Light(String text,
          {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: heading2Light.copyWith(color: color), textAlign: textAlign);

  // Heading 3
  factory PText.heading3Regular(String text,
          {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: heading3Regular.copyWith(color: color), textAlign: textAlign);

  factory PText.heading3Medium(String text,
          {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: heading3Medium.copyWith(color: color), textAlign: textAlign);

  factory PText.heading3Semibold(String text,
          {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: heading3Semibold.copyWith(color: color), textAlign: textAlign);

  factory PText.heading3Bold(String text,
          {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: heading3Bold.copyWith(color: color), textAlign: textAlign);

  factory PText.heading3Light(String text,
          {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: heading3Light.copyWith(color: color), textAlign: textAlign);

  // Heading 4
  factory PText.heading4Regular(String text,
          {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: heading4Regular.copyWith(color: color), textAlign: textAlign);

  factory PText.heading4Medium(String text,
          {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: heading4Medium.copyWith(color: color), textAlign: textAlign);

  factory PText.heading4Semibold(String text,
          {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: heading4Semibold.copyWith(color: color), textAlign: textAlign);

  factory PText.heading4Bold(String text,
          {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: heading4Bold.copyWith(color: color), textAlign: textAlign);

  factory PText.heading4Light(String text,
          {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: heading4Light.copyWith(color: color), textAlign: textAlign);

  // Heading 5
  factory PText.heading5Regular(String text,
          {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: heading5Regular.copyWith(color: color), textAlign: textAlign);

  factory PText.heading5Medium(String text,
          {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: heading5Medium.copyWith(color: color), textAlign: textAlign);

  factory PText.heading5Semibold(String text,
          {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: heading5Semibold.copyWith(color: color), textAlign: textAlign);

  factory PText.heading5Bold(String text,
          {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: heading5Bold.copyWith(color: color), textAlign: textAlign);

  factory PText.heading5Light(String text,
          {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: heading5Light.copyWith(color: color), textAlign: textAlign);

  // Heading 6
  factory PText.heading6Regular(String text,
          {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: heading6Regular.copyWith(color: color), textAlign: textAlign);

  factory PText.heading6Medium(String text,
          {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: heading6Medium.copyWith(color: color), textAlign: textAlign);

  factory PText.heading6Semibold(String text,
          {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: heading6Semibold.copyWith(color: color), textAlign: textAlign);

  factory PText.heading6Bold(String text,
          {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: heading6Bold.copyWith(color: color), textAlign: textAlign);

  factory PText.heading6Light(String text,
          {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: heading6Light.copyWith(color: color), textAlign: textAlign);

  // Body 1
  factory PText.body1Regular(String text,
          {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: body1Regular.copyWith(color: color), textAlign: textAlign);

  factory PText.body1Medium(String text,
          {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: body1Medium.copyWith(color: color), textAlign: textAlign);

  factory PText.body1Semibold(String text,
          {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: body1Semibold.copyWith(color: color), textAlign: textAlign);

  factory PText.body1Bold(String text, {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: body1Bold.copyWith(color: color), textAlign: textAlign);

  factory PText.body1Light(String text, {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: body1Light.copyWith(color: color), textAlign: textAlign);

  // Body 2
  factory PText.body2Regular(String text,
          {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: body2Regular.copyWith(color: color), textAlign: textAlign);

  factory PText.body2Medium(String text,
          {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: body2Medium.copyWith(color: color), textAlign: textAlign);

  factory PText.body2Semibold(String text,
          {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: body2Semibold.copyWith(color: color), textAlign: textAlign);

  factory PText.body2Bold(String text, {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: body2Bold.copyWith(color: color), textAlign: textAlign);

  factory PText.body2Light(String text, {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: body2Light.copyWith(color: color), textAlign: textAlign);

  // Caption 1
  factory PText.caption1Regular(String text,
          {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: caption1Regular.copyWith(color: color), textAlign: textAlign);

  factory PText.caption1Medium(String text,
          {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: caption1Medium.copyWith(color: color), textAlign: textAlign);

  factory PText.caption1Semibold(String text,
          {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: caption1Semibold.copyWith(color: color), textAlign: textAlign);

  factory PText.caption1Bold(String text,
          {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: caption1Bold.copyWith(color: color), textAlign: textAlign);

  factory PText.caption1Light(String text,
          {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: caption1Light.copyWith(color: color), textAlign: textAlign);

  // Caption 2
  factory PText.caption2Regular(String text,
          {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: caption2Regular.copyWith(color: color), textAlign: textAlign);

  factory PText.caption2Medium(String text,
          {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: caption2Medium.copyWith(color: color), textAlign: textAlign);

  factory PText.caption2Semibold(String text,
          {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: caption2Semibold.copyWith(color: color), textAlign: textAlign);

  factory PText.caption2Bold(String text,
          {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: caption2Bold.copyWith(color: color), textAlign: textAlign);

  factory PText.caption2Light(String text,
          {Color? color, TextAlign? textAlign}) =>
      PText(text,
          style: caption2Light.copyWith(color: color), textAlign: textAlign);
}
