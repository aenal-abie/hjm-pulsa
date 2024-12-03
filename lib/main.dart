import 'package:core/config/config.dart';
import 'package:core/di/container.dart';
import 'package:core/utils/get.dart';
import 'package:flutter/material.dart';

import 'buys/di.dart';
import 'buys/presentation/pages/phone_credit_screen.dart';

void main() {
  Constants.setEnvironment(Environment.dev);
  injectBuys();
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
      home: const PhoneCreditScreen()
    );
  }
}


