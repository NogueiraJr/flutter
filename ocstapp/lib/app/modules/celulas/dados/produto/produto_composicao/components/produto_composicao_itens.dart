import 'package:OCSTApp/app/models/produto_model.dart';
import 'package:OCSTApp/app/modules/celulas/dados/produto/produto_composicao/produto_composicao_controller.dart';
import 'package:OCSTApp/app/repositories/produto_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProdutoComposicaoItens extends StatelessWidget {
  final ProdutoModel item;
  final ProdutoModel produtoBase;
  // final UsuarioRepository repository;
  final ProdutoComposicaoController controller;

  const ProdutoComposicaoItens({
    Key key,
    this.item,
    this.produtoBase,
    // this.repository,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nF = new NumberFormat("#,###,##0.00", "pt_BR");
    return Column(
      children: <Widget>[
        Slidable(
          actionPane: SlidableBehindActionPane(),
          actionExtentRatio: 0.25,
          child: Container(
            color: Colors.white,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                maxRadius: 30,
                child: Image(
                  image: AssetImage('assets/images/dds-produtos.png'),
                  height: 320,
                ),
              ),
              title: Text(
                item.nome,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
              subtitle: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          item.descricao,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.normal),
                        ),
                        Text(
                          '${item.codigo} • R\$ ${nF.format(item.custo ?? 0)} • R\$ ${nF.format(item.preco ?? 0)}',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                    //Visibility(
                    //  visible: item.qtdeFilhos > 0,
                    //  child: Expanded(
                    //    child: Text(
                    //      '[${item.qtdeFilhos}]',
                    //      style: TextStyle(fontWeight: FontWeight.bold),
                    //      textAlign: TextAlign.end,
                    //    ),
                    //  ),
                    //)
                  )
                ],
              ),
              //onTap: () => exibirLiderados(item),
              //onLongPress: () => delegar(item),
            ),
          ),
          actions: <Widget>[
            //IconSlideAction(
            //  caption: 'EDITAR',
            //  color: Colors.green,
            //  icon: Icons.edit,
            //  //onTap: () => editar(item),
            //),
            //IconSlideAction(
            //  caption: 'ACESSOS',
            //  color: Colors.yellow[700],
            //  icon: Icons.lock,
            //  //onTap: () => SnackBarUtils.showSnackBar('Mensagem', ''),
            //  //onTap: () => Get.offAllNamed(item.menuRef),
            //),
          ],
          secondaryActions: <Widget>[
            IconSlideAction(
              caption: 'RETIRAR',
              color: Colors.red,
              icon: Icons.cancel,
              onTap: () => confirmarAcao(context, 'RETIRAR',
                  'Vou retirar o produto ${item.nome} da composição. Posso?'),
            ),
            //  IconSlideAction(
            //    caption: 'APAGAR',
            //    color: Colors.red,
            //    icon: Icons.delete_forever,
            //    onTap: () => apagar(item.id),
            //  ),
          ],
        )
      ],
    );
  }

  void apagar() async {
    final repository = new ProdutoRepository();
    await repository.retirarProdutoDaComposicao(produtoBase.id, item.id);
    controller.obterProdutoItemPorIdProdutoPai(produtoBase.id);
    Get.back();
  }

  void confirmarAcao(BuildContext context, String acao, String msg) {
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
          case 'RETIRAR':
            apagar();
            break;
          //case 'DELEGAR':
          //  //apagar(login);
          //  break;
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
