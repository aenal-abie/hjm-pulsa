import 'package:core/component/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../assets/manager/assets.gen.dart';
import '../../atoms/fields/index.dart';

class BottomSheetTitle extends StatelessWidget {
  const BottomSheetTitle({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Container(
            height: 4,
            width: 42,
            decoration: BoxDecoration(
                color: neutralColor200.withOpacity(.5),
                borderRadius: BorderRadius.circular(2)),
          ),
        ),
        SizedBox(
          height: 40,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: Center(
                  child: GSText.headingSevenMedium(
                    title,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      padding: const EdgeInsets.fromLTRB(13, 13, 5, 13),
                      child:
                          Assets.icons.closeNormal.svg(width: 12, height: 12),
                    )),
              )
            ],
          ),
        ),
      ],
    );
  }
}
