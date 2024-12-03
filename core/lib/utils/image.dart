import 'dart:io';

import 'package:core/utils/permission.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_exif_rotation/flutter_exif_rotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:ui' as ui;

import '../data/data_sources/cache/session.dart';
import 'package:flutter_svg/svg.dart';

class ImageUtils {
  static const appLogo = AssetImage("assets/logo.png");
  static const appSplash = AssetImage("assets/brand.png");
}

Future<String?> pickCameraImage() async {
  try {
    if (await permissionIsGranted(Permission.camera)) {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.camera);
      if (image?.path.isEmpty ?? true) {
        return null;
      }
      File rotatedImage =
          await FlutterExifRotation.rotateAndSaveImage(path: image!.path);
      return rotatedImage.path;
    }
    return null;
  } on PlatformException catch (e) {
    return null;
  }
}

Future<String?> pickGalleryImage() async {
  try {
    Session.doSave("pickFile", true);
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    await Session.doRemove("pickFile");
    return image?.path;
  } on PlatformException catch (e) {
    return null;
  }
}


Future<Uint8List> _svgStringToPngBytes(
  BuildContext context,
  String assetName,
  double targetWidth,
  double targetHeight,
) async {
  final String svgString =
      await DefaultAssetBundle.of(context).loadString(assetName);
  final SvgStringLoader svgStringLoader = SvgStringLoader(svgString);
  final PictureInfo pictureInfo = await vg.loadPicture(svgStringLoader, null);
  final ui.Picture picture = pictureInfo.picture;
  final ui.PictureRecorder recorder = ui.PictureRecorder();
  final ui.Canvas canvas = Canvas(recorder,
      Rect.fromPoints(Offset.zero, Offset(targetWidth, targetHeight)));
  canvas.scale(targetWidth / pictureInfo.size.width,
      targetHeight / pictureInfo.size.height);
  canvas.drawPicture(picture);
  final ui.Image imgByteData = await recorder
      .endRecording()
      .toImage(targetWidth.ceil(), targetHeight.ceil());
  final ByteData? bytesData =
      await imgByteData.toByteData(format: ui.ImageByteFormat.png);
  final Uint8List imageData = bytesData?.buffer.asUint8List() ?? Uint8List(0);
  pictureInfo.picture.dispose();
  return imageData;
}
