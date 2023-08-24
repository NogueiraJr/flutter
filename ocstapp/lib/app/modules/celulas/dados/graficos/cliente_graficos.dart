import 'package:OCSTApp/app/modules/celulas/dados/cliente/graficos/grafico_dados_classificacao_clientes/grafico_dados_classificacao_clientes_widget.dart';
import 'package:OCSTApp/app/modules/celulas/dados/cliente/graficos/grafico_dados_fluxo_clientes/grafico_dados_fluxo_clientes_widget.dart';
import 'package:flutter/material.dart';

class ClienteGraficos extends StatelessWidget {
  final String sistemaRef;
  const ClienteGraficos({
    Key key,
    this.sistemaRef,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: EdgeInsets.only(top: 10, left: 15, bottom: 20, right: 10),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: graficos(),
      ),
    );
  }

  List<Widget> graficos() {
    switch (sistemaRef) {
      case 'refLocacaoRoupas':
        return <Widget>[
          GraficoDadosFluxoClientesWidget(),
          const SizedBox(width: 30),
          GraficoDadosClassificacaoClientesWidget(),
        ];
        break;
      case 'refLanchonete':
        return <Widget>[
          GraficoDadosFluxoClientesWidget(),
          const SizedBox(width: 30),
          GraficoDadosClassificacaoClientesWidget(),
        ];
      case 'refOficinaCarros':
        return <Widget>[
          GraficoDadosFluxoClientesWidget(),
          const SizedBox(width: 30),
          GraficoDadosClassificacaoClientesWidget(),
        ];
      default:
        return [];
    }
  }
}
