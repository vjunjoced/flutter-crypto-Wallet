import 'package:crypto_wallet/src/constants.dart';
import 'package:crypto_wallet/src/providers/wallets_provider.dart';
import 'package:flutter/material.dart';

class WalletPage extends StatelessWidget {
  WalletPage({Key key}) : super(key: key);
  final List<Wallet> wallets = walletsProvider.wallets;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _body(context),
      ),
      backgroundColor: AppColors.bodyColor,
    );
  }

  Widget _body(BuildContext context) {
    return SingleChildScrollView(
      controller: ScrollController(),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            SizedBox(
              height: 40.0,
            ),
            _header(),
            SizedBox(
              height: 60.0,
            ),
            _listWallets(context),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Crypto Balance',
            style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w500,
                color: Colors.white)),
        SizedBox(
          height: 25.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '\$713,800.12',
              style: TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                '+\$1204 (8.2%)',
                style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(width: 15.0),
              Text(
                'last week',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w500),
              ),
            ])
          ],
        )
      ],
    );
  }

  Widget _listWallets(BuildContext context) {
    final List<Widget> listWallets = [];

    for (int i = 0; i < wallets.length; i++) {
      final List<Widget> row = [];

      row.add(_itemWallet(context, i, wallets[i]));

      if (i + 1 < wallets.length) {
        i++;
        row.add(_itemWallet(context, i, wallets[i]));
      }

      listWallets.add(
        Padding(
          padding: EdgeInsets.only(bottom: 20.0),
          child: Row(
            children: row,
          ),
        ),
      );
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Wallets',
              style: TextStyle(fontSize: 22.0, color: AppColors.textColorGray),
            ),
            Icon(Icons.more_horiz, color: AppColors.textColorGray, size: 40.0),
          ],
        ),
        SizedBox(
          height: 20.0,
        ),
        Column(children: listWallets)
      ],
    );
  }

  Widget _itemWallet(BuildContext context, int index, Wallet wallet) {
    final width = (MediaQuery.of(context).size.width / 2) - 39;
    final margin = ((index + 1) % 2 == 0)
        ? EdgeInsets.only(left: 9.0)
        : EdgeInsets.only(right: 9.0);
    final textStyl = TextStyle(
      color: AppColors.titleMainColor,
      fontWeight: FontWeight.bold,
      fontSize: 14.0,
    );

    final operator = (wallet.diff < 0) ? '-' : '+';

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: AppColors.mainColor,
      ),
      width: width,
      margin: margin,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 28,
              child: Image(
                image: NetworkImage(wallet.ic),
                height: 30,
              ),
            ),
            SizedBox(height: 30),
            Text(wallet.name, style: textStyl),
            SizedBox(height: 8),
            Row(
              children: [
                Text(
                  '${wallet.quantity}',
                  style: TextStyle(
                    fontSize: 19.0,
                    fontWeight: FontWeight.bold,
                    color: AppColors.titleBlackColor,
                  ),
                ),
                SizedBox(width: 8.0),
                Text(
                  wallet.code,
                  style: TextStyle(
                    fontSize: 19.0,
                    fontWeight: FontWeight.w300,
                    color: AppColors.titleBlackColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              '$operator${wallet.diff}\$   ($operator${wallet.diffPer}%)',
              style: textStyl,
            ),
          ],
        ),
      ),
    );
  }
}
