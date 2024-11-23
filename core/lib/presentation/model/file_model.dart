import 'package:flutter/material.dart';

class FileModel {
  final int? fileId;
  final String? title;
  final String? fileName;
  final String? fileSize;
  final String? fileType;
  final GestureTapCallback? onCloseTap;
  final bool? closeAble;

  FileModel({
    this.fileId,
    this.title,
    this.fileName,
    this.fileSize,
    this.onCloseTap,
    this.closeAble,
    this.fileType,
  });

  String get getFileType => fileType ?? "";

  bool get isImageFile => [".jpg", ".jpeg", ".png"].contains(fileType);

  bool get notImageFile => [".pdf", ".zip", ".rar"].contains(fileType);
}
