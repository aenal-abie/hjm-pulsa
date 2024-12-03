import 'package:core/component/atoms/fields/text.dart';
import 'package:core/component/atoms/gap.dart';
import 'package:core/utils/get.dart';
import 'package:flutter/material.dart';
import 'package:pulsa/buys/presentation/widgets/phone_credit/buying_action.dart';

import '../../manager/buy_controller.dart';

class ProductList extends StatelessWidget {
  final BuyController controller;

  const ProductList({super.key, required this.controller});

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
        GSText.headingSeven("Pilih jumlah pulsa"),
        const GSGap(10),
        Expanded(
          child: GridView.count(
            childAspectRatio: (itemWidth / itemHeight),
            // Create a grid with 2 columns. If you change the scrollDirection to
            // horizontal, this produces 2 rows.
            crossAxisCount: 2,
            children: List.generate(products.length, (index) {
              var isEven = index % 2 == 0;
              return Padding(
                padding: EdgeInsets.only(
                    left: isEven ? 0 : 8, bottom: 8, right: isEven ? 8 : 0),
                child: InkWell(
                  onTap: () {
                    controller.selectProduct(products[index]);
                  },
                  child: Obx(() {
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          border: Border.fromBorderSide(BorderSide(
                              width: 1,
                              color: controller.selectedProduct.value.code ==
                                      products[index].code
                                  ? Colors.amber
                                  : Colors.black12)),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              width: size.width,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Center(
                                  child: Text(
                                    '${products[index].price}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(color: Colors.black87),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              'Rp ${products[index].sellingPrice}',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(color: Colors.teal, fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              );
            }),
          ),
        ),
        Column(
          children: [BuyingAction(controller: controller,)],
        ),
      ],
    );
  }
}
