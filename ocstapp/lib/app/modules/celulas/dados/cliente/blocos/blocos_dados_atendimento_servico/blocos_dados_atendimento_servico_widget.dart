import 'package:flutter/material.dart';

class BlocosDadosClienteAtendimentoServicosWidget extends StatefulWidget {
  final double left;
  final double right;
  final double top;
  final double bottom;

  const BlocosDadosClienteAtendimentoServicosWidget(
      {Key key, this.left, this.right, this.top, this.bottom})
      : super(key: key);
  @override
  _BlocosDadosClienteAtendimentoServicosWidgetState createState() =>
      _BlocosDadosClienteAtendimentoServicosWidgetState();
}

class _BlocosDadosClienteAtendimentoServicosWidgetState
    extends State<BlocosDadosClienteAtendimentoServicosWidget> {
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
                color: Colors.green[200],
              ),
              width: 90,
              padding: EdgeInsets.all(5),
              child: Column(
                children: <Widget>[
                  Text('12',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  Text(
                    'com agenda nos próximos 5 dias',
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
                color: Colors.orange[300],
              ),
              width: 90,
              padding: EdgeInsets.all(5),
              child: Column(
                children: <Widget>[
                  Text('15',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  Text(
                    'fizeram serviços nos últimos 5 dias',
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
                color: Colors.yellow[300],
              ),
              width: 90,
              padding: EdgeInsets.all(5),
              child: Column(
                children: <Widget>[
                  Text('7',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  Text(
                    'com retorno nos próximos 5 dias',
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
                color: Colors.red[200],
              ),
              width: 90,
              padding: EdgeInsets.all(5),
              child: Column(
                children: <Widget>[
                  Text('3',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  Text(
                    'compraram kits nos últimos 5 dias',
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
                  Text('8',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  Text(
                    'não aparecem a mais de 90 dias',
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
        ],
      ),
    );
  }
}
