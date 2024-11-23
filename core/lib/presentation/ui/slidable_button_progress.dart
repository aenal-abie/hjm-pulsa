import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SlidableButtonProgress extends StatelessWidget {
  const SlidableButtonProgress(
      {Key? key,
      required this.color,
      required this.buttonColor,
      required this.buttonWidth,
      required this.child})
      : super(key: key);
  final Color color;
  final Color buttonColor;
  final double buttonWidth;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Stack(
        children: [
          Center(child: child),
          Positioned(
            right: 0,
            bottom: 0,
            top: 0,
            child: Container(
              width: buttonWidth,
              decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const SpinKitCircle(
                color: Colors.white,
                size: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}
