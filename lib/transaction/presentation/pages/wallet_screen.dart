import 'package:flutter/material.dart';
import 'package:pulsa/product/domain/entities/category_entity.dart';
import 'package:pulsa/transaction/presentation/pages/select_wallet_screen.dart';
import 'package:pulsa/transaction/presentation/widgets/phone_credit/select_wallet.dart';

import '../../../core/di/container.dart';
import '../../../core/presentation/atoms/utils/gap.dart';
import '../../../core/presentation/atoms/widgets/app_bar.dart';
import '../manager/buy_controller.dart';

class WalletScreen extends StatefulWidget {
  final Category category;

  const WalletScreen({super.key, required this.category});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  BuyController controller = Get.put(BuyController(di(), di(), di()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PAppBar(
        title: "Top Up E-Wallet",
        onPressed: () {
          Get.back();
        },
      ),
      body: Obx(() {
        return controller.eWalletName.isEmpty
            ? SelectWallet(
                buyController: controller,
              )
            : Center(
                child: SelectWalletScreen(
                packetType: Category.wallet,
              ));
        SizedBox();
      }),
    );
  }
}
