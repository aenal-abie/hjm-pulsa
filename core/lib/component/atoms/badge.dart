import 'package:core/component/styles/index.dart';
import 'package:flutter/material.dart';

import 'index.dart';

class GSBadge extends StatelessWidget {
  const GSBadge({
    Key? key,
    required this.text,
    this.color,
    this.padding,
    this.center,
    this.style,
    this.backgroundColor,
  }) : super(key: key);

  final String text;
  final Color? color;
  final bool? center;
  final TextStyle? style;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        color: backgroundColor ?? primaryColor50,
      ),
      child: GSText(
        text,
        textAlign: (center ?? false) ? TextAlign.center : TextAlign.start,
        style: style?.copyWith(
              color: color ?? primaryColor500,
            ) ??
            bodyStyle,
      ),
    );
  }
}
