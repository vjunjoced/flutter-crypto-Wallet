import 'dart:math';

final _random = new Random();

class WalletProvider {
  final List<Wallet> wallets = [
    Wallet(
        code: 'BTC',
        quantity: 4.48595,
        name: 'Bitcoin',
        ic: 'https://cdn.iconscout.com/icon/free/png-512/bitcoin-259-646065.png',
        diffPer: 14,
        diff: 120),
    Wallet(
        code: 'ETH',
        quantity: 4.48595,
        name: 'Ethereum',
        ic: 'https://cdn4.iconfinder.com/data/icons/logos-and-brands/512/116_Ethereum_logo_logos-512.png',
        diffPer: 3.45,
        diff: 10),
    Wallet(
        code: 'ETH',
        quantity: 4.48595,
        name: 'Ethereum',
        ic: 'https://cdn4.iconfinder.com/data/icons/logos-and-brands/512/116_Ethereum_logo_logos-512.png',
        diffPer: 3.45,
        diff: 10),
    Wallet(
        code: 'ETH',
        quantity: 4.48595,
        name: 'Ethereum',
        ic: 'https://cdn4.iconfinder.com/data/icons/logos-and-brands/512/116_Ethereum_logo_logos-512.png',
        diffPer: 3.45,
        diff: 10),
    Wallet(
        code: 'ETH',
        quantity: 4.48595,
        name: 'Ethereum',
        ic: 'https://cdn4.iconfinder.com/data/icons/logos-and-brands/512/116_Ethereum_logo_logos-512.png',
        diffPer: 3.45,
        diff: 10)
  ];

  final List<CryptoChart> charts = [
    CryptoChart(
      ic: 'https://s2.coinmarketcap.com/static/img/coins/64x64/1.png',
      name: 'Bitcoin',
      code: 'BTC',
      price: 11434.10,
      diffPer: 2.14,
    ),
    CryptoChart(
      ic: 'https://s2.coinmarketcap.com/static/img/coins/64x64/1027.png',
      name: 'Ethereum',
      code: 'ETH',
      price: 395.89,
      diffPer: 3.45,
    ),
    CryptoChart(
      ic: 'https://s2.coinmarketcap.com/static/img/coins/64x64/52.png',
      name: 'XRP',
      code: 'XRP',
      price: 0.272974,
      diffPer: 4.20,
    ),
    CryptoChart(
      ic: 'https://s2.coinmarketcap.com/static/img/coins/64x64/2.png',
      name: 'Litecoin',
      code: 'LTC',
      price: 57.25,
      diffPer: 3.34,
    ),
    CryptoChart(
      ic: 'https://s2.coinmarketcap.com/static/img/coins/64x64/1958.png',
      name: 'TRON',
      code: 'TRX',
      price: 0.024075,
      diffPer: 5.38,
    ),
    CryptoChart(
      ic: 'https://s2.coinmarketcap.com/static/img/coins/64x64/328.png',
      name: 'Monero',
      code: 'XMR',
      price: 93.73,
      diffPer: 7.08,
    ),
  ];

  WalletProvider();
}

List<double> _getData(int init, int end) {
  final total = nextInt(6, 20);
  final List<double> dt = [];

  for (var i = 0; i < total; i++) {
    final n = nextInt(init, end).toDouble();
    dt.add(n);
  }

  return dt;
}

int nextInt(int min, int max) => min + _random.nextInt((max + 1) - min);

class Wallet {
  String ic;
  String name;
  String code;
  double quantity;
  double diff;
  double diffPer;

  Wallet(
      {this.ic, this.name, this.code, this.quantity, this.diff, this.diffPer});
}

class CryptoChart {
  String ic;
  String name;
  String code;
  double price;
  double diff;
  double diffPer;
  List<double> dataChart;

  CryptoChart(
      {this.ic,
      this.name,
      this.code,
      this.price,
      this.diffPer,
      this.dataChart}) {
    diff = num.parse((this.price * (this.diffPer / 100)).toStringAsFixed(3));
    dataChart = _getData(20, 80);
  }
}

final WalletProvider walletsProvider = new WalletProvider();
