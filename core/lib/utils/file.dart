import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:indonesia/indonesia.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../data/data_sources/cache/session.dart';

extension FileUtils on File {
  get sizeInMB {
    int sizeInBytes = lengthSync();
    double sizeInMb = sizeInBytes / (1024 * 1024);
    return "${sizeInMb.toStringAsFixed(2)} MB";
  }



  String get fileName {
    return basename(path);
  }
}

Future<String?> openFile({List<String>? allowedExtensions}) async {
  try {
    Session.doSave("pickFile", true);
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: allowedExtensions?.isNotEmpty ?? false
            ? FileType.custom
            : FileType.any,
        allowedExtensions: allowedExtensions);
    await Session.doRemove("pickFile");
    return result?.files.single.path;
  } on PlatformException catch (e) {
    return null;
  }
}

Future<bool?> isPickFileSession() async {
  try {
    var pick = await Session.getValue("pickFile") ?? false;
    return pick;
  } on PlatformException catch (e) {
    return false;
  }
}

Future<String> getDownloadDirectoryPath() async {
  var path = "";
  if (Platform.isAndroid) {
    Directory? baseStorage;
    baseStorage = Directory('/storage/emulated/0/Download');
    if (!await baseStorage.exists()) {
      baseStorage = await getExternalStorageDirectory();
    }
    path = "${baseStorage?.path}/GetSurvey";
    final savedDir = Directory(path);
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }
  } else {
    final baseStorage = await getApplicationDocumentsDirectory();
    path = "${baseStorage.path}/Download";
  }
  return path;
}

String get getDownloadDirectoryPathName =>
    (Platform.isAndroid) ? "Download/GetSurvey" : "GetSurvey/Download";

String get getDateTimeDownloadFormat =>
    tanggal(DateTime.now(), shortMonth: true);

String fileSizeInMB(double size) {
  try {
    return "${(size / 1000).toStringAsFixed(2)} MB";
  } on Exception {
    return "0.0";
  }
}
