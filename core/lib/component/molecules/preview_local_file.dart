import 'dart:io';

import 'package:core/component/styles/colors.dart';
import 'package:core/component/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:path/path.dart';

import '../../assets/manager/assets.gen.dart';
import '../../presentation/model/local_file_model.dart';
import '../atoms/fields/text.dart';
import 'download_upload_progress.dart';

class GSPreviewLocalFile extends StatelessWidget {
  final LocalFileModel previewFile;
  final double? leftPadding;
  final Function? cancelUpload;

  const GSPreviewLocalFile({
    Key? key,
    required this.previewFile,
    this.leftPadding,
    this.cancelUpload,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: previewFile.width ?? MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Stack(
            children: [
              previewFile.closeAble == false
                  ? UploadProgress(
                      localFileModel: previewFile,
                      cancelUpload: cancelUpload,
                    )
                  : LocalFileThumbnail(filePath: previewFile.filePath ?? ""),
              if (previewFile.closeAble ?? true)
                Positioned(
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(360)),
                    child: InkWell(
                      onTap: previewFile.onCloseTap,
                      child: Assets.icons.closeButton.svg(
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GSText(
                previewFile.title ?? "",
                style: bodyStyle,
              ),
              SizedBox(
                width: 200,
                child: GSText.body(
                  basename(previewFile.filePath ?? ""),
                  overflow: TextOverflow.ellipsis,
                  color: neutralColor200,
                ),
              ),
              GSText.body(
                previewFile.fileSize ?? "",
                color: neutralColor200,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LocalFileThumbnail extends StatelessWidget {
  const LocalFileThumbnail({
    super.key,
    required this.filePath,
  });

  final String filePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, right: 10),
      child: [".pdf", ".zip", ".rar"].contains(extension(filePath))
          ? SvgPicture.asset(
              getIconAssetView(extension(filePath)),
              package: "measurement",
              height: 60,
              width: 60,
            )
          : Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  image: DecorationImage(
                    image: FileImage(File(filePath)),
                    fit: BoxFit.fill,
                  )),
            ),
    );
  }
}

class UploadProgress extends StatelessWidget {
  final LocalFileModel? localFileModel;
  final Function? cancelUpload;

  const UploadProgress({
    super.key,
    this.localFileModel,
    this.cancelUpload,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 8),
      child: Container(
        decoration: BoxDecoration(
            color: (localFileModel?.isImageFile ?? false)
                ? null
                : const Color(0xffF6F6F6),
            image: (localFileModel?.isImageFile ?? false)
                ? DecorationImage(
                    fit: BoxFit.cover,
                    image: FileImage(File(localFileModel?.filePath ?? "")))
                : null,
            borderRadius: const BorderRadius.all(Radius.circular(5))),
        height: 60,
        width: 60,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: BackgroundProgress(
            fileType: localFileModel?.getFileType ?? "",
            progress: localFileModel?.progress ?? 0.0,
            progressInPercentage: localFileModel?.progressInPercentage ?? 0,
            cancelUpload: cancelUpload,
          ),
        ),
      ),
    );
  }
}
