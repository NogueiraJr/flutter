import 'package:flutter/material.dart';

class BlocosDadosTagLocacaoRoupasWidget extends StatefulWidget {
  final double left;
  final double right;
  final double top;
  final double bottom;

  const BlocosDadosTagLocacaoRoupasWidget(
      {Key key, this.left, this.right, this.top, this.bottom})
      : super(key: key);

  @override
  _BlocosDadosTagLocacaoRoupasWidgetState createState() =>
      _BlocosDadosTagLocacaoRoupasWidgetState();
}

class _BlocosDadosTagLocacaoRoupasWidgetState
    extends State<BlocosDadosTagLocacaoRoupasWidget> {
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
                  Text('49',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  Text(
                    'com pedidos de retorno',
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
                  Text('33',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  Text(
                    'com pagamentos em dia',
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
                  Text('89',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  Text(
                    'com pedidos recebidos hoje',
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
                  Text('19',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  Text(
                    'com entregas na próxima semana',
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
                  Text('2',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  Text(
                    'com compras canceladas',
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
                  Text('5',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  Text(
                    'com entregas atrasadas',
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
