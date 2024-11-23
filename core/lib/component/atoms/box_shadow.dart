import 'package:flutter/material.dart';

enum GSBoxShadowVersion { v1, v2, v3 }

class GSBoxShadow extends StatelessWidget {
  const GSBoxShadow({
    Key? key,
    required this.child,
    this.version = GSBoxShadowVersion.v3,
    this.borderRadius,
    this.padding,
    this.margin,
  }) : super(key: key);
  final Widget child;
  final GSBoxShadowVersion version;
  final double? borderRadius;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    var shadow = const BoxShadow(
      color: Color(0x26000000),
      blurRadius: 3,
      offset: Offset(0, 0),
      spreadRadius: 0,
    );
    switch (version) {
      case GSBoxShadowVersion.v1:
        shadow = const BoxShadow(
          color: Color(0x26000000),
          blurRadius: 2,
          offset: Offset(0, 0),
          spreadRadius: 0,
        );
        break;
      case GSBoxShadowVersion.v2:
        shadow = const BoxShadow(
          color: Color(0x19000000),
          blurRadius: 2,
          offset: Offset(0, -1),
          spreadRadius: 0,
        );
        break;
      case GSBoxShadowVersion.v3:
        break;
    }
    return Container(
      padding: padding,
      margin: margin,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 5)),
        shadows: [shadow],
      ),
      child: child,
    );
  }
}
