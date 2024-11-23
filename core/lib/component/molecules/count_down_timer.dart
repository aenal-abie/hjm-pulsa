import 'package:core/component/atoms/fields/index.dart';
import 'package:core/component/styles/colors.dart';
import 'package:core/component/styles/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:sprintf/sprintf.dart';

class GSCountDownTimer extends StatelessWidget {
  const GSCountDownTimer(
      {super.key,
      required this.timeInMillisecond,
      this.timeUpText,
      this.color,
      this.fontSize,
      this.fontWeight,
      this.textStyle,
      this.textAlign,
      this.hideHourLabel,
      this.onEnd});

  final int timeInMillisecond;
  final String? timeUpText;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final VoidCallback? onEnd;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final bool? hideHourLabel;

  @override
  Widget build(BuildContext context) {
    var style =
        textStyle ?? bodyMediumStyle.copyWith(color: color ?? errorColor500);
    return CountdownTimer(
      widgetBuilder: (_, CurrentRemainingTime? time) {
        if (time == null) {
          return GSText(
            timeUpText ?? 'Waktu Habis',
            style: style,
          );
        }
        var formatTime = sprintf("%01i H %i Jam %i menit %i detik",
            [time.days ?? 0, time.hours ?? 0, time.min ?? 0, time.sec ?? 0]);
        if (time.min == null && (hideHourLabel ?? false)) {
          formatTime = sprintf("%i detik", [time.sec ?? 0]);
        } else if (time.hours == null && (hideHourLabel ?? false)) {
          formatTime =
              sprintf("%i menit %i detik", [time.min ?? 0, time.sec ?? 0]);
        } else if (time.days == null) {
          formatTime = sprintf("%i Jam  %i menit %i detik",
              [time.hours ?? 0, time.min ?? 0, time.sec ?? 0]);
        }

        return GSText(
          formatTime,
          style: style,
          overflow: TextOverflow.ellipsis,
          textAlign: textAlign,
        );
      },
      endTime: timeInMillisecond,
      textStyle: style,
      endWidget: Text("Waktu Habis", style: style),
      onEnd: onEnd,
    );
  }
}
