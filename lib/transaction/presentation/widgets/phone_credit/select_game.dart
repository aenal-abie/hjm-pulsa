import 'package:flutter/material.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'package:pulsa/core/presentation/atoms/style/colors.dart';

import '../../../../core/presentation/atoms/style/text_style.dart';
import '../../../../core/presentation/atoms/text/p_text.dart';
import '../../../../core/presentation/atoms/utils/gap.dart';
import '../../../../product/domain/entities/category_entity.dart';
import '../../manager/buy_controller.dart';
import '../../pages/select_game_screen.dart';

class SelectedGame extends StatelessWidget {
  final BuyController buyController;

  const SelectedGame({super.key, required this.buyController});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(HeroiconsOutline.fire, size: 100, color: bluePothan[400]),
          ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                builder: (BuildContext context) {
                  return ListGame(buyController: buyController);
                },
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: PText(
                "Pilih Game",
                style: heading6Semibold.copyWith(color: bluePothan),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ListGame extends StatelessWidget {
  const ListGame({
    super.key,
    required this.buyController,
  });

  final BuyController buyController;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> games = [
      {"name": "Free Fire", "code": "FREEFIRE", "icon": "freefire.webp"},
      {
        "name": "Mobile Legends",
        "code": "MOBILELEGENDS",
        "icon": "mobile_legends.webp"
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 16),
          PText(
            "Pilih Game",
            style: heading6Semibold,
          ),
          const SizedBox(height: 8),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: games.length,
            itemBuilder: (context, index) {
              final game = games[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: ListTile(
                  visualDensity: VisualDensity(vertical: 3),
                  leading: CircleAvatar(
                    backgroundColor: natural[100],
                    radius: 20,
                    child: Icon(
                      HeroiconsOutline.fire,
                      size: 22,
                      color: bluePothan[500],
                    ),
                  ),
                  title: PText(
                    game['name'],
                    style: heading6Semibold.copyWith(color: bluePothan),
                  ),
                  trailing: Image.asset("assets/provider/${game['icon']}"),
                  onTap: () {
                    buyController.gameName.value = game['name'];
                    buyController.gameIcon.value = game['icon'];
                    buyController.getProducts("GAME", game['code']);
                    Get.back();
                    Get.off(() => SelectGameScreen(
                          packetType: Category.game,
                        ));
                    // Handle tap here
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
