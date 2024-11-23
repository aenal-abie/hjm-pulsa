import 'package:flutter/material.dart';
import 'package:pulsa/sales/presentation/widgets/phone_credit/add_phone_number.dart';

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
        body: Column(
          children: [
            AddPhoneNumber()
          ],
        ),
      ),
    );
  }
}
