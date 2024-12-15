import 'package:pulsa/authentication/di.dart';
import 'package:pulsa/core/di/container.dart';

import 'transaction/di.dart';

void injectDI(){
  injectCore();
  injectAuthentication();
  injectBuys();
}