import 'package:another_flushbar/flushbar.dart' as another_flush_bar;
import 'package:another_flushbar/flushbar.dart';
import 'package:core/component/styles/colors.dart';
import 'package:core/component/styles/style.dart';
import 'package:core/presentation/manager/base_controller.dart';
import 'package:core/utils/connection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../component/atoms/index.dart';

class FlushNotification {
  static void showNotification(
      BuildContext context, String header, String? message,
      [int duration = 2]) {
    if (message?.isEmpty ?? true) return;

    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.GROUNDED,
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.elasticOut,
      backgroundColor: primaryColor500,
      isDismissible: true,
      duration: Duration(seconds: duration),
      padding: const EdgeInsets.only(
        left: 15.0,
        right: 15.0,
        bottom: 15.0,
        top: 15.0,
      ),
      icon: const Icon(
        Icons.notifications_active_outlined,
        color: Colors.white,
        size: 32.0,
      ),
      showProgressIndicator: true,
      progressIndicatorBackgroundColor: neutralColor500,
      titleText: Text(
        header,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          fontSize: 15.0,
          color: Colors.white,
        ),
      ),
      messageText: Text(
        message!,
        style: GoogleFonts.poppins(
          fontSize: 13.0,
          color: Colors.white,
        ),
      ),
    ).show(context);
  }
}

enum NotificationType {
  success(secondaryColor50, primaryColor500),
  fail(errorColor50, errorColor500),
  warning(warningColor50, warningColor500),
  normal(neutralColor50, neutralColor500);

  final Color color;
  final Color fontColor;

  const NotificationType(this.color, this.fontColor);
}

void _toast(BuildContext context, String? msg,
    {NotificationType notificationType = NotificationType.normal}) {
  if (msg?.isEmpty ?? true) return;
  showToast(
    msg,
    context: context,
    borderRadius: const BorderRadius.all(Radius.circular(4)),
    backgroundColor: notificationType.color,
    textStyle: bodyMediumStyle.copyWith(color: notificationType.fontColor),
    animation: StyledToastAnimation.scale,
    reverseAnimation: StyledToastAnimation.fade,
    position: StyledToastPosition.bottom,
    animDuration: const Duration(seconds: 1),
    duration: const Duration(seconds: 3),
    curve: Curves.elasticOut,
    reverseCurve: Curves.linear,
  );
}

void toast(BuildContext context, String? msg) {
  _toast(context, msg);
}

void toastSuccess(BuildContext context, String? msg) {
  _toast(context, msg, notificationType: NotificationType.success);
}

void toastError(BuildContext context, String? msg) {
  _toast(context, msg, notificationType: NotificationType.fail);
}

void toastWarning(BuildContext context, String? msg) {
  _toast(context, msg, notificationType: NotificationType.warning);
}

void showFlushBar(BuildContext context) => another_flush_bar.Flushbar(
      title: 'Hey Ninja',
      message:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
      duration: const Duration(seconds: 3),
    ).show(context);

class ShowToast {
  static void toast({String? message}) {
    Future.delayed(Duration.zero, () {
      Fluttertoast.showToast(
          msg: message ?? '',
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black54,
          textColor: Colors.white,
          fontSize: 14.0);
    });
  }
}

void onlineOrOfflineStatusNotification(
    BuildContext context, BaseController controller) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    ever(controller.noConnection, (callback) {
      if (callback == ConnectionStatus.offline) {
        Flushbar(
          backgroundColor: errorColor500,
          messageText: Center(
              child: GSText.body(
            "Koneksi Anda terputus, mencoba menghubungkan ulang",
            color: Colors.white,
          )),
          duration: const Duration(seconds: 3),
        ).show(context);
      } else if (callback == ConnectionStatus.online) {
        Flushbar(
          backgroundColor: successColor500,
          messageText: Center(
              child: GSText.body(
            "Anda Kembali Online",
            color: Colors.white,
          )),
          duration: const Duration(seconds: 3),
        ).show(context);
      }
    });
  });
}
