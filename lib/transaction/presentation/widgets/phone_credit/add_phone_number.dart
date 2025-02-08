import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pulsa/core/presentation/atoms/style/colors.dart';
import 'package:pulsa/core/presentation/atoms/style/text_style.dart';
import 'package:pulsa/transaction/presentation/pages/contact_screen.dart';

import '../../../../core/presentation/atoms/fields/text_field.dart';
import '../../../../core/presentation/atoms/utils/gap.dart';
import '../../../../product/domain/entities/category_entity.dart';
import '../../manager/buy_controller.dart';

class AddPhoneNumber extends StatefulWidget {
  final Category packetType;

  const AddPhoneNumber(
      {super.key, required this.packetType, required this.buyController});

  final BuyController buyController;

  @override
  State<AddPhoneNumber> createState() => _AddPhoneNumberState();
}

class _AddPhoneNumberState extends State<AddPhoneNumber> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
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
                      child: Row(
                        children: [
                          Expanded(
                            child: Obx(() {
                              return PTextField(
                                controller: TextEditingController(
                                    text: widget.buyController
                                        .customerNumberFromContact.value),
                                hintText: "081 907 666 555",
                                keyboardType: TextInputType.phone,
                                labelText: "Nomor Handphone",
                                hintStyle: heading4Regular.copyWith(
                                    color: Colors.black26),
                                style: heading4Regular.copyWith(
                                    color: Colors.black),
                                onChanged: (temp) {
                                  var value = temp.replaceAll(' ', '');
                                  widget.buyController
                                      .setPhoneNumber(value, widget.packetType);
                                },
                                inputFormatters: [
                                  MaskTextInputFormatter(
                                    mask: '### ### ### ### ##',
                                    filter: {
                                      '#': RegExp(r'[0-9]'),
                                    },
                                  ),
                                ],
                              );
                            }),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 18.0),
                            child: Center(
                              child: IconButton(
                                icon: Icon(HeroiconsOutline.identification,
                                    color: bluePothan),
                                onPressed: () {
                                  Get.to(ContactsScreen(
                                    buyController: widget.buyController,
                                    packetType: widget.packetType,
                                  ));
                                },
                                iconSize: 40,
                              ),
                            ),
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
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  color: bluePothan[50],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Obx(() {
                  return Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: widget.buyController.group.isEmpty
                        ? Icon(
                            HeroiconsSolid.devicePhoneMobile,
                            color: bluePothan,
                          )
                        : SvgPicture.asset(
                            "assets/provider/${widget.buyController.group}.svg"),
                  );
                })),
          ),
        ],
      ),
    );
  }
}
