import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'package:pulsa/core/presentation/atoms/style/colors.dart';
import 'package:pulsa/core/presentation/atoms/text/p_text.dart';

import '../../../core/presentation/atoms/style/text_style.dart';
import '../../../core/presentation/atoms/utils/gap.dart';
import '../../../product/domain/entities/category_entity.dart';
import '../manager/buy_controller.dart';
import '../widgets/phone_credit/add_wallet_number.dart';
import '../widgets/phone_credit/product_list.dart';
import '../widgets/phone_credit/select_wallet.dart';

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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListTile(
            dense: true,
            shape: OutlineInputBorder(
                borderSide: BorderSide(color: natural[300]!)),
            leading: CircleAvatar(
              backgroundColor: bluePothan[100],
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: SvgPicture.asset(
                    "assets/provider/${controller.eWalletName.value.toLowerCase()}.svg"),
              ),
            ),
            title: Row(
              children: [
                Expanded(
                  child: PText(
                    controller.eWalletName.value,
                    style: heading6Semibold.copyWith(color: bluePothan),
                  ),
                ),
                Icon(
                  HeroiconsOutline.chevronDown,
                  size: 20,
                  color: natural,
                ),
              ],
            ),
            onTap: () {
              showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                builder: (BuildContext context) {
                  return ListWallet(buyController: controller);
                },
              );
            },
          ),
        ),
        AddWalletNumber(
          buyController: controller,
          packetType: widget.packetType,
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
