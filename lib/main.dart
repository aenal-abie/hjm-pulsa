import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulsa/di.dart';

import 'authentication/presentation/pages/login_screen.dart';
import 'buys/di.dart';
import 'buys/presentation/pages/phone_credit_screen.dart';

void main() {
  injectDI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const LoginScreen());
  }
}
