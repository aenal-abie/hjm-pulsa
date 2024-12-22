import 'package:flutter/material.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'package:indonesia/indonesia.dart';
import 'package:pulsa/transaction/presentation/pages/wallet_screen.dart';

import '../../../core/di/container.dart';
import '../../../core/presentation/atoms/style/colors.dart';
import '../../../core/presentation/atoms/style/text_style.dart';
import '../../../core/presentation/atoms/text/p_text.dart';
import '../../../core/presentation/atoms/utils/gap.dart';
import '../../../customer/presentation/manager/customer_controller.dart';
import '../../../product/domain/entities/category_entity.dart';
import '../../../transaction/presentation/pages/phone_credit_screen.dart';
import '../../../transaction/presentation/pages/pln_credit_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final customerController = Get.put(CustomerController(di()));

  @override
  void initState() {
    super.initState();
    customerController.getBalance();
  }

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
                Row(
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
                          "HJM Pulsa",
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
                        Obx(() {
                          return PText.heading6Medium(
                            rupiah(
                              customerController.balance.value.balance ?? 0,
                            ),
                            color: bluePothan[950],
                          );
                        }),
                        SizedBox(width: 16),
                        Icon(
                          HeroiconsOutline.bell,
                          color: bluePothan[500],
                        ),
                      ],
                    ),
                  ],
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
                Expanded(
                  child: _buildIconTile(
                    HeroiconsOutline.devicePhoneMobile,
                    "Pulsa",
                    onTap: () => Get.to(
                      PhoneCreditScreen(
                        packetType: Category.voice,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: _buildIconTile(
                    HeroiconsOutline.arrowsUpDown,
                    "Paket Data",
                    onTap: () => Get.to(
                      () => PhoneCreditScreen(
                        packetType: Category.data,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                    child: _buildIconTile(
                  HeroiconsOutline.bolt,
                  "Token Listrik",
                  onTap: () => Get.to(
                    () => PlnCreditScreen(packetType: Category.electricity),
                  ),
                )),
                Expanded(
                    child: _buildIconTile(
                  HeroiconsOutline.wallet,
                  "Top Up Wallet",
                  onTap: () => Get.to(
                    () => WalletScreen(
                      category: Category.wallet,
                    ),
                  ),
                )),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Rate Pulsa Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: PText(
              "Pascabayar",
              style: heading4Medium.copyWith(color: bluePothan[600]),
            ),
          ),
          Expanded(
            child: Center(
              child: PText(
                "Fitur-fitur lain masih proses pengembangan\n Segera hadir",
                style: heading6Regular.copyWith(color: natural),
                textAlign: TextAlign.center,
              ),
            ),
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
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 30,
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
