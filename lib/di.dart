import 'package:pulsa/authentication/di.dart';
import 'package:pulsa/core/di/container.dart';

import 'buys/di.dart';

void injectDI(){
  injectCore();
  injectBuys();
  injectAuthentication();
}