import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'package:pulsa/core/presentation/atoms/style/colors.dart';

import '../../../../core/presentation/atoms/style/text_style.dart';
import '../../../../core/presentation/atoms/text/p_text.dart';
import '../../manager/buy_controller.dart';

class SelectWallet extends StatelessWidget {
  final BuyController buyController;

  const SelectWallet({super.key, required this.buyController});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(HeroiconsOutline.wallet, size: 100, color: bluePothan[400]),
          ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                builder: (BuildContext context) {
                  return ListWallet(buyController: buyController);
                },
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: PText(
                "Pilih Wallet Anda",
                style: heading6Semibold.copyWith(color: bluePothan),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ListWallet extends StatelessWidget {
  const ListWallet({
    super.key,
    required this.buyController,
  });

  final BuyController buyController;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> eWallets = [
      {"name": "DANA", "icon": "dana.svg"},
      {"name": "GoPay", "icon": "gopay.svg"},
      {"name": "OVO", "icon": "ovo.svg"},
      {"name": "ShopeePay", "icon": "shopeepay.svg"},
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 16),
          PText(
            "Pilih E-Wallet Tujuan",
            style: heading6Semibold,
          ),
          const SizedBox(height: 8),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: eWallets.length,
            itemBuilder: (context, index) {
              final eWallet = eWallets[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: ListTile(
                  visualDensity: VisualDensity(vertical: 3),
                  leading: CircleAvatar(
                    backgroundColor: bluePothan[100],
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: SvgPicture.asset(
                          "assets/provider/${eWallet['icon']}"),
                    ),
                  ),
                  title: PText(
                    eWallet['name'],
                    style: heading6Semibold.copyWith(color: bluePothan),
                  ),
                  onTap: () {
                    buyController.eWalletName.value = eWallet['name'];
                    buyController.getProducts("WALLET", eWallet['name']);
                    Navigator.pop(context);
                    // Handle tap here
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
