import 'package:get/get.dart';
import 'package:pulsa/buys/presentation/pages/phone_credit_screen.dart';

import '../../domain/use_cases/login.dart';

class LoginController extends GetxController {
  final Login _login;
  LoginController(this._login);
  var username = "".obs;
  var password = "".obs;

  void login() async {
    var result = await _login.call(LoginParams(
      email: username.value,
      password: password.value,
    ));
    result.fold((fail) {
      Get.snackbar('Login failed', fail.message ?? "");
    }, (success) {
      Get.snackbar('Sukses', "Anda berhasil login $username");
      Get.to(PhoneCreditScreen());
    });
  }

  void clear() {
    username.value = '';
    password.value = '';
  }
}
