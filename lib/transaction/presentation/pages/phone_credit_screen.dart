import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pulsa/core/presentation/atoms/style/colors.dart';
import 'package:pulsa/core/presentation/atoms/text/p_text.dart';
import 'package:pulsa/core/presentation/atoms/widgets/app_bar.dart';

import '../../../core/di/container.dart';
import '../../../core/presentation/atoms/utils/gap.dart';
import '../../../product/domain/entities/category_entity.dart';
import '../manager/buy_controller.dart';
import '../widgets/phone_credit/add_phone_number.dart';
import '../widgets/phone_credit/product_list.dart';

class PhoneCreditScreen extends StatefulWidget {
  final Category packetType;

  const PhoneCreditScreen({super.key, required this.packetType});

  @override
  State<PhoneCreditScreen> createState() => _PhoneCreditScreenState();
}

class _PhoneCreditScreenState extends State<PhoneCreditScreen> {
  BuyController controller = Get.put(BuyController(di(), di(), di()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PAppBar(
        backgroundColor: bluePothan[950]!,
        title: "Pembelian",
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
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        bluePothan[950]!,
                        bluePothan[600]!,
                      ],
                    ),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(4),
                      bottomRight: Radius.circular(4),
                    )),
              ),
              AddPhoneNumber(
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
                  : controller.emptyList
                      ? NoProvider(
                          packetType: widget.packetType,
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
    return SingleChildScrollView(
      child: Column(
        children: [
          Gap(50),
          SvgPicture.asset("assets/backgrounds/no_phone_number.svg"),
          PText.body1Light(
            "Silahkan masukkan no hp yang\n akan diisikan ${packetType.value.toLowerCase()}",
            color: bluePothan[500],
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
