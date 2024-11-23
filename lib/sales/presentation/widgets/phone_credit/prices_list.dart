import 'package:core/component/atoms/fields/text.dart';
import 'package:flutter/material.dart';
import 'package:pulsa/sales/presentation/widgets/phone_credit/buying_action.dart';

class PricesList extends StatelessWidget {
  const PricesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GSText("Pilih  pulsa"),
        Expanded(
          child: GridView.count(
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
                  color: Colors.red,
                  child: Center(
                    child: Text(
                      'Item $index',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
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
