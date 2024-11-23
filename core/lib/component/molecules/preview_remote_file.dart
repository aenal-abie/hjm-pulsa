import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/component/styles/colors.dart';
import 'package:core/presentation/model/remote_file_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:indonesia/indonesia.dart';
import 'package:intl/intl.dart';

import '../atoms/fields/text.dart';
import 'download_upload_progress.dart';

class GSPreviewRemoteFile extends StatelessWidget {
  final RemoteFileModel remoteFileModel;

  const GSPreviewRemoteFile({
    Key? key,
    required this.remoteFileModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Stack(
            children: [
              (remoteFileModel.progress ?? 0) < 1.0
                  ? DownloadProgress(remoteFileModel: remoteFileModel)
                  : ThumbnailRemoteFile(previewFileModel: remoteFileModel),
              if (remoteFileModel.closeAble ?? false)
                Positioned(
                  top: 0,
                  right: 0,
                  child: InkWell(
                    onTap: remoteFileModel.onCloseTap,
                    child: SvgPicture.asset(
                      "assets/close.svg",
                      package: "measurement",
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GSText.body(
                  remoteFileModel.title,
                  color: neutralColor500,
                ),
                SizedBox(
                  child: GSText.body(remoteFileModel.fileName,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      color: neutralColor200),
                ),
                Row(
                  children: [
                    GSText.body(remoteFileModel.fileSize,
                        color: neutralColor200),
                    if (remoteFileModel.updateAt == null)
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: isNewFile(),
                      ),
                    showUpdateAt()
                  ],
                ),
                if (remoteFileModel.updateAt != null) isNewFile(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget showUpdateAt() {
    if (remoteFileModel.updateAt == null) return const SizedBox.shrink();
    var date = tanggal(remoteFileModel.updateAt!.toLocal(), shortMonth: true);
    var time =
        DateFormat("HH:mm WIB").format(remoteFileModel.updateAt!.toLocal());
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: GSText.body("(diubah $date $time)", color: neutralColor200),
    );
  }

  Widget isNewFile() {
    if (remoteFileModel.isNewFile == false) return const SizedBox.shrink();
    return GSText.body(
      "Baru!",
      color: errorColor500,
    );
  }
}

class DownloadProgress extends StatelessWidget {
  final RemoteFileModel? remoteFileModel;

  const DownloadProgress({
    super.key,
    this.remoteFileModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Color(0xffF6F6F6),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      height: 60,
      width: 60,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: BackgroundProgress(
          fileType: remoteFileModel?.getFileType ?? "",
          progress: remoteFileModel?.progress ?? 0.0,
          progressInPercentage: remoteFileModel?.progressInPercentage ?? 0,
        ),
      ),
    );
  }
}

class ThumbnailRemoteFile extends StatelessWidget {
  const ThumbnailRemoteFile({
    super.key,
    required this.previewFileModel,
  });

  final RemoteFileModel previewFileModel;

  @override
  Widget build(BuildContext context) {
    var padding = (previewFileModel.closeAble ?? false)
        ? const EdgeInsets.only(top: 12.0, right: 8.0)
        : const EdgeInsets.only();
    return Padding(
      padding: padding,
      child: previewFileModel.notImageFile
          ? SvgPicture.asset(
              getIconAssetView(previewFileModel.fileType ?? ""),
              package: "measurement",
              height: 60,
              width: 60,
            )
          : SizedBox(
              height: 60,
              width: 60,
              child: CachedNetworkImage(
                imageUrl: previewFileModel.link ?? "",
                fit: BoxFit.fill,
                imageBuilder: (context, imageProvider) => Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
                placeholder: (context, url) => const Center(
                    child: SpinKitThreeBounce(
                  size: 20,
                  color: Colors.red,
                )),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
    );
  }
}
