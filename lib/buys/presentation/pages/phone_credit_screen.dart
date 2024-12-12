import 'package:flutter/material.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'package:pulsa/buys/presentation/manager/buy_controller.dart';
import 'package:pulsa/core/presentation/atoms/style/colors.dart';
import 'package:pulsa/core/presentation/atoms/text/p_text.dart';
import 'package:pulsa/core/presentation/atoms/widgets/app_bar.dart';

import '../../../core/di/container.dart';
import '../../../core/presentation/atoms/utils/gap.dart';
import '../widgets/phone_credit/add_phone_number.dart';
import '../widgets/phone_credit/product_list.dart';

class PhoneCreditScreen extends StatefulWidget {
  const PhoneCreditScreen({super.key});

  @override
  _PhoneCreditScreenState createState() => _PhoneCreditScreenState();
}

class _PhoneCreditScreenState extends State<PhoneCreditScreen> {
  BuyController controller = Get.put(BuyController(di(), di()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PAppBar(),
      body: Column(
        children: [
          AddPhoneNumber(buyController: controller),
          const Gap(10),
          Obx(() {
            return Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: controller.products.isEmpty
                      ? const Center(
                    child: NoProvider(),
                  )
                      : ProductList(
                    controller: controller,
                  ),
                ));
          }),
        ],
      ),
    );
  }
}

class NoProvider extends StatelessWidget {
  const NoProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          HeroiconsOutline.devicePhoneMobile,
          size: 100,
          color: bluePothan,
        ),
        Gap(19),
        PText.body1Medium(
          "Silahkan masukkan no hp yang\n akan diisikan pulsa",
          color: bluePothan,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
