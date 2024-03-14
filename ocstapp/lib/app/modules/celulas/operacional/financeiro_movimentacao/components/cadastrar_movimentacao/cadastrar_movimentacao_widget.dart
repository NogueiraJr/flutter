import 'package:combos/combos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:OCSTApp/app/components/app_text_form_field.dart';
import 'package:OCSTApp/app/utils/size_utils.dart';

import 'cadastrar_movimentacao_controller.dart';

class CadastrarMovimentacaoWidget extends StatelessWidget {
  final controller = Modular.get<CadastrarMovimentacaoController>();

  @override
  Widget build(BuildContext context) {
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
                  width: SizeUtils.widthScreen,
                  color: Colors.grey[300],
                  child: Align(
                    alignment: Alignment.center,
                    child: FlatButton(
                      onPressed: () async {
                        var _data = DateTime.now();

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
                            child: Text(controller.dataInclusao == null
                                ? 'Selecionar Data'
                                : DateFormat('dd/MM/yyyy HH:mm')
                                    .format(controller.dataInclusao)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.today),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: !controller.categoriaValid
                      ? BoxDecoration(border: Border.all(color: Colors.red))
                      : null,
                  child: ListCombo(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(controller.categoria?.nome ?? 'Categoria'),
                    ),
                    getList: () => controller.categorias,
                    itemBuilder: (context, parameters, item) =>
                        ListTile(title: Text(item.nome)),
                    onItemTapped: (item) {
                      controller.changeCategoria(item);
                    },
                  ),
                ),
                // Visibility(
                //   visible: !controller.categoriaValid,
                //   child: Container(
                //     width: SizeUtils.widthScreen,
                //     padding: const EdgeInsets.only(top: 8.0, left: 14),
                //     child: Text(
                //       'Selecione uma categoria',
                //       style: TextStyle(
                //           color: Theme.of(context).errorColor, fontSize: 12),
                //       textAlign: TextAlign.start,
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 20,
                ),
                AppTextFormField(
                  label: 'Descrição',
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
                  height: 20,
                ),
                AppTextFormField(
                  controller: controller.moneyController,
                  label: 'Valor',
                  borderRadius: 5,
                  fontSize: 15,
                  padding: EdgeInsets.only(left: 15, top: 15, bottom: 15),
                  validator: (valor) {
                    if (valor.isEmpty) {
                      return 'Valor Obrigatório';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
