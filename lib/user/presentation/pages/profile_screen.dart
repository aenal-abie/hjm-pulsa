import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'package:indonesia/indonesia.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pulsa/core/presentation/atoms/style/colors.dart';
import 'package:pulsa/core/presentation/atoms/style/text_style.dart';
import 'package:pulsa/user/presentation/manager/user_controller.dart';
import 'package:pulsa/user/presentation/pages/changing_pin.dart';

import '../../../core/di/container.dart';
import '../../../core/presentation/atoms/text/p_text.dart';
import '../../../core/presentation/atoms/utils/gap.dart';
import '../../../core/presentation/atoms/widgets/app_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final UserController userController =
      Get.put(UserController(di(), di(), di()));
  String appVersion = "";

  @override
  void initState() {
    super.initState();
    userController.getCustomer();
    getLocalVersion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PAppBar(
        title: 'Profil',
        backIconVisible: false,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage(
                'assets/icons/ic_launcher.png'), // Replace with actual image path
          ),
          SizedBox(height: 10),
          Obx(() {
            if (userController.customer.value.name != null) {
              return showProfile();
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            );
          }),
          SizedBox(height: 5),
          SizedBox(height: 30),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.verified, color: Colors.green),
                    title: Text('Terverifikasi'),
                    trailing: Icon(Icons.check, color: Colors.green),
                    onTap: () {
                      // Add verification functionality
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(HeroiconsSolid.fingerPrint,
                        color: Colors.grey[700]),
                    title: Text('Ganti PIN'),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      Get.to(() => ChangingPin());
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading:
                        Icon(HeroiconsOutline.key, color: Colors.grey[700]),
                    title: Text('Ganti Password'),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      // Add change password functionality
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(HeroiconsOutline.userGroup,
                        color: Colors.grey[700]),
                    title: Text('Ajak kawan'),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      // Add refer friends functionality
                    },
                  ),
                  Divider(),
                  ListTile(
                    title: PText.body1Regular("Ver. $appVersion"),
                    leading: Icon(HeroiconsOutline.trophy),
                    trailing: Icon(Icons.copy, size: 16),
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: appVersion));
                    },
                  ),
                  Divider(),
                  ListTile(
                    title: PText.heading5Semibold('Keluar aplikasi?'),
                    leading: Icon(HeroiconsOutline.lockClosed),
                    onTap: () async {
                      await _showLogoutDialog(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget showProfile() {
    return Column(
      children: [
        if (userController.customer.value.name != null) ...[
          PText.heading5Semibold(
            userController.customer.value.name ?? "-",
          ),
          PText.body1Bold(
            userController.customer.value.type ?? "-",
          ),
          PText(
            rupiah(
              userController.customer.value.balance ?? 0,
            ),
            style: body1Semibold.copyWith(color: bluePothan),
          ),
        ],
      ],
    );
  }

  Future<void> getLocalVersion() async {
    try {
      final PackageInfo packageInfo = await PackageInfo.fromPlatform();
      setState(() {
        appVersion = "${packageInfo.version}(${packageInfo.buildNumber})";
      });
    } on PlatformException catch (_) {}
  }

  Future<void> _showLogoutDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return dialogContent();
      },
    );
  }

  Widget dialogContent() {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 24.0, left: 20.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        HeroiconsOutline.shieldExclamation,
                        color: brightRed,
                        size: 24,
                      ),
                      const Gap(5),
                      Expanded(
                          child: PText.heading5Light(
                        'Apakah anda akan keluar dari Aplikasi ini ?',
                        color: brightRed,
                      )),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(right: 20.0, bottom: 10, top: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        child: PText.heading6Regular(
                          'Batal',
                        ),
                        onPressed: () async {
                          Get.back();
                        },
                      ),
                      TextButton(
                        child: PText.heading6Regular(
                          'Iya',
                          color: brightRed,
                        ),
                        onPressed: () async {
                          await userController.logout();
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
