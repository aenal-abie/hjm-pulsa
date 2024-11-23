import 'package:core/presentation/model/file_model.dart';
import 'package:path/path.dart';

class LocalFileModel extends FileModel {
  final double? width;

  ///progress of  upload  file
  final double? progress;

  ///path of local File
  final String? filePath;

  LocalFileModel({
    super.fileId,
    super.title,
    this.filePath,
    super.fileName,
    super.fileSize,
    super.onCloseTap,
    super.closeAble,
    this.width,
    this.progress,
  });

  LocalFileModel copyWith({
    int? fileId,
    String? title,
    String? filePath,
    String? fileName,
    String? fileSize,
    Function()? onCloseTap,
    bool? closeAble,
    double? width,
    double? progress,
  }) {
    return LocalFileModel(
      fileId: fileId ?? this.fileId,
      title: title ?? this.title,
      filePath: filePath ?? this.filePath,
      fileName: fileName ?? this.fileName,
      fileSize: fileSize ?? this.fileSize,
      onCloseTap: onCloseTap ?? this.onCloseTap,
      closeAble: closeAble ?? this.closeAble,
      width: width ?? this.width,
      progress: progress ?? this.progress,
    );
  }

  LocalFileModel reset() => LocalFileModel(title: title);

  @override
  String get getFileType => extension(filePath ?? "");

  int get progressInPercentage => ((progress ?? 0.0) * 100).toInt();

  @override
  bool get isImageFile =>
      [".jpg", ".jpeg", ".png"].contains(extension(filePath ?? ""));

  @override
  bool get notImageFile =>
      [".pdf", ".zip", ".rar"].contains(extension(filePath ?? ""));

  bool get uploadProgress => closeAble == false && (progress ?? 0) > 0;
}
