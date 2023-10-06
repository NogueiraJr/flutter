import 'package:OCSTApp/app/modules/celulas/dados/fornecedor/graficos/grafico_dados_compras_semanais/grafico_dados_compras_semanais_widget.dart';
import 'package:OCSTApp/app/modules/celulas/dados/fornecedor/graficos/grafico_dados_media_preco_por_qtde/grafico_dados_media_preco_por_qtde_widget.dart';
import 'package:flutter/material.dart';

class FornecedorGraficos extends StatelessWidget {
  final String sistemaRef;
  const FornecedorGraficos({
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
          GraficoDadosComprasSemanaisWidget(),
          const SizedBox(width: 30),
          GraficoDadosMediaPrecoPorQtdeWidget(),
        ];
        break;
      case 'refLanchonete':
        return <Widget>[
          GraficoDadosComprasSemanaisWidget(),
          const SizedBox(width: 30),
          GraficoDadosMediaPrecoPorQtdeWidget(),
        ];
      case 'refOficinaCarros':
        return <Widget>[
          GraficoDadosComprasSemanaisWidget(),
          const SizedBox(width: 30),
          GraficoDadosMediaPrecoPorQtdeWidget(),
        ];
      default:
        return [];
    }
  }
}
