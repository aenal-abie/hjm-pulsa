import 'package:get/get.dart';
import 'package:pulsa/authentication/domain/use_cases/get_token.dart';
import 'package:pulsa/authentication/presentation/pages/login_screen.dart';
import 'package:pulsa/core/domain/use_cases/usecase.dart';
import 'package:pulsa/dashboard/presentation/pages/navigation_screen.dart';

import '../../domain/use_cases/login.dart';

class LoginController extends GetxController {
  final Login _login;
  final GetToken _getToken;

  LoginController(this._login, this._getToken);
  var username = "".obs;
  var password = "".obs;
  var loading = false.obs;

  void login() async {
    loading.value = true;
    var result = await _login.call(LoginParams(
      email: username.value,
      password: password.value,
    ));
    result.fold((fail) {
      Get.snackbar(
          'Login Gagal', "Silahkan cek kembali username dan password anda");
    }, (success) {
      Get.snackbar('Sukses', "Anda berhasil login $username");
      Get.offAll(NavigationScreen());
    });
    loading.value = false;
  }

  void clear() {
    username.value = '';
    password.value = '';
  }

  void checkLogin() async {
    var result = await _getToken(NoParams());
    result.fold((fail) {
      Get.offAll(LoginScreen());
    }, (success) {
      if (success.isEmpty) {
        Get.offAll(LoginScreen());
      }
    });
  }
}
