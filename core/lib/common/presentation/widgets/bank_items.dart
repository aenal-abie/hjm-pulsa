import 'package:core/common/presentation/manager/bank_controller.dart';
import 'package:core/component/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../assets/manager/assets.gen.dart';
import '../../../component/atoms/fields/index.dart';

class BankItems extends StatelessWidget {
  const BankItems({Key? key, this.selectedBank}) : super(key: key);
  final Function(Banks)? selectedBank;

  @override
  Widget build(BuildContext context) {
    return GetX<BankController>(
      builder: (bankController) {
        return Padding(
            padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 5,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 12, height: 12),
                    GSText.body("Metode Pembayaran"),
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 5),
                        child: Assets.icons.close.svg(
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                GSTextLabelField(
                  'Cari',
                  onChange: (v) {
                    bankController.filter(v);
                  },
                  prefixIcon: Assets.icons.search.svg(),
                ),
                const SizedBox(height: 10),
                if (bankController.banks.isNotEmpty)
                  ...bankController.banks
                      .map((e) => _bankItem(e, bankController))
                else
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: GSText.body(
                        "Tidak ada hasil yang ditemukan untuk \"${bankController.keySearch}\"",
                        color: neutralColor200,
                      ),
                    ),
                  )
              ],
            ));
      },
    );
  }

  Widget _bankItem(Banks bank, BankController bankController) {
    if (bank == Banks.unknown) return const SizedBox.shrink();
    return InkWell(
      onTap: () {
        bankController.setBankCode(bank);
        Get.back();
        if (selectedBank != null) selectedBank!(bank);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              children: [
                SizedBox(
                  width: 100,
                  child: Image.asset(
                    bank.assetPath,
                    height: 18,
                    alignment: Alignment.centerLeft,
                  ),
                ),
                Expanded(
                  child: GSText.body(bank.bankName,
                      maxLines: 1, overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
          ),
          Container(
            height: 1,
            color: const Color(0xffA3A3A3).withOpacity(0.3),
          ),
        ],
      ),
    );
  }
}
