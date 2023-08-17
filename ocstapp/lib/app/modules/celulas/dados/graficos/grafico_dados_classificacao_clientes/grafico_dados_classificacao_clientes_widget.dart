import 'package:OCSTApp/app/utils/size_utils.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'indicator.dart';

class GraficoDadosClassificacaoClientesWidget extends StatefulWidget {
  @override
  _GraficoDadosClassificacaoClientesWidgetState createState() =>
      _GraficoDadosClassificacaoClientesWidgetState();
}

class _GraficoDadosClassificacaoClientesWidgetState
    extends State<GraficoDadosClassificacaoClientesWidget> {
  int touchedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeUtils.widthScreen * .93,
      child: AspectRatio(
        aspectRatio: 1,
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
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Classificação',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                  fontSize: 18,
                  letterSpacing: 3,
                ),
                textAlign: TextAlign.center,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 210,
                      child: PieChart(
                        PieChartData(
                          pieTouchData:
                              PieTouchData(touchCallback: (pieTouchResponse) {
                            setState(() {
                              if (pieTouchResponse.touchInput
                                      is FlLongPressEnd ||
                                  pieTouchResponse.touchInput is FlPanEnd) {
                                touchedIndex = -1;
                              } else {
                                touchedIndex =
                                    pieTouchResponse.touchedSectionIndex;
                              }
                            });
                          }),
                          borderData: FlBorderData(
                            show: false,
                          ),
                          sectionsSpace: 1,
                          centerSpaceRadius: 40,
                          sections: showingSections(),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Indicator(
                        color: Colors.blue,
                        text: 'Novo',
                        isSquare: true,
                      ),
                      SizedBox(height: 4),
                      Indicator(
                        color: Colors.green,
                        text: 'Especial',
                        isSquare: true,
                      ),
                      SizedBox(height: 4),
                      Indicator(
                        color: Colors.red,
                        text: 'Desvio',
                        isSquare: true,
                      ),
                      SizedBox(height: 4),
                      Indicator(
                        color: Colors.grey,
                        text: 'Comum',
                        isSquare: true,
                      ),
                      SizedBox(
                        height: 18,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 28,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final double fontSize = isTouched ? 25 : 16;
      final double radius = isTouched ? 50 : 40;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.grey,
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.red,
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.green,
            value: 17,
            title: '17%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 3:
          return PieChartSectionData(
            color: Colors.blue,
            value: 13,
            title: '13%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        default:
          return null;
      }
    });
  }
}
