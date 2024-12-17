import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulsa/di.dart';

import 'core/presentation/atoms/utils/keyboard.dart';
import 'dashboard/presentation/pages/navigation_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injectDI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => hideKeyboard(context),
      child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'HJM Pulsa App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
            useMaterial3: true,
          ),
          home: const NavigationScreen()),
    );
  }
}
