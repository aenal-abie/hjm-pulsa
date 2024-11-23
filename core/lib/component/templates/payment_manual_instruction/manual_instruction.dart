import 'package:flutter/material.dart';

import 'bank.dart';
import 'bca_manual_instruction.dart';
import 'bni_manual_instruction.dart';
import 'bri_manual_instruction.dart';
import 'bsi_manual_instruction.dart';
import 'mandiri_manual_instruction.dart';
import 'permata_manual_instruction.dart';

class GSManualInstruction extends StatelessWidget {
  final String bank;
  final String accountNumber;

  const GSManualInstruction(
      {Key? key, required this.bank, required this.accountNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (bank == Banks.bri.value) {
      return BriManualInstruction(
        accountNumber: accountNumber,
      );
    } else if (bank == Banks.bni.value) {
      return BniManualInstruction(
        accountNumber: accountNumber,
      );
    } else if (bank == Banks.bca.value) {
      return BcaManualInstruction(
        accountNumber: accountNumber,
      );
    } else if (bank == Banks.bsi.value) {
      return BsiManualInstruction(
        accountNumber: accountNumber,
      );
    } else if (bank == Banks.mandiri.value) {
      return MandiriManualInstruction(
        accountNumber: accountNumber,
      );
    } else if (bank == Banks.permata.value) {
      return PermataManualInstruction(
        accountNumber: accountNumber,
      );
    }
    return const SizedBox();
  }
}
