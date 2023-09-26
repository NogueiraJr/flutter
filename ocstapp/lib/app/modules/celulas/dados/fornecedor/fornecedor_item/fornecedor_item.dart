import 'package:OCSTApp/app/models/fornecedor_model.dart';
import 'package:OCSTApp/app/models/usuario_consulta_model.dart';
import 'package:OCSTApp/app/modules/celulas/dados/fornecedor/fornecedor_controller.dart';
import 'package:OCSTApp/app/repositories/fornecedor_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class FornecedorItem extends StatelessWidget {
  final FornecedorModel item;
  //final UsuarioConsultaModel colaboradorAnterior;
  //final UsuarioRepository repository;
  final FornecedorController controller;
  //final UsuarioConsultaModel candidatoLider;

  const FornecedorItem({
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
                  image: AssetImage('assets/images/dds-fornecedores.png'),
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
                          '${item.email.toLowerCase()}',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w300),
                        ),
                        Text(
                          '${item.telefone}',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        _makeTags(item.tags),
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
                    'Vou apagar o Fornecedor ${item.nome}. Posso?',
                    item.id,
                    null,
                    null)),
          ],
        )
      ],
    );
  }

  Future editar(FornecedorModel item) async {
    GetIt.I.registerSingleton<FornecedorModel>(item);
    //return Get.toNamed('/cliente_editar', arguments: {'item': item});
    return Get.toNamed('/fornecedor_editar');
  }

  void apagar(int id) async {
    final repository = new FornecedorRepository();
    await repository.apagarFornecedorPorId(item.id, item.usuarioId);

    //Trocar isso depois para o método principal
    //a ser usado pelo usuário no filtro, etc.
    controller.obterPrimeirosFornecedoresParaTela();

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
              onLongPressed: (i) =>
                  controller.filter.length == 0 || controller.filter != i.title
                      ? controller.setFilter(i.title)
                      : controller.setFilter(''),
            );
          },
        ),
      ),
    );
  }
}
