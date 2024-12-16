import 'package:pulsa/authentication/di.dart';
import 'package:pulsa/core/di/container.dart';
import 'package:pulsa/customer/di.dart';
import 'package:pulsa/product/di.dart';

import 'transaction/di.dart';

void injectDI() {
  injectCore();
  injectAuthentication();
  injectProduct();
  injectCustomer();
  injectTransactions();
}
