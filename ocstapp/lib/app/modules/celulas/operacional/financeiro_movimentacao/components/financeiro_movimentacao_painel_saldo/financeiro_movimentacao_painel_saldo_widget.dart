import 'dart:io';

import 'package:OCSTApp/app/modules/celulas/operacional/financeiro_movimentacao/financeiro_movimentacao_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:OCSTApp/app/core/store_state.dart';
import 'package:OCSTApp/app/modules/celulas/operacional/financeiro_movimentacao/components/financeiro_movimentacao_painel_saldo/financeiro_movimentacao_painel_saldo_controller.dart';
import 'package:OCSTApp/app/utils/size_utils.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class FinanceiroMovimentacaoPainelSaldoWidget extends StatefulWidget {
  final double appBarHeight;

  const FinanceiroMovimentacaoPainelSaldoWidget({Key key, this.appBarHeight})
      : super(key: key);

  @override
  _FinanceiroMovimentacaoPainelSaldoWidgetState createState() =>
      _FinanceiroMovimentacaoPainelSaldoWidgetState();
}

class _FinanceiroMovimentacaoPainelSaldoWidgetState extends ModularState<
    FinanceiroMovimentacaoPainelSaldoWidget,
    FinanceiroMovimentacaoPainelSaldoController> /*State<FinanceiroMovimentacaoPainelSaldoWidget>*/ {
  List<ReactionDisposer> disposers;

  @override
  void initState() {
    super.initState();
    disposers ??= [
      reaction((_) => controller.data, (_) => controller.buscarTotalDoMes())
    ];
    controller.buscarTotalDoMes();
  }

  @override
  Widget build(BuildContext context) {
    return SlidingSheet(
      elevation: 8,
      cornerRadius: 30,
      // backdropColor: Colors.black12,
      // closeOnBackButtonPressed: true,
      // closeOnBackdropTap: true,
      snapSpec: SnapSpec(
        snap: true,
        snappings: [0.14, 0.4],
        positioning: SnapPositioning.relativeToAvailableSpace,
      ),
      headerBuilder: (_, state) {
        return Container(
          width: 60,
          height: 5,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(20),
          ),
        );
      },
      builder: (_, state) {
        return Observer(builder: (_) {
          switch (controller.totalsTate) {
            case StoreState.initial:
            case StoreState.loading:
              return Container(
                height: SizeUtils.heightScreen,
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.only(top: 30),
                  child: CircularProgressIndicator(),
                ),
              );
            case StoreState.loaded:
              return _makeContent();
            case StoreState.error:
              return Text(controller.errorMessage);
          }
          return Container();
        });
      },
    );
  }

  Widget _makeContent() {
    var model = controller.movimentacaoTotalModel;
    var numberFormat = NumberFormat('###,###,###,###,##0.00', 'pt_BR');
    FinanceiroMovimentacaoController financeiroMovimentacaoController =
        Modular.get<FinanceiroMovimentacaoController>();
    return Container(
      padding: EdgeInsets.only(top: 6, bottom: 14),
      width: SizeUtils.widthScreen,
      height: SizeUtils.heightScreen * .4 - widget.appBarHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                onPressed: () => controller.previousMonth(),
                icon: Icon(Icons.arrow_back_ios),
              ),
              Column(
                children: <Widget>[
                  Text(
                    DateFormat.yMMM('pt_BR').format(controller.data),
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: model.acumulado != null
                            ? model.acumulado < 0 ? Colors.red : Colors.green
                            : Colors.blue),
                  ),
                  Text(
                    'R\$ ${model.acumulado != null ? numberFormat.format(model.acumulado) : '-'}',
                    // 'R\$ 999.999.999,00',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: model.acumulado != null
                            ? model.acumulado < 0 ? Colors.red : Colors.green
                            : Colors.blue),
                  ),
                  Text(
                    '(acumulado)',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () => controller.nextMonth(),
                icon: Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
          SizedBox(
            height: Platform.isIOS ? 60 : 24,
          ),
          Column(
            children: <Widget>[
              Text(
                'R\$ ${model.saldo != null ? numberFormat.format(model.saldo) : '-'}',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w300,
                    color: model.saldo != null
                        ? model.saldo < 0 ? Colors.red : Colors.green
                        : Colors.blue),
              ),
              Text(
                '(neste mês)',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(),
          ),
          Container(
            margin: EdgeInsets.only(bottom: Platform.isIOS ? 30 : 10),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          financeiroMovimentacaoController.filter.length == 0 ||
                                  financeiroMovimentacaoController.filter !=
                                      'TipoCategoria.receita'
                              ? financeiroMovimentacaoController.filter =
                                  'TipoCategoria.receita'
                              : financeiroMovimentacaoController.filter = '';
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          child: Icon(Icons.arrow_upward),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Receitas',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.green,
                          ),
                        ),
                        Text(
                          // '9.999.999,99',
                          'R\$ ${numberFormat.format(model.receitas.total)}',
                          style: TextStyle(fontSize: 13, color: Colors.green),
                        ),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 70.0),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: GestureDetector(
                          onTap: () {
                            financeiroMovimentacaoController.filter.length ==
                                        0 ||
                                    financeiroMovimentacaoController.filter !=
                                        'TipoCategoria.despesa'
                                ? financeiroMovimentacaoController.filter =
                                    'TipoCategoria.despesa'
                                : financeiroMovimentacaoController.filter = '';
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            child: Icon(Icons.arrow_downward),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Despesas',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.red,
                            ),
                          ),
                          Text(
                            // '9.999.999,99',
                            'R\$ ${numberFormat.format(model.despesas.total)}',
                            style: TextStyle(fontSize: 13, color: Colors.red),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
