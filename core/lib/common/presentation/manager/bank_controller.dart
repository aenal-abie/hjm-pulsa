import 'package:core/presentation/manager/base_controller.dart';
import 'package:get/get.dart';

enum Banks {
  bca("BCA", "BCA Virtual Account", 'assets/payment/bca.png'),
  mandiri("MANDIRI", "Mandiri Virtual Account", 'assets/payment/mandiri.jpg'),
  bni("BNI", "BNI Virtual Account", 'assets/payment/bni.png'),
  bri("BRI", "BRI Virtual Account", 'assets/payment/bri.jpeg'),
  bsi("BSI", "BSI Virtual Account", 'assets/payment/bsi.png'),
  permata(
      "PERMATA", "Permata Virtual Account", 'assets/payment/permatabank.png'),
  unknown("", "", '');

  final String code;
  final String bankName;
  final String assetPath;

  const Banks(this.code, this.bankName, this.assetPath);
}

class BankController extends BaseController {
  var agreement = false.obs;
  var keySearch = "";
  var bankCode = Banks.unknown.obs;

  var banksTemp = Banks.values;
  var banks = Banks.values.obs;

  void setBankCode(Banks bankCode) {
    this.bankCode.value = bankCode;
  }

  void filter(String v) {
    keySearch = v;
    if (v.isEmpty) {
      banks.value = banksTemp;
    } else {
      banks.value = banksTemp
          .where((element) =>
              element.bankName.toLowerCase().contains(v.toLowerCase()))
          .toList();
    }
  }
}
