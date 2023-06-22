import 'package:OCSTApp/app/models/cliente_manequim_model.dart';
import 'package:OCSTApp/app/models/produto_model.dart';
import 'package:OCSTApp/app/modules/celulas/dados/cliente/cliente_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ClienteManequimItem extends StatelessWidget {
  final ClienteManequimModel item;
  final ClienteController clienteController;

  const ClienteManequimItem({
    Key key,
    this.item,
    this.clienteController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nF = new NumberFormat("##0.00", "pt_BR");
    return Column(
      children: <Widget>[
        Slidable(
          actionPane: SlidableBehindActionPane(),
          actionExtentRatio: 0.25,
          child: Container(
            // color: Colors.white,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                maxRadius: 30,
                child: Image(
                  image: AssetImage('assets/images/dds-cliente-manequim.png'),
                  height: 320,
                ),
              ),
              title: Text(
                item.data,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
              // subtitle: Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: <Widget>[
              //     Table(
              //       children: [
              //         TableRow(children: <Widget>[
              //           Text(
              //             'Busto\n${nF.format(item.busto)}',
              //             style: TextStyle(
              //                 fontSize: 16, fontWeight: FontWeight.w400),
              //           ),
              //           Text(
              //             'Cintura\n${nF.format(item.cintura)}',
              //             style: TextStyle(
              //                 fontSize: 16, fontWeight: FontWeight.w400),
              //           ),
              //           Text(
              //             'Quadril\n${nF.format(item.quadril)}',
              //             style: TextStyle(
              //                 fontSize: 16, fontWeight: FontWeight.w400),
              //           ),
              //         ]),
              //       ],
              //     ),
              //     Text(
              //       item.observacao,
              //       style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
              //     ),
              //   ],
              // ),

              subtitle: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: Text(
                                'Busto\n${nF.format(item.busto)}',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: Text(
                                'Cintura\n${nF.format(item.cintura)}',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                            ),
                            Text(
                              'Quadril\n${nF.format(item.quadril)}',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        Text(
                          item.observacao,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            IconSlideAction(
              caption: 'EDITAR',
              color: Colors.green,
              icon: Icons.edit,
              onTap: () => editar(item),
            ),
          ],
        )
      ],
    );
  }

  Future editar(ClienteManequimModel item) async {
    return Get.toNamed('/cliente_manequim_editar', arguments: {'item': item});
  }

  void confirmarAcao(
    BuildContext context,
    String acao,
    String msg,
    ProdutoModel item,
  ) {
    Widget naoButton = FlatButton(
      child: Text("Não"),
      onPressed: () {
        Get.back();
      },
    );
    Widget simButton = FlatButton(
      child: Text("Sim"),
      onPressed: () {
        switch (acao) {
          // case 'APAGAR':
          //   apagar(item);
          //   break;
          //  case 'LIBERAR':
          //    delegarColaborador(pessoaSendoDelegada, novoLider);
          //    break;
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
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
