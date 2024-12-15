import 'package:flutter/material.dart';
import 'package:pulsa/core/presentation/atoms/buttons/primary_button.dart';
import 'package:pulsa/core/presentation/atoms/text/p_text.dart';

import '../../../../core/presentation/atoms/utils/gap.dart';
import '../../manager/buy_controller.dart';
import '../../pages/detail_payment_screen.dart';

class ProcessingProduct extends StatelessWidget {
  final BuyController controller;

  const ProcessingProduct({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Logo and title
        SizedBox(
          width: 100,
          height: 100,
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
              strokeWidth:
                  2.0, // Make the progress indicator stroke wider for symmetry
            ),
          ),
        ),
        Obx(() {
          return PText.heading6Medium(
            controller.secondNavigation.isNotEmpty
                ? "Menunggu ${controller.secondNavigation.value} detik"
                : "Proses pemesanan...",
            color: Colors.red,
          );
        }),
        Gap(10),
        // Payment details
        Obx(() {
          return (controller.orderSuccess.isFalse)
              ? SizedBox.shrink()
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: PrimaryButton(
                          text: "Lihat detail",
                          onPressed: () {
                            Get.to(DetailPaymentScreen());
                          },
                        ),
                      ),
                    ],
                  ),
                );
        }),
      ],
    );
  }
}
