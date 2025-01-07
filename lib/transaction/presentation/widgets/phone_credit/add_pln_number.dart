import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pulsa/core/presentation/atoms/style/colors.dart';
import 'package:pulsa/core/presentation/atoms/style/text_style.dart';
import 'package:pulsa/core/presentation/atoms/text/p_text.dart';

import '../../../../core/presentation/atoms/fields/text_field.dart';
import '../../../../core/presentation/atoms/utils/gap.dart';
import '../../../../product/domain/entities/category_entity.dart';
import '../../manager/buy_controller.dart';

class AddPlnNumber extends StatelessWidget {
  final Category packetType;

  const AddPlnNumber(
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
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PTextField(
                            hintText: "1441 7666 555",
                            keyboardType: TextInputType.phone,
                            labelText: "ID Pelanggan/No. Meter",
                            hintStyle:
                                heading4Regular.copyWith(color: Colors.black26),
                            style:
                                heading4Regular.copyWith(color: Colors.black),
                            onChanged: (temp) {
                              var value = temp.replaceAll(' ', '');
                              buyController.setElectricityNumber(value);
                            },
                            inputFormatters: [
                              MaskTextInputFormatter(
                                mask: '#### #### ####',
                                filter: {
                                  '#': RegExp(r'[0-9]'),
                                },
                              ),
                            ],
                          ),
                          Gap(4),
                          Obx(() {
                            return (buyController.electricityNumberEntity.value
                                        .name?.isEmpty ??
                                    true)
                                ? SizedBox.shrink()
                                : Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 8),
                                    decoration: BoxDecoration(
                                      color: bluePothan[50],
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(8),
                                        bottomRight: Radius.circular(8),
                                      ),
                                    ),
                                    child: PText.heading6Semibold(
                                        "${buyController.electricityNumberEntity.value.name?.substring(0, buyController.electricityNumberEntity.value.name!.length - 3) ?? ""}***"),
                                  );
                          })
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [],
            ),
          ),
          Positioned(
            right: 10,
            child: Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: SvgPicture.asset("assets/provider/pln.svg"),
                ) //Icon(HeroiconsOutline.devicePhoneMobile),
                ),
          ),
        ],
      ),
    );
  }
}
