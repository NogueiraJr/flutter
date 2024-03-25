import 'package:OCSTApp/app/modules/celulas/operacional/financeiro_movimentacao/components/cadastrar_movimentacao/cadastrar_movimentacao_widget.dart';
import 'package:OCSTApp/app/modules/celulas/operacional/financeiro_movimentacao/components/editar_movimentacao/editar_movimentacao_controller.dart';
import 'package:OCSTApp/app/modules/celulas/operacional/financeiro_movimentacao/components/editar_movimentacao/editar_movimentacao_widget.dart';
import 'package:OCSTApp/app/modules/celulas/operacional/financeiro_movimentacao/components/financeiro_movimentacao_painel_saldo/financeiro_movimentacao_painel_saldo_controller.dart';
import 'package:OCSTApp/app/modules/celulas/operacional/financeiro_movimentacao/financeiro_movimentacao_controller.dart';
import 'package:OCSTApp/app/repositories/movimentacoes_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:OCSTApp/app/models/movimentacao_model.dart';
import 'package:OCSTApp/app/utils/snackbar_utils.dart';

class FinanceiroMovimentacaoItem extends StatelessWidget {
  final MovimentacaoModel item;
  final EditarMovimentacaoController controller;
  final FinanceiroMovimentacaoController financeiroMovimentacaoController;

