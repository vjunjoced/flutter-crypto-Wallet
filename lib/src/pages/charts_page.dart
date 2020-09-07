import 'package:crypto_wallet/src/providers/wallets_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

import '../constants.dart';

class ChartPage extends StatelessWidget {
  ChartPage({Key key}) : super(key: key);

  final List<CryptoChart> listChart = walletsProvider.charts;

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
        child: Column(children: [
          SizedBox(height: 40.0),
          _header(),
          SizedBox(height: 20.0),
          _listCharts()
        ]),
      ),
    );
  }

  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Charts',
          style: TextStyle(
              fontSize: 24.0, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Icon(Icons.add, color: Colors.white, size: 35.0),
      ],
    );
  }

  Widget _listCharts() {
    return Column(
      children: listChart.map((e) => _itemChart(e)).toList(),
    );
  }

  Widget _itemChart(CryptoChart chart) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Container(
            height: 204,
            width: double.infinity,
            decoration: BoxDecoration(color: AppColors.chartBgColor),
          ),
        ),
        Column(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
              ),
              padding: EdgeInsets.only(top: 20.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.black12,
                              radius: 25,
                              child: Image(
                                image: NetworkImage(chart.ic),
                                height: 50,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              chart.code,
                              style: TextStyle(
                                fontSize: 12.0,
                                color: AppColors.titleBlackColor,
                              ),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '\$${chart.price}',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: AppColors.titleBlackColor,
                              ),
                            ),
                            Text(
                              '(${chart.diffPer}%) \$${chart.diff}',
                              style: TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w400,
                                color: AppColors.titleMainColor,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Container(
                    height: 80,
                    child: new Sparkline(
                      data: chart.dataChart,
                      fillMode: FillMode.below,
                      fillColor: AppColors.chartBgColor,
                      lineWidth: 2.0,
                      lineColor: AppColors.chartLineColor,
                      useCubicSmoothing: true,
                      cubicSmoothingFactor: 0.1,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 20.0,
            ),
          ],
        )
      ],
    );
  }
}
