import 'package:OCSTApp/app/models/atendimento_servico_info_model.dart';
import 'package:OCSTApp/app/models/usuario_consulta_model.dart';
import 'package:OCSTApp/app/modules/celulas/operacional/atendimento_servico/atendimento_servico_controller.dart';
import 'package:OCSTApp/app/repositories/atendimento_servico_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

class AtendimentoServicoInfoItem extends StatelessWidget {
  final AtendimentoServicoInfoModel item;
  //final UsuarioConsultaModel colaboradorAnterior;
  //final UsuarioRepository repository;
  final AtendimentoServicoController controller;
  //final UsuarioConsultaModel candidatoLider;

  const AtendimentoServicoInfoItem({
    Key key,
    this.item,
    //this.colaboradorAnterior,
    //this.repository,
    this.controller,
    //this.candidatoLider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('dd/MM/yyyy HH:mm:ss');
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
                  image: AssetImage(
                      'assets/images/opr-atendimento-servico-info.png'),
                  height: 320,
                ),
              ),
              title: Text(
                '${item.usuarioPessoa}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
              // trailing:
              //     (new ClienteItemMenu().buildPopupMenuButton(context, item)),
              subtitle: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '${item.descricao}',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                        Visibility(
                          visible: item.observacao.trim().length > 0,
                          child: Text(
                            '${item.observacao}',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w300),
                          ),
                        ),
                        Text(
                          formatter.format(item.quando),
                          style: TextStyle(fontSize: 12),
                        ),
                        Visibility(
                          visible: item.quandoAlterado != item.quando,
                          child: Text(
                            '${formatter.format(item.quandoAlterado)} (editado)',
                            style: TextStyle(fontSize: 12),
                          ),
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
//              onLongPress: () {
              // showMenu(
              //     items: <PopupMenuEntry>[
              //       PopupMenuItem(
              //         // value: this._index,
              //         child: Column(
              //           children: <Widget>[
              //             Row(
              //               children: <Widget>[
              //                 Icon(Icons.delete),
              //                 Text("Opção1"),
              //               ],
              //             ),
              //             Row(
              //               children: <Widget>[
              //                 Icon(Icons.delete),
              //                 Text("Opção2"),
              //               ],
              //             ),
              //           ],
              //         ),
              //       )
              //     ],
              //     context: context,
              //     position: RelativeRect.fromLTRB(
              //         SizeUtils.widthScreen, SizeUtils.heightScreen, 200, 200)
              //     // position: RelativeRect.fromRect(Rect.largest, Rect.largest)
              //     // position: RelativeRect.fromLTRB((SizeUtils.widthScreen / 2),
              //     //     SizeUtils.heightScreen / 2, 10, 10),
              //     );
              //            },
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
                    'Vou apagar o Item ${item.descricao}. Posso?',
                    item.id,
                    null,
                    null)),
          ],
        )
      ],
    );
  }

  // PopupMenuButton<String> buildPopupMenuButton(BuildContext context) {
  //   return PopupMenuButton<String>(
  //             tooltip: 'Mais ações para este item',
  //             icon: Icon(
  //               Icons.more_vert,
  //               color: Colors.black54,
  //             ),
  //             onSelected: (opcaoMenu) {
  //               // controller.acaoDoMenuEscolhido(opcaoMenu);
  //               switch (opcaoMenu) {
  //                 case 'clienteManequim':
  //                   manequim(item.id, context);
  //                   break;
  //                 default:
  //               }
  //               print(opcaoMenu);
  //             },
  //             itemBuilder: (new ClienteItemMenu().buildPopupMenus),
  //           );
  // }

  // List<PopupMenuEntry<String>> buildPopupMenus(_) {
  //   var controller = GetIt.I.get<PrincipalController>();
  //   List<PopupMenuEntry<String>> menus = [];
  //   menus.add(buildPopupMenuClienteDetalhes());
  //   switch (controller.idSistema) {
  //     case 1: /*refLocacaoRoupas*/
  //       menus.add(buildPopupMenuClienteManequim());
  //       return menus;
  //     case 3: /*refOficinaCarros*/
  //       menus.add(buildPopupMenuClienteVeiculos());
  //       return menus;
  //     case 6: /*refPetShop*/
  //       menus.add(buildPopupMenuClienteAnimais());
  //       return menus;
  //     default:
  //       return menus;
  //   }
  // }

  // manequim(int clienteId, BuildContext context) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute<void>(
  //       builder: (BuildContext context) =>
  //           ClienteManequimDialog(clienteId: clienteId),
  //       fullscreenDialog: true,
  //     ),
  //   );
  // }

  // PopupMenuItem<String> buildPopupMenuClienteDetalhes() {
  //   return PopupMenuItem<String>(
  //       value: 'clienteDetalhes',
  //       child: Column(children: <Widget>[
  //         Row(children: <Widget>[
  //           Padding(
  //               padding: const EdgeInsets.only(right: 8),
  //               child: Icon(Icons.perm_identity, color: Colors.black54)),
  //           // child: Icon(Icons.person, color: Colors.black54)),
  //           Text('Detalhes',
  //               style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
  //         ])
  //       ]));
  // }

  // PopupMenuItem<String> buildPopupMenuClienteVeiculos() {
  //   return PopupMenuItem<String>(
  //       value: 'clienteVeiculos',
  //       child: Column(children: <Widget>[
  //         Row(children: <Widget>[
  //           Padding(
  //               padding: const EdgeInsets.only(right: 8),
  //               child: Icon(Icons.directions_car, color: Colors.black54)),
  //           Text('Veículos',
  //               style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
  //         ])
  //       ]));
  // }

  // PopupMenuItem<String> buildPopupMenuClienteAnimais() {
  //   return PopupMenuItem<String>(
  //       value: 'clienteAnimais',
  //       child: Column(children: <Widget>[
  //         Row(children: <Widget>[
  //           Padding(
  //               padding: const EdgeInsets.only(right: 8),
  //               child: Icon(Icons.pets, color: Colors.black54)),
  //           Text('Animais',
  //               style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
  //         ])
  //       ]));
  // }

  // PopupMenuItem<String> buildPopupMenuClienteManequim() {
  //   return PopupMenuItem<String>(
  //       value: 'clienteManequim',
  //       child: Column(children: <Widget>[
  //         Row(children: <Widget>[
  //           Padding(
  //               padding: const EdgeInsets.only(right: 8),
  //               child: Icon(Icons.accessibility, color: Colors.black54)),
  //           Text('Manequim',
  //               style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
  //         ])
  //       ]));
  // }

  Future editar(AtendimentoServicoInfoModel item) async {
    GetIt.I.registerSingleton<AtendimentoServicoInfoModel>(item);
    return Get.toNamed('/atendimento_servico_info_editar'); //,
    // arguments: {'item': item});
  }

  void apagar(int id) async {
    final repository = new AtendimentoServicoRepository();
    await repository.apagarAtendimentoServicoInfo(item.id);
    Get.back();
    controller.consultarAtendimentoServicoInfo(item.atendimentoServicoId);
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

  //delegar(UsuarioConsultaModel item) {
  //  if (controller.usuarios.length <= 1) {
  //    SnackBarUtils.showSnackBar('Puxa vida!',
  //        'Preciso de ao menos 2 Colaboradores para definir Hierarquia entre eles.');
  //  } else {
  //    Get.defaultDialog(
  //      title: '${item.pessoa} vai trabalhar para quem?',
  //      content: Column(children: <Widget>[
  //        //Text(
  //        //  'Seu Grupo',
  //        //  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  //        //),
  //        Expanded(
  //            child: ListView.builder(
  //          itemBuilder: (_, index) => ColaboradorItemDelegar(item,
  //              candidatoLider: controller.usuarios[index],
  //              controller: controller),
  //          itemCount: controller.usuarios?.length ?? 0,
  //        ))
  //      ]),
  //      cancel: FlatButton(
  //        onPressed: () => Get.back(),
  //        child: Text(
  //          'Fechar',
  //          style: TextStyle(color: ThemeUtils.primaryColor, fontSize: 20),
  //        ),
  //      ),
  //    );
  //  }
  //}

  //exibirLiderados(UsuarioConsultaModel item) async {
  //  //Get.toNamed('/colaborador', arguments: {'login': item.login});
  //  UsuarioRepository usuarioRepository = new UsuarioRepository();
  //  await usuarioRepository.addLoginParam(item.login);
  //  Get.toNamed('/colaborador', arguments: {'login': item.login});
  //  //Get.toNamed('/colaborador');
  //
  //  //if (await controller.obterLiderados(item.id)) {
  //  //  if (controller.usuariosLiderados?.length == 0) {
  //  //    //SnackBarUtils.showSnackBar(
  //  //    //    'Colaborador', 'Puxa vida! ${item.pessoa} não é lider.');
  //  //    return;
  //  //  }
  //  //  Get.defaultDialog(
  //  //    title: 'Colaboradores liderados por ${item.pessoa}',
  //  //    content: Column(children: <Widget>[
  //  //      Expanded(
  //  //          child: ListView.builder(
  //  //        itemBuilder: (_, index) => ColaboradorItemLiderados(item,
  //  //            candidatoLider: controller.usuariosLiderados[index],
  //  //            colaboradorAnterior: colaboradorAnterior,
  //  //            controller: controller),
  //  //        itemCount: controller.usuariosLiderados?.length ?? 0,
  //  //      ))
  //  //    ]),
  //  //    cancel: FlatButton(
  //  //      onPressed: () => Get.back(),
  //  //      child: Text(
  //  //        'Fechar',
  //  //        style: TextStyle(color: ThemeUtils.primaryColor, fontSize: 20),
  //  //      ),
  //  //    ),
  //  //  );
  //  //}
  //}

  //Future definirAcessos(UsuarioConsultaModel usuario) async {
  //  return Get.toNamed('/acessos_usuario', arguments: {'usuario': usuario});
  //}

  //Future<void> delegarColaborador(UsuarioConsultaModel pessoaSendoDelegada,
  //    UsuarioConsultaModel novoLider) async {
  //  final repository = new UsuarioRepository();
  //  await repository.delegarColaborador(pessoaSendoDelegada, novoLider);
  //  //controller.defineProprietarioComoLoginParam();
  //  //controller.obterDadosUsuario();
  //  //controller.obterDados();
  //  controller.obterDadosParaListaEquipe();
  //  Get.back();
  //  //Get.back();
  //}

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
              activeColor: tags[index].title == controller.filterInfo
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
                controller.filterInfo.length == 0 ||
                        controller.filterInfo != i.title
                    ? controller.setFilterInfo(i.title)
                    : controller.setFilterInfo('');
              },
            );
          },
        ),
      ),
    );
  }
}
