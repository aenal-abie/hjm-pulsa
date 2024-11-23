import 'package:flutter/material.dart';
import 'package:pulsa/sales/presentation/widgets/phone_credit/add_phone_number.dart';
import 'package:pulsa/sales/presentation/widgets/phone_credit/prices_list.dart';

import '../widgets/phone_credit/buying_action.dart';

class PhoneCreditScreen extends StatefulWidget {
  const PhoneCreditScreen({super.key});

  @override
  _PhoneCreditScreenState createState() => _PhoneCreditScreenState();
}

class _PhoneCreditScreenState extends State<PhoneCreditScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              AddPhoneNumber(),
              Expanded(child: PricesList()),
            ],
          ),
        ),
      ),
    );
  }
}
