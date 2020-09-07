import 'package:crypto_wallet/src/pages/wallets_page.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'charts_page.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final listPages = [WalletPage(), ChartPage()];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: listPages,
      ),
      extendBody: true,
      bottomNavigationBar: _bottomNavBar(context),
    );
  }

  Widget _bottomNavBar(BuildContext context) {
    final _borderRadius = BorderRadius.only(
      topRight: Radius.circular(16.0),
      topLeft: Radius.circular(16.0),
    );

    return Container(
      height: 70.0,
      decoration: BoxDecoration(
        borderRadius: _borderRadius,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8.0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: _borderRadius,
        child: BottomNavigationBar(
          elevation: 0,
          unselectedItemColor: AppColors.menuInactiveColor,
          backgroundColor: Colors.white,
          selectedItemColor: AppColors.mainColor,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            _itemMenu(Icons.account_balance_wallet, 'Wallets'),
            _itemMenu(Icons.insert_chart, 'Charts'),
            _itemMenu(Icons.compare_arrows, 'Trading'),
            _itemMenu(Icons.notifications, 'Alerts'),
            _itemMenu(Icons.settings, 'Settings')
          ],
          onTap: (int index) => setState(() => _selectedIndex = index),
          currentIndex: _selectedIndex,
        ),
      ),
    );
  }

  BottomNavigationBarItem _itemMenu(IconData icon, String text) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      title: Text(text),
    );
  }
}
