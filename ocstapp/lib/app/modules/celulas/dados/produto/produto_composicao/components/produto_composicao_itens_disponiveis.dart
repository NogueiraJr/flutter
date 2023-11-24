import 'package:OCSTApp/app/models/produto_model.dart';
import 'package:OCSTApp/app/models/usuario_consulta_model.dart';
import 'package:OCSTApp/app/modules/celulas/dados/produto/produto_composicao/produto_composicao_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class ProdutoComposicaoItensDisponiveis extends StatelessWidget {
  final ProdutoModel item;
  // final UsuarioConsultaModel usuario;
  //final UsuarioRepository repository;
  final int produtoPrincipal;
  final ProdutoComposicaoController controller;

  const ProdutoComposicaoItensDisponiveis({
    Key key,
    this.item,
    // this.usuario,
    //this.repository,
    this.produtoPrincipal,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                maxRadius: 20,
                child: Image(
                  image: AssetImage('assets/images/dds-produtos.png'),
                  height: 320,
                ),
              ),
              title: Text(
                item.nome,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
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
                              fontSize: 12, fontWeight: FontWeight.normal),
                        ),
                        Text(
                          item.codigo,
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.normal),
                        ),
                        //Text(
                        //  item.menuPai == 'DDS'
                        //      ? 'DADOS'
                        //      : item.menuPai == 'OPR'
                        //          ? 'OPERACIONAL'
                        //          : item.menuPai == 'RLT' ? 'RELATÓRIO' : '',
                        //  style: TextStyle(
                        //      fontSize: 10, fontWeight: FontWeight.bold),
                        //),
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
              onTap: () => incluirProduto(item),
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
            //IconSlideAction(
            //  caption: 'OPCAO3',
            //  color: Colors.black45,
            //  icon: Icons.more_horiz,
            //  onTap: () => SnackBarUtils.showSnackBar('Mensagem', ''),
            //),
            //IconSlideAction(
            //  caption: 'APAGAR',
            //  color: Colors.red,
            //  icon: Icons.delete_outline,
            //  onTap: () => confirmarAcao(
            //      context,
            //      'BLOQUEARACESSO',
            //      'Vou bloquear o acesso ao Módulo ${item.menuNome}. Posso?',
            //      usuario.id,
            //      item.idMenu),
            //),
          ],
        )
      ],
    );
  }

  Future editar(UsuarioConsultaModel item) async {
    return Get.toNamed('/colaborador_editar', arguments: {'item': item});
  }

  incluirProduto(ProdutoModel item) async {
    await controller.incluirProdutoNaComposicao(produtoPrincipal, item.id);
    await controller.obterProdutoItemPorIdProdutoPai(produtoPrincipal);
    Get.back();
  }

  void confirmarAcao(BuildContext context, String acao, String msg,
      int idUsuario, int idMenu) {
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
          //case 'BLOQUEARACESSO':
          //  bloquearAcessoAoMenu(idUsuario, idMenu);
          //  break;
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
