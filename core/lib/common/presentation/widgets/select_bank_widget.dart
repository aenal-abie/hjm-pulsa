import 'package:core/component/atoms/index.dart';
import 'package:core/component/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../assets/manager/assets.gen.dart';
import '../manager/bank_controller.dart';
import 'bank_items.dart';

class SelectBankWidget extends StatefulWidget {
  const SelectBankWidget({Key? key}) : super(key: key);

  @override
  State<SelectBankWidget> createState() => _SelectBankWidgetState();
}

class _SelectBankWidgetState extends State<SelectBankWidget> {
  final BankController bankController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GSText.headingSevenMedium("Metode Pembayaran"),
        const GSGap(10),
        InkWell(
          onTap: () {
            bankController.banks.value = bankController.banksTemp;
            _showPaymentMethodsSheet(context);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(blurRadius: 2, color: Color.fromRGBO(0, 0, 0, 0.25)),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () {
                    if (bankController.bankCode.value == Banks.unknown) {
                      return GSText.body(
                        "Pilih Rekening Bank",
                        color: neutralColor200,
                      );
                    }
                    return Expanded(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 80,
                            child: Image.asset(
                              bankController.bankCode.value.assetPath,
                              height: 18,
                              alignment: Alignment.centerLeft,
                            ),
                          ),
                          Expanded(
                            child: GSText.body(
                              bankController.bankCode.value.bankName,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Assets.icons.arrowRight.svg(
                  width: 7,
                  height: 12,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _showPaymentMethodsSheet(BuildContext context) {
    showModalBottomSheet(
        isDismissible: false,
        enableDrag: false,
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        builder: (context) {
          return const BankItems();
        });
  }
}
