import 'package:flutter/material.dart';

class BlocosDadosTagAtendimentoServicosWidget extends StatefulWidget {
  final double left;
  final double right;
  final double top;
  final double bottom;

  const BlocosDadosTagAtendimentoServicosWidget(
      {Key key, this.left, this.right, this.top, this.bottom})
      : super(key: key);

  @override
  _BlocosDadosTagAtendimentoServicosWidgetState createState() =>
      _BlocosDadosTagAtendimentoServicosWidgetState();
}

class _BlocosDadosTagAtendimentoServicosWidgetState
    extends State<BlocosDadosTagAtendimentoServicosWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: widget.left,
          right: widget.right,
          top: widget.top,
          bottom: widget.bottom),
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 5),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                color: Colors.red[200],
              ),
              width: 90,
              padding: EdgeInsets.all(5),
              child: Column(
                children: <Widget>[
                  Text('145',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  Text(
                    'com peças para verficar',
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 5),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                color: Colors.green[700],
              ),
              width: 90,
              padding: EdgeInsets.all(5),
              child: Column(
                children: <Widget>[
                  Text('15',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  Text(
                    'com peças para devolver',
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 5),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                color: Colors.orange[300],
              ),
              width: 90,
              padding: EdgeInsets.all(5),
              child: Column(
                children: <Widget>[
                  Text('9',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  Text(
                    'com serviços terceirizados hoje',
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 5),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                color: Colors.green[200],
              ),
              width: 90,
              padding: EdgeInsets.all(5),
              child: Column(
                children: <Widget>[
                  Text('21',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  Text(
                    'com propostas em análise',
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 5),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                color: Colors.red[700],
              ),
              width: 90,
              padding: EdgeInsets.all(5),
              child: Column(
                children: <Widget>[
                  Text('34',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  Text(
                    'com contratos cancelados',
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 5),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                color: Colors.yellow[300],
              ),
              width: 90,
              padding: EdgeInsets.all(5),
              child: Column(
                children: <Widget>[
                  Text('41',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  Text(
                    'com kits defeituosos',
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
