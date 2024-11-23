import 'package:core/component/atoms/fields/text.dart';
import 'package:core/component/atoms/gap.dart';
import 'package:flutter/material.dart';
import 'package:pulsa/sales/presentation/widgets/phone_credit/buying_action.dart';

class PricesList extends StatelessWidget {
  const PricesList({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 6;

    final double itemWidth = size.width / 2;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GSText.headingSeven("Pilih jumlah pulsa"),
        GSGap(10),
        Expanded(
          child: GridView.count(
            childAspectRatio: (itemWidth / itemHeight),
            // Create a grid with 2 columns. If you change the scrollDirection to
            // horizontal, this produces 2 rows.
            crossAxisCount: 2,
            // Generate 100 widgets that display their index in the List.
            children: List.generate(20, (index) {
              var isGanjil = index % 2 == 0;
              return Padding(
                padding: EdgeInsets.only(
                    left: isGanjil ? 0 : 8, bottom: 8, right: isGanjil ? 8 : 0),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.black12,
                      border: Border.fromBorderSide(BorderSide(width: .4, color: Colors.black12)),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
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
                                '${index + 1}.000',
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
                          'Rp ${index + 1}.000',
                          style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.teal, fontSize:18),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
        Column(
          children: [BuyingAction()],
        ),
      ],
    );
  }
}
