import 'package:flutter/material.dart';
import 'package:indonesia/indonesia.dart';
import 'package:pulsa/core/presentation/atoms/style/colors.dart';
import 'package:pulsa/core/presentation/atoms/style/text_style.dart';
import 'package:pulsa/core/presentation/atoms/utils/keyboard.dart';
import 'package:pulsa/product/domain/entities/product_entity.dart';

import '../../../../core/presentation/atoms/text/p_text.dart';
import '../../../../core/presentation/atoms/utils/gap.dart';
import '../../../../product/domain/entities/category_entity.dart';
import '../../manager/buy_controller.dart';
import 'buying_action.dart';

class ProductList extends StatelessWidget {
  final Category packetType;
  final BuyController controller;

  const ProductList(
      {super.key, required this.controller, required this.packetType});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var products = controller.products.value;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 6;

    final double itemWidth = size.width / 2;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        PText(
          "Pilih Paket ${packetType.value}",
          style: heading6Semibold.copyWith(color: black[950]),
        ),
        const Gap(5),
        Expanded(
          child: GridView.count(
            childAspectRatio: (itemWidth / itemHeight),
            // Create a grid with 2 columns. If you change the scrollDirection to
            // horizontal, this produces 2 rows.
            crossAxisCount: 2,
            children: List.generate(products.length, (index) {
              var isEven = index % 2 == 0;
              return Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: isEven ? 0 : 8, bottom: 8, right: isEven ? 8 : 0),
                  child: InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(7)),
                    onTap: () {
                      hideKeyboard(context);
                      controller.selectProduct(products[index]);
                    },
                    child: Obx(() {
                      return Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.fromBorderSide(BorderSide(
                                width: 1,
                                color: controller.selectedProduct.value.code ==
                                        products[index].code
                                    ? bluePothan
                                    : natural[100]!)),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: PriceItem(product: products[index]),
                      );
                    }),
                  ),
                ),
              );
            }),
          ),
        ),
        Column(
          children: [
            BuyingAction(
              controller: controller,
              packetType: packetType,
            )
          ],
        ),
      ],
    );
  }
}

class PriceItem extends StatelessWidget {
  const PriceItem({
    super.key,
    required this.product,
  });

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${product.name}',
          style: heading3Medium.copyWith(fontSize: 20, color: bluePothan[950]),
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            rupiah(product.price),
            style: body1Regular.copyWith(color: bluePothan[500]),
          ),
        ),
      ],
    );
  }
}
