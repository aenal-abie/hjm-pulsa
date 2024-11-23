import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class GSThreeBounceLoading extends StatelessWidget {
  const GSThreeBounceLoading({Key? key, this.size, this.color})
      : super(key: key);
  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SpinKitThreeBounce(
      size: (size ?? 13),
      color: color ?? Colors.red,
    );
  }
}
