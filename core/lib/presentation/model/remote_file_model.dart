import 'package:core/presentation/model/file_model.dart';

class RemoteFileModel extends FileModel {
  ///progress of download
  final double? progress;

  final DateTime? updateAt;

  ///link of remote file
  final String? link;

  final bool? isNewFile;

  RemoteFileModel({
    super.fileId,
    super.title,
    super.closeAble,
    super.onCloseTap,
    this.link,
    super.fileName,
    super.fileSize,
    super.fileType,
    this.progress,
    this.updateAt,
    this.isNewFile = false,
  });

  int get progressInPercentage => ((progress ?? 0.0) * 100).toInt();

  RemoteFileModel copyWith({
    int? fileId,
    String? title,
    String? link,
    String? fileName,
    String? fileSize,
    String? fileType,
    Function()? onCloseTap,
    bool? closeAble,
    double? width,
    DateTime? updateAt,
    double? progress,
    bool? isNewFile,
  }) {
    return RemoteFileModel(
      fileId: fileId ?? this.fileId,
      title: title ?? this.title,
      link: link ?? this.link,
      fileName: fileName ?? this.fileName,
      fileType: fileType ?? this.fileType,
      fileSize: fileSize ?? this.fileSize,
      onCloseTap: onCloseTap ?? this.onCloseTap,
      closeAble: closeAble ?? this.closeAble,
      progress: progress ?? this.progress,
      updateAt: updateAt ?? this.updateAt,
      isNewFile: isNewFile ?? this.isNewFile,
    );
  }
}
