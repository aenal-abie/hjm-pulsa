import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void copyToClipboard(BuildContext context, textToCopy) {
  Clipboard.setData(ClipboardData(text: textToCopy));
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Disalain  ke clipboard!'),
    ),
  );
}

String formatText(String input) {
  return input
      .replaceAllMapped(
        RegExp(r".{1,4}"), // Cocokkan setiap 1-4 karakter
        (match) => "${match.group(0)} ",
      )
      .trim(); // Hilangkan spasi di akhir
}
