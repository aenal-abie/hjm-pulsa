import 'dart:io';
import 'dart:typed_data';

import 'package:core/component/atoms/fields/index.dart';
import 'package:core/component/atoms/gap.dart';
import 'package:core/component/styles/colors.dart';
import 'package:core/utils/file.dart';
import 'package:cropperx/cropperx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exif_rotation/flutter_exif_rotation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../../utils/image.dart';

enum ImageSourceType { camera, gallery, file }

class CropperScreen extends StatefulWidget {
  const CropperScreen(
      {Key? key, required this.file, required this.imageSourceType})
      : super(key: key);
  final File file;
  final ImageSourceType imageSourceType;

  @override
  State<CropperScreen> createState() => _CropperScreenState();
}

class _CropperScreenState extends State<CropperScreen> {
  final ImagePicker _picker = ImagePicker();
  final GlobalKey _cropperKey = GlobalKey(debugLabel: 'cropperKey');
  Uint8List? _imageToCrop;
  final OverlayType _overlayType = OverlayType.circle;
  final int _rotationTurns = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      _imageToCrop = widget.file.readAsBytesSync();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: neutralColor100,
      appBar: AppBar(
        title: GSText.headingSevenMedium("Sesuaikan Foto"),
        leading: const SizedBox.shrink(),
        centerTitle: true,
        backgroundColor: optionalColor500,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height * 0.17,
            right: 57,
            bottom: MediaQuery.of(context).size.height * 0.1,
            left: 57,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Cropper(
                  cropperKey: _cropperKey,
                  overlayType: _overlayType,
                  overlayColor: neutralColor100,
                  backgroundColor: neutralColor100,
                  rotationTurns: _rotationTurns,
                  image: Image.memory(_imageToCrop!),
                ),
                const GSGap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 38,
                      padding: const EdgeInsets.all(10),
                      decoration: ShapeDecoration(
                        color: neutralColor50,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                      ),
                      child: GSText.body(
                        'Geser untuk menyesuaikan foto',
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            bottom: 60,
            right: 0,
            left: 0,
            child: SizedBox(
              height: 40,
              child: Row(
                children: [
                  const Expanded(child: SizedBox()),
                  InkWell(
                    onTap: rePickFile,
                    child: Container(
                      width: 116,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                          )),
                      child: Center(
                          child: GSText.body(
                        "Ulangi",
                      )),
                    ),
                  ),
                  InkWell(
                    onTap: cropImage,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: 120,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: primaryColor500,
                          ),
                          color: primaryColor500,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                          )),
                      child: Center(
                          child: GSText.body(
                        "Gunakan Foto",
                        color: Colors.white,
                      )),
                    ),
                  ),
                  const Expanded(
                    child: SizedBox(
                      height: 100,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void rePickFile() async {
    if (widget.imageSourceType == ImageSourceType.camera) {
      pickFromCamera();
    } else if (widget.imageSourceType == ImageSourceType.gallery) {
      pickFromGallery();
    } else if (widget.imageSourceType == ImageSourceType.file) {
      pickFile();
    }
  }

  void pickFromCamera() async {
    final path = await pickCameraImage();
    if (path != null) {
      var image = Platform.isIOS
          ? await FlutterExifRotation.rotateImage(path: path)
          : File(path);
      final imageBytes = await image.readAsBytes();
      setState(() {
        _imageToCrop = imageBytes;
      });
    }
  }

  void pickFile() async {
    final path = await openFile(allowedExtensions: ["jgp", "png", "jpeg"]);
    if (path != null) {
      var image = Platform.isIOS
          ? await FlutterExifRotation.rotateImage(path: path)
          : File(path);
      final imageBytes = await image.readAsBytes();
      setState(() {
        _imageToCrop = imageBytes;
      });
    }
  }

  void pickFromGallery() async {
    final image = await _picker.pickImage(
      source: ImageSource.gallery,
    );

    if (image != null) {
      final imageBytes = await image.readAsBytes();
      setState(() {
        _imageToCrop = imageBytes;
      });
    }
  }

  void cropImage() async {
    final imageBytes = await Cropper.crop(
      cropperKey: _cropperKey,
    );

    if (imageBytes != null) {
      final tempDir = await getTemporaryDirectory();
      File fileToBeUploaded = await File(
              '${tempDir.path}/image_crop${DateTime.now().toString()}.jpg')
          .create();
      fileToBeUploaded.writeAsBytesSync(imageBytes);
      Get.back(result: fileToBeUploaded);
    }
  }
}
