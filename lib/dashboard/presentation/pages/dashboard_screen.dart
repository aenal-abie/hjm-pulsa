import 'package:flutter/material.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'package:indonesia/indonesia.dart';
import 'package:pulsa/transaction/presentation/pages/wallet_screen.dart';

import '../../../core/di/container.dart';
import '../../../core/presentation/atoms/style/colors.dart';
import '../../../core/presentation/atoms/style/text_style.dart';
import '../../../core/presentation/atoms/text/p_text.dart';
import '../../../core/presentation/atoms/utils/gap.dart';
import '../../../core/presentation/atoms/utils/windows.dart';
import '../../../product/domain/entities/category_entity.dart';
import '../../../transaction/presentation/pages/payments_screen.dart';
import '../../../transaction/presentation/pages/phone_credit_screen.dart';
import '../../../transaction/presentation/pages/pln_credit_screen.dart';
import '../../../user/presentation/manager/user_controller.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with WidgetsBindingObserver {
  final UserController userController =
      Get.put(UserController(di(), di(), di()));

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    userController.getCustomer();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      setSystemUIOverlayStyle();
    }
  }

  @override
  Widget build(BuildContext context) {
    setSystemUIOverlayStyle();
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
            height: 180,
            padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16),
            decoration: BoxDecoration(
              color: bluePothan[950],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(20),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PText.body2Light(
                            "Assalamu'alaikum",
                            color: Colors.white,
                          ),
                          Obx(() {
                            return PText(
                              userController.customer.value.name ?? "",
                              style:
                                  heading5Medium.copyWith(color: Colors.white),
                            );
                          }),
                        ],
                      ),
                    ),
                    Icon(
                      HeroiconsOutline.bell,
                      color: Colors.white,
                    ),
                  ],
                ),
                Gap(28),
                InkWell(
                  onTap: () {
                    Get.to(() => PaymentsScreen());
                  },
                  child: Row(
                    children: [
                      Icon(
                        HeroiconsMicro.wallet,
                        color: Colors.white,
                        size: 42,
                      ),
                      Gap(5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PText.body2Light(
                            "Saldo Anda",
                            color: Colors.white,
                          ),
                          Obx(() {
                            return PText.heading6Medium(
                                rupiah(
                                  userController.customer.value.balance ?? "",
                                ),
                                color: Colors.white);
                          }),
                        ],
                      ),
                      SizedBox(width: 16),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildIconTile(
                  HeroiconsOutline.devicePhoneMobile,
                  "Pulsa",
                  onTap: () => Get.to(
                    PhoneCreditScreen(
                      packetType: Category.voice,
                    ),
                  ),
                ),
                _buildIconTile(
                  HeroiconsOutline.arrowsUpDown,
                  "Data",
                  onTap: () => Get.to(
                    () => PhoneCreditScreen(
                      packetType: Category.data,
                    ),
                  ),
                ),
                _buildIconTile(
                  HeroiconsOutline.bolt,
                  "Listrik",
                  onTap: () => Get.to(
                    () => PlnCreditScreen(packetType: Category.electricity),
                  ),
                ),
                _buildIconTile(
                  HeroiconsOutline.wallet,
                  "Dompet",
                  onTap: () => Get.to(
                    () => WalletScreen(
                      category: Category.wallet,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const Gap(24),

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
        borderRadius: BorderRadius.circular(50),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: CircleAvatar(
            backgroundColor: natural[50],
            radius: 38,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  size: 22,
                  color: bluePothan[500],
                ),
                PText(
                  title,
                  style: body2Bold.copyWith(
                    color: bluePothan[500],
                  ),
                )
              ],
            ),
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
