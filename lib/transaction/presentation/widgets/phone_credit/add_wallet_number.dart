import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pulsa/core/presentation/atoms/style/text_style.dart';
import 'package:pulsa/transaction/presentation/widgets/phone_credit/select_wallet.dart';

import '../../../../core/presentation/atoms/fields/text_field.dart';
import '../../../../core/presentation/atoms/style/colors.dart';
import '../../../../core/presentation/atoms/utils/gap.dart';
import '../../../../product/domain/entities/category_entity.dart';
import '../../manager/buy_controller.dart';
import '../../pages/contact_screen.dart';

class AddWalletNumber extends StatelessWidget {
  final Category packetType;

  const AddWalletNumber(
      {super.key, required this.buyController, required this.packetType});

  final BuyController buyController;

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
                                    text: buyController
                                        .customerNumberFromContact.value),
                                hintText: "081 907 666 555",
                                keyboardType: TextInputType.phone,
                                labelText: "No Wallet",
                                hintStyle: heading4Regular.copyWith(
                                    color: Colors.black26),
                                style: heading4Regular.copyWith(
                                    color: Colors.black),
                                onChanged: (temp) {
                                  var value = temp.replaceAll(' ', '');
                                  buyController.setWalletNumber(
                                      value, packetType);
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
                                    buyController: buyController,
                                    packetType: packetType,
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
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  builder: (BuildContext context) {
                    return ListWallet(buyController: buyController);
                  },
                );
              },
              child: Row(
                children: [
                  Container(
                    height: 45,
                    width: 70,
                    decoration: BoxDecoration(
                      color: bluePothan[50],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 4, 8),
                      child: Obx(() {
                        return SvgPicture.asset(
                            "assets/provider/${buyController.eWalletName.value.toLowerCase()}.svg");
                      }),
                    ),
                    //Icon(HeroiconsOutline.devicePhoneMobile),
                  ),
                  Container(
                    height: 45,
                    width: 30,
                    decoration: BoxDecoration(
                      color: bluePothan[50],
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(
                        Icons.keyboard_double_arrow_right_sharp,
                        color: bluePothan[800],
                      ),
                    ),
                    //Icon(HeroiconsOutline.devicePhoneMobile),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
