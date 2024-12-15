import 'package:flutter/material.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'package:pulsa/dashboard/presentation/pages/dashboard_screen.dart';

import '../../../core/presentation/atoms/style/colors.dart';
import '../../../transaction/presentation/pages/transactions_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  var _index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getScreen(_index),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
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

  Widget getScreen(int index) {
    if (index == 1) {
      return TransactionsScreen();
    }
    return DashboardScreen();
  }
}
