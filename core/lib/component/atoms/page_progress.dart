import 'package:core/component/styles/colors.dart';
import 'package:flutter/material.dart';

class GSPageProgress extends StatelessWidget {
  final int progress;
  final int maxProgress;

  const GSPageProgress(
      {Key? key, required this.progress, required this.maxProgress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: LinearProgressIndicator(
      minHeight: 3,
      value: progress / maxProgress,
      backgroundColor: neutralColor100,
      color: primaryColor500,
    ));
  }
}
