import 'package:pulsa/authentication/domain/use_cases/logout.dart';
import 'package:pulsa/core/domain/use_cases/usecase.dart';
import 'package:pulsa/customer/domain/entities/customer_entity.dart';
import 'package:pulsa/customer/domain/use_cases/get_customer.dart';
import 'package:pulsa/user/domain/use_cases/changing_pin.dart';

import '../../../authentication/presentation/pages/login_screen.dart';
import '../../../core/presentation/atoms/utils/gap.dart';

class UserController extends GetxController {
  final GetCustomer _getCustomer;
  final ChangingPin _changingPin;
  final Logout _logout;

  UserController(this._getCustomer, this._changingPin, this._logout);

  var customer = CustomerEntity().obs;
  var oldPin = "";
  var newPin = "";
  var reNewPin = "";
  var changePinLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getCustomer();
  }

  Future<void> getCustomer() async {
    final result = await _getCustomer(NoParams());
    result.fold((l) => null, (r) => customer.value = r);
  }

  Future<bool> changePin() async {
    if (!validatePinInput()) {
      return false;
    }
    changePinLoading.value = true;
    var success = false;
    var param = ChangingPinParam(
      oldPin: oldPin,
      newPin: newPin,
    );
    final result = await _changingPin(param);
    result.fold((l) {
      Get.snackbar("Kesalahan", "${l.message}",
          snackPosition: SnackPosition.TOP, overlayBlur: 10, barBlur: 10);
    }, (r) {
      success = true;
    });
    changePinLoading.value = false;
    return success;
  }

  bool validatePinInput() {
    var isSame = newPin == reNewPin;
    if (!isSame) {
      Get.snackbar(
          "Kesalahan", "PIN baru yang diinputkan tidak diulangi dengan benar",
          snackPosition: SnackPosition.TOP, overlayBlur: 10, barBlur: 10);
    }
    return isSame;
  }

  Future<void> logout() async {
    var result = await _logout(NoParams());
    result.fold((fail) {
      Get.snackbar('Logout Gagal', "Silahkan coba kembali");
    }, (success) {
      Get.back();
      Get.offAll(LoginScreen());
    });
  }
}
