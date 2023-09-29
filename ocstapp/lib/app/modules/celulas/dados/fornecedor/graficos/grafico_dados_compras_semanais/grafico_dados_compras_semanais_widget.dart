import 'package:OCSTApp/app/utils/size_utils.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GraficoDadosComprasSemanaisWidget extends StatefulWidget {
  @override
  _GraficoDadosComprasSemanaisWidgetState createState() =>
      _GraficoDadosComprasSemanaisWidgetState();
}

class _GraficoDadosComprasSemanaisWidgetState
    extends State<GraficoDadosComprasSemanaisWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeUtils.widthScreen * .93,
      child: AspectRatio(
        aspectRatio: 1.2,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black12),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.withOpacity(0.6),
                  offset: Offset(9, 9),
                  blurRadius: 8.0),
            ],
          ),
          child: Stack(children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Compras Semanais',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 18,
                    letterSpacing: 3,
                  ),
                  textAlign: TextAlign.center,
                ),
                Expanded(
                  child: BarChart(
                    BarChartData(
                      alignment: BarChartAlignment.spaceAround,
                      maxY: 18,
                      barTouchData: BarTouchData(
                        enabled: false,
                        touchTooltipData: BarTouchTooltipData(
                          tooltipBgColor: Colors.transparent,
                          tooltipPadding: const EdgeInsets.all(0),
                          tooltipBottomMargin: 8,
                          getTooltipItem: (
                            BarChartGroupData group,
                            int groupIndex,
                            BarChartRodData rod,
                            int rodIndex,
                          ) {
                            return BarTooltipItem(
                              rod.y.round().toString(),
                              TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          },
                        ),
                      ),
                      titlesData: FlTitlesData(
                        show: true,
                        bottomTitles: SideTitles(
                          showTitles: true,
                          textStyle: TextStyle(
                              color: Colors.black,
                              // color: const Color(0xff7589a2),
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                          margin: 20,
                          getTitles: (double value) {
                            switch (value.toInt()) {
                              case 0:
                                return 'Seg';
                              case 1:
                                return 'Ter';
                              case 2:
                                return 'Qua';
                              case 3:
                                return 'Qui';
                              case 4:
                                return 'Sex';
                              case 5:
                                return 'Sab';
                              case 6:
                                return 'Dom';
                              default:
                                return '';
                            }
                          },
                        ),
                        leftTitles: SideTitles(showTitles: false),
                      ),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      barGroups: [
                        BarChartGroupData(x: 0, barRods: [
                          BarChartRodData(y: 8, color: Colors.green)
                        ], showingTooltipIndicators: [
                          0
                        ]),
                        BarChartGroupData(x: 1, barRods: [
                          BarChartRodData(y: 10, color: Colors.green)
                        ], showingTooltipIndicators: [
                          0
                        ]),
                        BarChartGroupData(x: 2, barRods: [
                          BarChartRodData(y: 14, color: Colors.green)
                        ], showingTooltipIndicators: [
                          0
                        ]),
                        BarChartGroupData(x: 3, barRods: [
                          BarChartRodData(y: 15, color: Colors.green)
                        ], showingTooltipIndicators: [
                          0
                        ]),
                        BarChartGroupData(x: 4, barRods: [
                          BarChartRodData(y: 13, color: Colors.green)
                        ], showingTooltipIndicators: [
                          0
                        ]),
                        BarChartGroupData(x: 5, barRods: [
                          BarChartRodData(y: 12, color: Colors.green)
                        ], showingTooltipIndicators: [
                          0
                        ]),
                        BarChartGroupData(x: 6, barRods: [
                          BarChartRodData(y: 2, color: Colors.green)
                        ], showingTooltipIndicators: [
                          0
                        ]),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
