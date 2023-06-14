import 'package:OCSTApp/app/models/cliente_model.dart';
import 'package:OCSTApp/app/models/usuario_consulta_model.dart';
import 'package:OCSTApp/app/modules/celulas/dados/cliente/cliente_controller.dart';
import 'package:OCSTApp/app/modules/celulas/dados/cliente/cliente_item/cliente_item_menu.dart';
import 'package:OCSTApp/app/repositories/cliente_repository.dart';
import 'package:OCSTApp/app/utils/snackbar_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class ClienteItem extends StatelessWidget {
  final ClienteModel item;
  final ClienteController controller;

  const ClienteItem({
    Key key,
    this.item,
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
                maxRadius: 30,
                child: Image(
                  image: AssetImage('assets/images/dds-cliente.png'),
                  height: 320,
                ),
              ),
              title: Text(
                item.nome,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
              trailing:
                  (new ClienteItemMenu().buildPopupMenuButton(context, item)),
              subtitle: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '${item.email.toLowerCase()}',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w300),
                        ),
                        Text(
                          '${item.celular}',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        _makeTags(item.tags),
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
          secondaryActions: <Widget>[
            IconSlideAction(
                caption: 'APAGAR',
                color: Colors.red,
                icon: Icons.delete_outline,
                onTap: () => confirmarAcao(
                    context,
                    'APAGAR',
                    'Vou apagar o Cliente ${item.nome}. Posso?',
                    item.id,
                    null,
                    null)),
          ],
        )
      ],
    );
  }

  Future editar(ClienteModel item) async {
    GetIt.I.registerSingleton<ClienteModel>(item);
    return Get.toNamed('/cliente_editar');
  }

  void apagar(int id) async {
    final repository = new ClienteRepository();
    SnackBarUtils.showSnackBar('Atenção',
        await repository.apagarClientePorId(item.id, item.usuarioId));

    //Trocar isso depois para o método principal
    //a ser usado pelo usuário no filtro, etc.
    controller.obterPrimeirosClientesParaTela();

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

  Widget _makeTags(String tagsItem) {
    GlobalKey<TagsState> globalKeyTag = GlobalKey<TagsState>();
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
              activeColor: tags[index].title == controller.filter
                  ? Colors.yellow.shade200
                  : Colors.grey.shade200,
              colorShowDuplicate: Colors.red.shade200,
              color: Colors.green.shade100,
              textActiveColor: Colors.black,
              customData: currentItem.customData,
              textStyle: TextStyle(fontSize: 10),
              combine: ItemTagsCombine.withTextBefore,
              onPressed: (i) => print(i),
              onLongPressed: (i) {
                controller.filter.length == 0 || controller.filter != i.title
                    ? controller.setFilter(i.title)
                    : controller.setFilter('');
              },
            );
          },
        ),
      ),
    );
  }
}
