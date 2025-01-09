import 'package:flutter/material.dart';
import 'package:pulsa/product/domain/entities/category_entity.dart';
import 'package:pulsa/transaction/presentation/widgets/phone_credit/select_game.dart';

import '../../../core/di/container.dart';
import '../../../core/presentation/atoms/utils/gap.dart';
import '../../../core/presentation/atoms/widgets/app_bar.dart';
import '../manager/buy_controller.dart';

class GameScreen extends StatefulWidget {
  final Category category;

  const GameScreen({super.key, required this.category});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  BuyController controller = Get.put(BuyController(di(), di(), di()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PAppBar(
        title: "Top Up Game",
        onPressed: () {
          Get.back();
        },
      ),
      body: SelectedGame(
        buyController: controller,
      ),
    );
  }
}
