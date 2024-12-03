import 'package:core/component/atoms/gap.dart';
import 'package:core/di/container.dart';
import 'package:core/utils/get.dart';
import 'package:flutter/material.dart';
import 'package:pulsa/buys/presentation/manager/buy_controller.dart';

import '../widgets/phone_credit/add_phone_number.dart';
import '../widgets/phone_credit/product_list.dart';

class PhoneCreditScreen extends StatefulWidget {
  const PhoneCreditScreen({super.key});

  @override
  _PhoneCreditScreenState createState() => _PhoneCreditScreenState();
}

class _PhoneCreditScreenState extends State<PhoneCreditScreen> {
  BuyController controller = Get.put(BuyController(di()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AddPhoneNumber(buyController: controller),
          const GSGap(10),
          Obx(() {
            return Expanded(
                child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: controller.products.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ProductList(controller: controller,),
            ));
          }),
        ],
      ),
    );
  }
}
