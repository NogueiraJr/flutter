import 'package:OCSTApp/app/models/tag_model.dart';
import 'package:OCSTApp/app/models/usuario_consulta_model.dart';
import 'package:OCSTApp/app/modules/celulas/dados/tag/tag_controller.dart';
import 'package:OCSTApp/app/repositories/tag_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class TagItem extends StatelessWidget {
  final TagModel item;
  //final UsuarioConsultaModel colaboradorAnterior;
  //final UsuarioRepository repository;
  final TagController controller;
  //final UsuarioConsultaModel candidatoLider;

  const TagItem({
    Key key,
    this.item,
    //this.colaboradorAnterior,
    //this.repository,
    this.controller,
    //this.candidatoLider,
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
                maxRadius: 30,
                child: Image(
                  image: AssetImage('assets/images/dds-tag.png'),
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
                          '${item.descricao}',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                  //
                  // Usar isso para exibir ou não:
                  // App Locação de Roupas: qde de locações
                  // App Oficina: qde de reparos realizados
                  // etc.
                  //
                  //Visibility(
                  //  visible: item.qtdeFilhos > 0,
                  //  child: Expanded(
                  //    child: Padding(
                  //      padding: const EdgeInsets.only(left: 60),
                  //      child: Row(
                  //        children: <Widget>[
                  //          Icon(
                  //            Icons.people,
                  //            color: Colors.black,
                  //            size: 18,
                  //          ),
                  //          Padding(
                  //            padding: const EdgeInsets.only(left: 4),
                  //            child: Text(
                  //              '${item.qtdeFilhos}',
                  //              style: TextStyle(fontWeight: FontWeight.bold),
                  //              textAlign: TextAlign.end,
                  //            ),
                  //          ),
                  //        ],
                  //      ),
                  //    ),
                  //  ),
                  //)
                ],
              ),
              //onTap: () => exibirLiderados(item),
              //onLongPress: () => delegar(item),
            ),
          ),
          actions: <Widget>[
            IconSlideAction(
              caption: 'EDITAR',
              color: Colors.green,
              icon: Icons.edit,
              onTap: () => editar(item),
            ),
            //  IconSlideAction(
            //    caption: 'ACESSOS',
            //    color: Colors.yellow[700],
            //    icon: Icons.lock,
            //    //onTap: () => SnackBarUtils.showSnackBar('Mensagem', ''),
            //    //onTap: () => Get.offAllNamed(item.menuRef),
            //    onTap: () => definirAcessos(item),
            //  ),
          ],
          secondaryActions: <Widget>[
            //  IconSlideAction(
            //    caption: 'LIBERAR',
            //    color: Colors.blue,
            //    icon: Icons.perm_identity,
            //    onTap: () => confirmarAcao(
            //        context,
            //        'LIBERAR',
            //        'Vou LIBERAR ${item.pessoa} da Liderança atual. Posso?',
            //        item.login,
            //        item,
            //        candidatoLider),
            //  ),
            IconSlideAction(
                caption: 'APAGAR',
                color: Colors.red,
                icon: Icons.delete_outline,
                onTap: () => confirmarAcao(
                    context,
                    'APAGAR',
                    'Vou apagar a Etiqueta ${item.nome}. Ela será apagada também em todos os locais onde ela é usada no Sistema! Posso?',
                    item.id,
                    null,
                    null)),
          ],
        )
      ],
    );
  }

  Future editar(TagModel item) async {
    GetIt.I.registerSingleton<TagModel>(item);
    //return Get.toNamed('/cliente_editar', arguments: {'item': item});
    return Get.toNamed('/tag_editar');
  }

  void apagar(int id) async {
    final repository = new TagRepository();
    await repository.apagarTagPorId(item.id, item.usuarioId, 'S');

    //Trocar isso depois para o método principal
    //a ser usado pelo usuário no filtro, etc.
    controller.obterPrimeirosTagsParaTela();

    Get.back();
  }

  void confirmarAcao(
      BuildContext context,
      String acao,
      String msg,
      int id,
      UsuarioConsultaModel pessoaSendoDelegada,
      UsuarioConsultaModel novoLider) {
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
          case 'APAGAR':
            apagar(id);
            break;
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
