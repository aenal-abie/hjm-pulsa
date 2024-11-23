import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'notification.dart';

Future<void> copyToClipBoard(BuildContext context, String text,
    {String? message}) async {
  Clipboard.setData(ClipboardData(text: text));
  toast(context, message);
}
