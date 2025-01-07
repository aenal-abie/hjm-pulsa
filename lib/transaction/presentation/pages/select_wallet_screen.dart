import 'package:flutter/material.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'package:pulsa/core/presentation/atoms/style/colors.dart';
import 'package:pulsa/core/presentation/atoms/text/p_text.dart';

import '../../../core/presentation/atoms/utils/gap.dart';
import '../../../core/presentation/atoms/widgets/app_bar.dart';
import '../../../product/domain/entities/category_entity.dart';
import '../manager/buy_controller.dart';
import '../widgets/phone_credit/add_wallet_number.dart';
import '../widgets/phone_credit/product_list.dart';

class SelectWalletScreen extends StatefulWidget {
  final Category packetType;

  const SelectWalletScreen({super.key, required this.packetType});

  @override
  State<SelectWalletScreen> createState() => _SelectWalletScreenState();
}

class _SelectWalletScreenState extends State<SelectWalletScreen> {
  BuyController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PAppBar(
        backgroundColor: bluePothan[950]!,
        title: "Top Up E-Wallet",
        titleColor: Colors.white,
        onPressed: () {
          Get.back();
        },
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 90,
                padding:
                    const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16),
                decoration: BoxDecoration(
                    color: bluePothan[950],
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(4),
                      bottomRight: Radius.circular(4),
                    )),
              ),
              AddWalletNumber(
                buyController: controller,
                packetType: widget.packetType,
              ),
            ],
          ),
          Obx(() {
            return Expanded(
                child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: controller.getProductLoading.isTrue
                  ? Center(
                      child: SizedBox(
                          width: 40,
                          height: 40,
                          child: const CircularProgressIndicator(
                            strokeWidth: 2,
                          )),
                    )
                  : controller.products.isEmpty
                      ? Center(
                          child: NoProvider(
                            packetType: widget.packetType,
                          ),
                        )
                      : ProductList(
                          controller: controller,
                          packetType: widget.packetType,
                        ),
            ));
          }),
        ],
      ),
    );
  }
}

class NoProvider extends StatelessWidget {
  final Category packetType;

  const NoProvider({super.key, required this.packetType});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          HeroiconsOutline.wallet,
          size: 100,
          color: bluePothan,
        ),
        Gap(19),
        PText.body1Medium(
          "Mohon maaf, \npaket dari wallet  belum tersedia",
          color: bluePothan,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
