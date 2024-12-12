import 'package:flutter/material.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'package:indonesia/indonesia.dart';
import 'package:pulsa/buys/presentation/pages/phone_credit_screen.dart';

import '../../../core/presentation/atoms/style/colors.dart';
import '../../../core/presentation/atoms/style/text_style.dart';
import '../../../core/presentation/atoms/text/p_text.dart';
import '../../../core/presentation/atoms/utils/gap.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 6;

    final double itemWidth = size.width / 2.1;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          Container(
            padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16),
            decoration: BoxDecoration(
              color: bluePothan[50],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(20),
                Positioned(
                  top: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            HeroiconsSolid.devicePhoneMobile,
                            color: bluePothan,
                          ),
                          const SizedBox(width: 8),
                          PText(
                            "CHM Pulsa",
                            style:
                                heading3Medium.copyWith(color: bluePothan[600]),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            HeroiconsMicro.wallet,
                            color: bluePothan,
                          ),
                          Gap(5),
                          PText.heading6Medium(
                            rupiah(
                              1000000,
                            ),
                            color: bluePothan[950],
                          ),
                          SizedBox(width: 16),
                          Icon(
                            HeroiconsOutline.bell,
                            color: bluePothan[500],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Convert Pulsa Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: PText(
              "Prabayar",
              style: heading4Medium.copyWith(color: bluePothan[600]),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildIconTile(HeroiconsSolid.devicePhoneMobile, "Pulsa",
                    onTap: () => Get.to(PhoneCreditScreen())),
                _buildIconTile(HeroiconsSolid.bell, "Paket Data"),
                _buildIconTile(HeroiconsSolid.archiveBox, "Token Listrik"),
                _buildIconTile(HeroiconsSolid.adjustmentsVertical, "Top Up"),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Rate Pulsa Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: PText(
              "Paket Terlaris",
              style: heading4Medium.copyWith(color: bluePothan[600]),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: (itemWidth / itemHeight),
              padding: const EdgeInsets.all(16),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              children: [
                _buildRateCard("Telkomsel", "Rate 0,73", "30.000 - 10.000.000"),
                _buildRateCard("XL", "Rate 0,72", "50.000 - 10.000.000"),
                _buildRateCard("Axis", "Rate 0,72", "50.000 - 10.000.000"),
                _buildRateCard("Three", "Rate 0,78", "30.000 - 10.000.000"),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: bluePothan[500],
        items: const [
          BottomNavigationBarItem(
            icon: Icon(HeroiconsSolid.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(HeroiconsSolid.queueList),
            label: "Transaksi",
          ),
          BottomNavigationBarItem(
            icon: Icon(HeroiconsSolid.cog),
            label: "Pengaturan",
          ),
        ],
      ),
    );
  }

  Widget _buildIconTile(IconData icon, String title, {VoidCallback? onTap}) {
    return Center(
      child: InkWell(
        onTap: onTap,
        overlayColor: WidgetStateProperty.all(bluePothan[200]),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: bluePothan[500],
              ),
              PText(
                title,
                style: body1Regular.copyWith(
                  color: bluePothan[500],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRateCard(String title, String rate, String nominal) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bluePothan[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: body1Regular,
          ),
          const SizedBox(height: 8),
          PText(rate),
          const SizedBox(height: 4),
          PText(nominal),
        ],
      ),
    );
  }
}
