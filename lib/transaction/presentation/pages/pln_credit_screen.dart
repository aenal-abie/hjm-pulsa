import 'package:flutter/material.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'package:pulsa/core/presentation/atoms/style/colors.dart';
import 'package:pulsa/core/presentation/atoms/text/p_text.dart';
import 'package:pulsa/core/presentation/atoms/widgets/app_bar.dart';

import '../../../core/di/container.dart';
import '../../../core/presentation/atoms/utils/gap.dart';
import '../../../product/domain/entities/category_entity.dart';
import '../manager/buy_controller.dart';
import '../widgets/phone_credit/add_pln_number.dart';
import '../widgets/phone_credit/product_list.dart';

class PlnCreditScreen extends StatefulWidget {
  final Category packetType;

  const PlnCreditScreen({super.key, required this.packetType});

  @override
  State<PlnCreditScreen> createState() => _PlnCreditScreenState();
}

class _PlnCreditScreenState extends State<PlnCreditScreen> {
  BuyController controller = Get.put(BuyController(di(), di(), di()));

  @override
  void initState() {
    super.initState();
    controller.getProducts(widget.packetType.value, widget.packetType.value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PAppBar(
        backgroundColor: bluePothan[950]!,
        title: "Token  PLN ",
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
              AddPlnNumber(
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
          HeroiconsOutline.devicePhoneMobile,
          size: 100,
          color: bluePothan,
        ),
        Gap(19),
        PText.body1Medium(
          "Silahkan masukkan no pelangan/No.Meter yang akan diisikan token",
          color: bluePothan,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
