import 'package:flutter/material.dart';

class BlocosDadosProdutoLanchoneteWidget extends StatefulWidget {
  final double left;
  final double right;
  final double top;
  final double bottom;

  const BlocosDadosProdutoLanchoneteWidget(
      {Key key, this.left, this.right, this.top, this.bottom})
      : super(key: key);

  @override
  _BlocosDadosProdutoLanchoneteWidgetState createState() =>
      _BlocosDadosProdutoLanchoneteWidgetState();
}

class _BlocosDadosProdutoLanchoneteWidgetState
    extends State<BlocosDadosProdutoLanchoneteWidget> {
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
                  Text('4',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  Text(
                    'a vencer nos próximos 5 dias',
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
                  Text('5',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  Text(
                    'comprados nos últimos 5 dias',
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
                    'em falta no estoque',
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
                    'abaixo do limite em 3 dias',
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
                    'não comprados mais',
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
