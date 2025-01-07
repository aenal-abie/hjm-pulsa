import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pulsa/core/presentation/atoms/style/text_style.dart';

import '../../../../core/presentation/atoms/fields/text_field.dart';
import '../../../../core/presentation/atoms/utils/gap.dart';
import '../../../../product/domain/entities/category_entity.dart';
import '../../manager/buy_controller.dart';

class AddPhoneNumber extends StatelessWidget {
  final Category packetType;

  const AddPhoneNumber(
      {super.key, required this.buyController, required this.packetType});

  final BuyController buyController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: PTextField(
                        hintText: "081 907 666 555",
                        keyboardType: TextInputType.phone,
                        labelText: "NO HP",
                        hintStyle:
                            heading4Regular.copyWith(color: Colors.black26),
                        style: heading4Regular.copyWith(color: Colors.black),
                        onChanged: (temp) {
                          var value = temp.replaceAll(' ', '');
                          buyController.setPhoneNumber(value, packetType);
                        },
                        inputFormatters: [
                          MaskTextInputFormatter(
                            mask: '### ### ### ### ##',
                            filter: {
                              '#': RegExp(r'[0-9]'),
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 10,
            child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Obx(() {
                  return Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: buyController.group.isEmpty
                        ? Icon(HeroiconsOutline.devicePhoneMobile)
                        : SvgPicture.asset(
                            "assets/provider/${buyController.group}.svg"),
                  );
                }) //Icon(HeroiconsOutline.devicePhoneMobile),
                ),
          ),
        ],
      ),
    );
  }
}