  const FinanceiroMovimentacaoItem(
      {Key key,
      this.item,
      this.controller,
      this.financeiroMovimentacaoController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var numberFormat = NumberFormat('###,###,###,###,##0.00', 'pt_BR');
    var dateFormat = DateFormat('dd/MM/yyyy HH:mm');

    return Column(
      children: <Widget>[
        // Padding(
        //   padding: const EdgeInsets.only(top: 5.0),
        //   child: Text(
        //     dateFormat.format(item.dataMovimentacao),
        //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
        //   ),
        // ),
        Slidable(
          actionPane: SlidableBehindActionPane(),
          actionExtentRatio: 0.25,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                color: Colors.white,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor:
                        item.categoria.tipo == 'TipoCategoria.despesa'
                            ? Colors.red
                            : Colors.green,
                    child: item.categoria.tipo == 'TipoCategoria.despesa'
                        ? const Icon(Icons.remove, color: Colors.white)
                        : const Icon(Icons.add, color: Colors.white),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Expanded(
                            flex: 8,
                            child: Text(
                              item.categoria.nome,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w300),
                            ),
                          ),
                          Text(
                            // 'R\$ 999.999.999,99',
                            'R\$ ${numberFormat.format(item.valor)}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                              color:
                                  item.categoria.tipo == 'TipoCategoria.despesa'
                                      ? Colors.red
                                      : Colors.green,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 8,
                            child: Text(
                              dateFormat.format(item.dataMovimentacao),
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w300),
                            ),
                          ),
                          Text(
                            item.parcela,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Visibility(
                        visible: item.dataEfetivacao != null,
                        child: Row(
                          children: <Widget>[
                            Text(
                              item.dataEfetivacao != null
                                  ? dateFormat.format(item.dataEfetivacao)
                                  : '',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                                // color: Colors.green,
                              ),
                            ),
                            SizedBox(
                              width: 1,
                            ),
                            Icon(
                              Icons.check_circle,
                              color:
                                  item.categoria.tipo == 'TipoCategoria.despesa'
                                      ? Colors.red[300]
                                      : Colors.green,
                              size: 14,
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              'efetivado',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  color: item.categoria.tipo ==
                                          'TipoCategoria.despesa'
                                      ? Colors.red
                                      : Colors.green),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  subtitle: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              item.descricao,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w300),
                            ),
                            Visibility(
                              visible:
                                  item.tags != item.atendimentoServico.tags,
                              child: _makeTags(item.tags),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // trailing: Container(
                  //   padding: EdgeInsets.only(top: 2),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.end,
                  //     children: <Widget>[
                  //       Text(
                  //         'R\$ ${numberFormat.format(item.valor)}',
                  //         style: TextStyle(
                  //           fontSize: 18,
                  //           fontWeight: FontWeight.w300,
                  //           color:
                  //               item.categoria.tipo == 'TipoCategoria.despesa'
                  //                   ? Colors.red
                  //                   : Colors.green,
                  //         ),
                  //       ),
                  //       Text(
                  //         dateFormat.format(item.dataMovimentacao),
                  //         style: TextStyle(
                  //             fontSize: 12, fontWeight: FontWeight.w400),
                  //       ),
                  //       Visibility(
                  //         visible: item.dataEfetivacao != null,
                  //         child: Text(
                  //           item.dataEfetivacao != null
                  //               ? dateFormat.format(item.dataEfetivacao)
                  //               : '',
                  //           style: TextStyle(
                  //               fontSize: 12, fontWeight: FontWeight.w400),
                  //         ),
                  //       ),
                  //       Visibility(
                  //         visible: item.parcela.length > 0,
                  //         child: Text(
                  //           item.parcela,
                  //           style: TextStyle(
                  //               fontSize: 14, fontWeight: FontWeight.w300),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ),
              ),
              //
              // Se precisar de mais espaço horizontal para as Tags.
              //Padding(
              //  padding: const EdgeInsets.only(left: 16, right: 10),
              //  child: _makeTags(item.tags),
              //),
              //
              //
            ],
          ),
          actions: <Widget>[
            IconSlideAction(
              caption: 'EDITAR',
              color: Colors.green,
              icon: Icons.edit,
              onTap: () =>
                  _showEditModal(), //SnackBarUtils.showSnackBarFuncNotImplement(),
            ),
            Visibility(
              visible: item.dataEfetivacao == null,
              child: IconSlideAction(
                caption: 'EFETIVAR',
                color: Colors.yellow,
                icon: Icons.check,
                onTap: () => receber(context),
              ),
              replacement: IconSlideAction(
                caption: 'DESFAZER',
                color: Colors.yellow,
                icon: Icons.cancel,
                onTap: () => desfazerRecebimento(context),
              ),
            ),
          ],
          secondaryActions: <Widget>[
            // IconSlideAction(
            //   caption: 'MAIS',
            //   color: Colors.black45,
            //   icon: Icons.more_horiz,
            //   onTap: () =>
            //       SnackBarUtils.showSnackBarFuncNotImplement(),
            // ),
            IconSlideAction(
                caption: 'APAGAR',
                color: Colors.red,
                icon: Icons.delete_outline,
                onTap: () => confirmarAcao(
                    context,
                    'APAGAR',
                    'Vou apagar o Lançamento Financeiro ${item.categoria.nome}, ${item.descricao}',
                    item.id,
                    item.parcela)),
          ],
        )
      ],
    );
  }

  Widget _makeTags(String tagsItem) {
    GlobalKey<TagsState> globalKeyTag = GlobalKey<TagsState>();
    // final financeiroMovimentacaoController =
    //     GetIt.I.get<FinanceiroMovimentacaoController>();
    List tags = controller.tagStringParaTagsList(tagsItem);
    return Visibility(
      visible: tags.length > 0,
      child: Container(
        child: Tags(
          key: globalKeyTag,
          itemCount: tags.length,
          alignment: WrapAlignment.start,
          horizontalScroll: true,
          heightHorizontalScroll: 35,
          spacing: 2,
          itemBuilder: (index) {
            final Item currentItem = Item(title: tags[index].title);
            return ItemTags(
              index: index,
              title: currentItem.title,
              border: Border.all(color: Colors.black, width: 0.5),
              // activeColor: Colors.grey.shade200,
              activeColor:
                  tags[index].title == financeiroMovimentacaoController.filter
                      ? Colors.yellow.shade200
                      : Colors.grey.shade200,
              colorShowDuplicate: Colors.red.shade200,
              color: Colors.green.shade100,
              textActiveColor: Colors.black,
              customData: currentItem.customData,
              textStyle: TextStyle(fontSize: 10),
              combine: ItemTagsCombine.withTextBefore,
              onPressed: (i) => print(i),
              onLongPressed: (i) =>
                  financeiroMovimentacaoController.filter.length == 0 ||
                          financeiroMovimentacaoController.filter != i.title
                      ? financeiroMovimentacaoController.filter = i.title
                      : financeiroMovimentacaoController.filter = '',
            );
          },
        ),
      ),
    );
  }

  void confirmarAcao(BuildContext context, String acao, String msg, int id,
      String parcelamento) {
    int parcelas = parcelamento.length > 0
        ? parcelamento.contains('/') ? int.parse(parcelamento.split('/')[1]) : 0
        : 0;
    msg += parcelas > 0 ? ', parcela $parcelamento. Posso?' : '. Posso?';
    Widget naoButton = FlatButton(
      child: Text("NÃO"),
      onPressed: () {
        Get.back();
      },
    );
    Widget parcelasButton = FlatButton(
      child: Text(
        "Apagar todas as $parcelas parcelas",
        style: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.w300,
        ),
      ),
      onPressed: () {
        Get.back();
        confirmarAcao(
            context,
            'APAGARPARCELAS',
            'Serão APAGADAS as $parcelas parcelas referentes a este lançamento',
            null,
            '');
      },
    );
    Widget simButton = FlatButton(
      child: Text("SIM"),
      onPressed: () {
        switch (acao) {
          case 'APAGAR':
            apagar(id);
            break;
          case 'APAGARPARCELAS':
            apagarParcelas(item);
            break;
          case 'EFETIVAR':
            financeiroMovimentacaoController.efetivarLancamentoFinanceiro(item);
            Get.back(result: false);
            break;
          case 'DESEFETIVAR':
            item.dataEfetivacao = null;
            financeiroMovimentacaoController.efetivarLancamentoFinanceiro(item);
            Get.back(result: false);
            break;
          default:
        }
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text("Atenção"),
      content: Text(msg),
      actions: [
        naoButton,
        simButton,
        parcelas > 0 ? parcelasButton : null,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void apagar(int id) async {
    FinanceiroMovimentacaoPainelSaldoController painelSaldoController =
        Modular.get<FinanceiroMovimentacaoPainelSaldoController>();

    await financeiroMovimentacaoController.apagarLancamentoFinanceiro(id);
    await painelSaldoController.buscarTotalDoMes();
    Get.back();
  }

  void apagarParcelas(MovimentacaoModel item) async {
    FinanceiroMovimentacaoPainelSaldoController painelSaldoController =
        Modular.get<FinanceiroMovimentacaoPainelSaldoController>();

    await financeiroMovimentacaoController
        .apagarVariosLancamentosFinanceiros(item);
    await painelSaldoController.buscarTotalDoMes();
    Get.back();
    SnackBarUtils.showSnackBar('Atenção',
        'Parcelas apagadas. Você pode faturar novamente para criar novas parcelas.');
  }

  _showEditModal() async {
    var numberFormat = NumberFormat('###,###,###,###,##0.00', 'pt_BR');
    await controller.buscarCategorias(item.categoria.tipo.split('.')[1]);
    controller.dataInclusao = item.dataMovimentacao;
    controller.categoria = item.categoria;
    controller.descricao = item.descricao;
    controller.moneyController.text = numberFormat.format(item.valor);
    Get.dialog(AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      title: Text('Editar'),
      content: EditarMovimentacaoWidget(item: item, controller: controller),
      actions: <Widget>[
        FlatButton(
          onPressed: () => Get.back(result: false),
          child: const Text("CANCELAR"),
        ),
        FlatButton(
          onPressed: () async => _gravar(),
          child: const Text("GRAVAR"),
        ),
      ],
    ));
  }

  _gravar() async {
    FinanceiroMovimentacaoPainelSaldoController painelSaldoController =
        Modular.get<FinanceiroMovimentacaoPainelSaldoController>();

    await controller.salvarMovimento(item.id);
    await financeiroMovimentacaoController.buscarMovimentacoes();
    await painelSaldoController.buscarTotalDoMes();
    Get.back(result: false);
  }

  receber(BuildContext context) async {
    DateTime _data;
    _data = item.dataEfetivacao != null
        ? item.dataEfetivacao
        : item.dataMovimentacao;

    var date = await showDatePicker(
      context: context,
      initialDate: _data ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (date == null) return;
    var time = await showTimePicker(
        context: context,
        initialTime: _data != null
            ? TimeOfDay(hour: _data.hour, minute: _data.minute)
            : TimeOfDay(hour: 12, minute: 00));
    if (date != null && time != null) {
      item.dataEfetivacao =
          new DateTime(date.year, date.month, date.day, time.hour, time.minute);
      confirmarAcao(
          context,
          'EFETIVAR',
          'Vou efetivar a parcela ${item.parcela.length > 0 ? item.parcela : 'única'} do Lançamento Financeiro ${item.categoria.nome}, ${item.descricao} na data ${DateFormat('dd/MM/yyyy HH:mm').format(item.dataEfetivacao)}',
          null,
          '');
    }
  }

  desfazerRecebimento(BuildContext context) async {
    confirmarAcao(
        context,
        'DESEFETIVAR',
        'Vou cancelar a efetivação da parcela ${item.parcela} do Lançamento Financeiro ${item.categoria.nome}, ${item.descricao}, efetivada em ${DateFormat('dd/MM/yyyy HH:mm').format(item.dataEfetivacao)}',
        null,
        '');
  }
}
