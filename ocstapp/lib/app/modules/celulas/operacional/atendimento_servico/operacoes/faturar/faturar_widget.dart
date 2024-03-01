import 'package:OCSTApp/app/models/atendimento_servico_model.dart';
import 'package:OCSTApp/app/modules/celulas/operacional/atendimento_servico/atendimento_servico_controller.dart';
import 'package:combos/combos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:OCSTApp/app/components/app_text_form_field.dart';
import 'package:OCSTApp/app/utils/size_utils.dart';

import 'faturar_controller.dart';

class FaturarAtendimentoWidget extends StatelessWidget {
  final AtendimentoServicoModel item;

  const FaturarAtendimentoWidget({
    Key key,
    this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<FaturarAtendimentoController>();
    // final atendimentoServicoController =
    //     Modular.get<AtendimentoServicoController>();
    // atendimentoServicoController.consultarProdutosDoServico(item.id);
    // item.valor = atendimentoServicoController.produtosDoServicoValorTotal;
    controller.descricao = '${item.descricao}';
    controller.descricao +=
        item.observacao.isNotEmpty ? ', ${item.observacao}' : '';
    controller.tags = item.tags;
    controller.qtdeParcelas = '1';
    controller.idCategoria = 2; //Id de 'Atendimento'
    var nF = NumberFormat('###,###,###,###,###.00', 'pt_BR');
    controller.moneyController.text =
        item.valor != null ? nF.format(item.valor) : '';
    return Observer(builder: (_) {
      return Form(
        key: controller.formKey,
        child: Container(
          width: SizeUtils.widthScreen * .80,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.green,
                  ),
                  height: 45,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0)),
                      color: Colors.green[50],
                    ),
                    child: Center(
                      child: Text(
                        'Criarei lançamentos financeiros relacionados a este atendimento',
                        // textScaleFactor: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ),

                // Container(
                //   padding: EdgeInsets.all(4),
                //   color: Colors.green[100],
                //   child: Text(
                //     'Iremos criar lançamentos financeiros relacionados a este atendimento.',
                //     textAlign: TextAlign.center,
                //     style: TextStyle(
                //       color: Colors.black,
                //       fontSize: 14,
                //       fontWeight: FontWeight.w300,
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 20,
                ),
                AppTextFormField(
                  controller: controller.moneyController,
                  label: 'Valor total a ser cobrado',
                  borderRadius: 5,
                  fontSize: 15,
                  padding: EdgeInsets.only(left: 15, top: 15, bottom: 15),
                  validator: (valor) {
                    if (valor.isEmpty || valor == '0,00') {
                      return 'Valor Obrigatório';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 15,
                ),
                AppTextFormField(
                  label: 'Quantidade de Parcelas',
                  initialValue: '1',
                  borderRadius: 5,
                  fontSize: 15,
                  keyboardType: TextInputType.number,
                  // apenasValores: true,
                  padding: EdgeInsets.only(left: 15, top: 15, bottom: 15),
                  onChanged: controller.changeQtdeParcelas,
                  validator: (qtdeParcelas) {
                    if (qtdeParcelas.toString().isEmpty ||
                        qtdeParcelas == '0') {
                      return 'Parcelamento Obrigatório';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Primeiro vencimento',
                  // textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                FlatButton(
                  color: Colors.black12,
                  onPressed: () async {
                    var _data = controller.dataInicial;
                    var date = await showDatePicker(
                      context: context,
                      initialDate: _data,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                    if (date != null) {
                      var time = await showTimePicker(
                          context: context,
                          initialTime: _data != null
                              ? TimeOfDay(
                                  hour: _data.hour, minute: _data.minute)
                              : TimeOfDay(hour: 12, minute: 00));
                      if (date != null && time != null) {
                        controller.setDataInclusao(date, time);
                      }
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(controller.dataInicial == null
                            ? 'Selecionar Data'
                            : DateFormat('dd/MM/yyyy HH:mm')
                                .format(controller.dataInicial)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.today),
                      ),
                    ],
                  ),
                ),
                Text(
                  '(parcelas desmembradas mensalmente)',
                  // textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 11,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                AppTextFormField(
                  label: 'Descrição do Faturamento',
                  initialValue:
                      controller.descricao != null ? controller.descricao : '',
                  borderRadius: 5,
                  fontSize: 15,
                  padding: EdgeInsets.only(left: 15, top: 15, bottom: 15),
                  onChanged: controller.changeDescricao,
                  validator: (desc) {
                    if (desc.isEmpty) {
                      return 'Descrição Obrigatória';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
