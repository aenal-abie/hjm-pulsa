import 'package:core/component/atoms/gap.dart';
import 'package:flutter/material.dart';
import 'package:pulsa/buys/presentation/widgets/phone_credit/add_phone_number.dart';
import 'package:pulsa/buys/presentation/widgets/phone_credit/prices_list.dart';

import '../widgets/phone_credit/buying_action.dart';

class PhoneCreditScreen extends StatefulWidget {
  const PhoneCreditScreen({super.key});

  @override
  _PhoneCreditScreenState createState() => _PhoneCreditScreenState();
}

class _PhoneCreditScreenState extends State<PhoneCreditScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          AddPhoneNumber(),
          GSGap(10),
          Expanded(child: Padding(
            padding: EdgeInsets.all(16.0),
            child: PricesList(),
          )),
        ],
      ),
    );
  }
}
