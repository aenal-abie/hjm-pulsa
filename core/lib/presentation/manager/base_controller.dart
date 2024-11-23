import 'package:core/utils/connection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/error/failures.dart';
import 'user_type_mixin.dart';

enum UserType {
  admin("admin", "Admin"),
  kjsb("kjsb", "KJSB"),
  surveyor("surveyor", "Surveyor"),
  customerService("customer_service", "CS GetSurvey"),
  consultant("consultant", "Konsultan"),
  user("users", "Pemohon"),
  unknown("unknown", "Tidak diketahui");

  final String value;
  final String label;

  const UserType(this.value, this.label);
}

class BaseController extends GetxController with UserTypeMixin {
  var errorMessage = "".obs;
  var loading = false.obs;
  var noConnection = ConnectionStatus.unknown.obs;
  var userType = UserType.unknown.obs;

  bool get isLoading => loading.value;

  BaseController() {
    noConnection.value = ConnectionStatus.unknown;
    userType.value = getRole();
  }

  get isUserRole => userType.value == UserType.user;

  get isKjsbRole => userType.value == UserType.kjsb;

  get isSurveyorRole => userType.value == UserType.surveyor;

  get isConsultantRole => userType.value == UserType.consultant;

  void refreshRole() {
    userType.value = getRole();
  }

  @protected
  void setErrorMessage(String? message) async {
    if (message != null) {
      loading.value = false;
      errorMessage.value = message;
      await Future.delayed(const Duration(microseconds: 5));
      errorMessage.value = "";
    }
  }

  void checkConnection(Failure failure) {
    if (failure is ConnectionFailure) {
      updateConnectionStatus(ConnectionStatus.offline);
    }
  }

  @override
  void onInit() {
    super.onInit();
    refreshRole();
  }

  void setOnline() {
    updateConnectionStatus(ConnectionStatus.online);
  }

  void updateConnectionStatus(ConnectionStatus status) {
    if (status == ConnectionStatus.online &&
        noConnection.value == ConnectionStatus.offline) {
      noConnection.value = status;
    } else if (status == ConnectionStatus.offline &&
        [ConnectionStatus.unknown, ConnectionStatus.online]
            .contains(noConnection.value)) {
      noConnection.value = status;
    } else {
      noConnection.value = ConnectionStatus.unknown;
    }
  }

  String get getErrorMessage {
    var tempMessage = errorMessage.value;
    errorMessage.value = "";
    return tempMessage;
  }

  void onProgress() {
    errorMessage.value = "";
    loading.value = true;
  }

  @protected
  void endProgress() {
    loading.value = false;
  }
}
