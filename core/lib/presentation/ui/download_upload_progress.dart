import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../component/atoms/index.dart';
import '../../component/styles/index.dart';

class BackgroundProgress extends StatelessWidget {
  final String? fileType;
  final double? progress;
  final int? progressInPercentage;

  const BackgroundProgress(
      {Key? key, this.fileType, this.progress, this.progressInPercentage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: getBackgroundBaseOnFileType((fileType ?? "")),
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          decoration: BoxDecoration(
              color: neutralColor500.withOpacity(.3),
              borderRadius: const BorderRadius.all(Radius.circular(100))),
          child: Progress(
            progress: progress,
            progressInPercentage: progressInPercentage,
          ),
        ),
      ),
    );
  }

  Color getBackgroundBaseOnFileType(String extension) {
    if (".pdf" == extension) return const Color(0xffFC8989);
    if (".zip" == extension) return const Color(0xff556080);
    if (".rar" == extension) return const Color(0xff5623E2);
    return Colors.transparent;
  }
}

class Progress extends StatelessWidget {
  final double? progress;
  final int? progressInPercentage;

  const Progress({Key? key, this.progress, this.progressInPercentage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Stack(
        children: [
          CircularProgressIndicator(
            strokeWidth: 3,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
            value: progress ?? 0.0,
          ),
          Center(
              child: GSText.bodySmall(
            (progressInPercentage).toString(),
            color: Colors.white,
          ))
        ],
      ),
    );
  }
}

String getIconAssetView(String extension) {
  if (".pdf" == extension) return "assets/pdf.svg";
  if (".zip" == extension) return "assets/zip.svg";
  if (".rar" == extension) return "assets/rar.svg";
  return "";
}

class UploadingProgress extends StatelessWidget {
  const UploadingProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 50,
          height: 60,
          child: SpinKitFadingCircle(
            color: primaryColor500,
            size: 50.0,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        GSText.body(
          "Proses Upload",
          color: neutralColor500,
        )
      ],
    );
  }
}
