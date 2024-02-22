import 'package:OCSTApp/app/models/atendimento_servico_item_model.dart';
import 'package:OCSTApp/app/models/produto_model.dart';
import 'package:OCSTApp/app/modules/celulas/dados/produto/produto_controller.dart';
import 'package:OCSTApp/app/modules/celulas/dados/produto/produto_resumo/produto_resumo_dialog.dart';
import 'package:OCSTApp/app/modules/celulas/operacional/atendimento_servico/atendimento_servico_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

class AtendimentoProdutoEscolhidoItem extends StatelessWidget {
  final AtendimentoServicoItemModel item;
  //final UsuarioConsultaModel colaboradorAnterior;
  //final UsuarioRepository repository;
  // final EscolherProdutoController controller;
  //final UsuarioConsultaModel candidatoLider;
  final AtendimentoServicoController atendimentoServicoController;

  const AtendimentoProdutoEscolhidoItem({
    Key key,
    this.item,
    //this.colaboradorAnterior,
    //this.repository,
    // this.controller,
    //this.candidatoLider,
    this.atendimentoServicoController,
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
            // color: Colors.white,
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
                item.produtoNome,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
              subtitle: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '${item.produtoDescricao}',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w300),
                        ),
                        Text(
                          'R\$ ${nF.format(item.produtoPreco)}',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        // _makeTags(item.tags),
                      ],
                    ),
                  ),
                ],
              ),
              // trailing: Column(
              //   children: <Widget>[
              //     Visibility(
              //       visible: item.compostoDe > 0,
              //       child: Row(
              //         mainAxisSize: MainAxisSize.min,
              //         children: <Widget>[
              //           Icon(
              //             Icons.toll,
              //             color: Colors.black,
              //             size: 18,
              //           ),
              //           Padding(
              //             padding: const EdgeInsets.only(left: 4),
              //             child: Text(
              //               '${item.compostoDe}',
              //               style: TextStyle(fontWeight: FontWeight.bold),
              //               textAlign: TextAlign.end,
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //     Visibility(
              //       visible: item.compoe > 0,
              //       child: Row(
              //         mainAxisSize: MainAxisSize.min,
              //         children: <Widget>[
              //           Icon(
              //             Icons.filter_center_focus,
              //             color: Colors.black,
              //             size: 18,
              //           ),
              //           Padding(
              //             padding: const EdgeInsets.only(left: 4),
              //             child: Text(
              //               '${item.compoe}',
              //               style: TextStyle(fontWeight: FontWeight.bold),
              //               textAlign: TextAlign.end,
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
              onTap: () => exibirResumoProduto(context, item.produtoId),
              //onLongPress: () => delegar(item),
            ),
          ),
          actions: <Widget>[
            // IconSlideAction(
            //   caption: 'EDITAR',
            //   color: Colors.green,
            //   icon: Icons.edit,
            //   onTap: () => editar(item),
            // ),
            // IconSlideAction(
            //   caption: 'COMPOSIÇÃO',
            //   color: Colors.yellow[700],
            //   icon: Icons.toll,
            //   onTap: () => comporProduto(item),
            // ),
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
                      'Vou remover o Produto ${item.produtoNome} do Atendimento. Posso?',
                      item,
                      //null,
                      //null
                    )),
          ],
        )
      ],
    );
  }

  exibirResumoProduto(BuildContext context, int idProduto) async {
    // final produtoController = GetIt.I.get<ProdutoController>();
    final produtoController = ProdutoController();
    final item = await produtoController.obterProdutoPorId(idProduto);
    await produtoController.consultarResumoDoProduto(item);
    await produtoController.montaListaCompoe();
    await produtoController.montaListaComposto();
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => ProdutoResumoDialog(
            item: item, produtoController: produtoController),
        fullscreenDialog: true,
      ),
    );
  }

  // Future editar(ProdutoModel item) async {
  //   GetIt.I.registerSingleton<ProdutoModel>(item);
  //   //return Get.toNamed('/produto_editar', arguments: {'item': item});
  //   return Get.toNamed('/produto_editar');
  // }

  void apagar(AtendimentoServicoItemModel item) async {
    await atendimentoServicoController.removerProdutoDoServicoSendoCriado(item);
    Get.back();
  }

  void confirmarAcao(
    BuildContext context,
    String acao,
    String msg,
    AtendimentoServicoItemModel item,
    // UsuarioConsultaModel pessoaSendoDelegada,
    // UsuarioConsultaModel novoLider
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
          case 'APAGAR':
            apagar(item);
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

  produtoEscolhido(ProdutoModel item) {
    var atendimentoServicoController =
        GetIt.I.get<AtendimentoServicoController>();
    atendimentoServicoController.produtosEscolhidos.add(item);
    Get.back();
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

  // Future comporProduto(ProdutoModel item) async {
  //   return Get.toNamed('/produto_composicao', arguments: {'produto': item});
  // }

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

  // Widget _makeTags(String tagsItem) {
  //   GlobalKey<TagsState> globalKeyTag = GlobalKey<TagsState>();
  //   List tags = controller.tagStringParaTagsList(tagsItem);
  //   return Visibility(
  //     visible: tags.length > 0,
  //     child: Container(
  //       child: Tags(
  //         key: globalKeyTag,
  //         itemCount: tags.length,
  //         alignment: WrapAlignment.start,
  //         horizontalScroll: true,
  //          HorizontalScroll: 35,
  //         spacing: 2,
  //         itemBuilder: (index) {
  //           final Item currentItem = Item(title: tags[index].title);
  //           return ItemTags(
  //             index: index,
  //             title: currentItem.title,
  //             border: Border.all(color: Colors.black, width: 0.5),
  //             activeColor: Colors.grey.shade200,
  //             colorShowDuplicate: Colors.red.shade200,
  //             color: Colors.green.shade100,
  //             textActiveColor: Colors.black,
  //             customData: currentItem.customData,
  //             textStyle: TextStyle(fontSize: 10),
  //             combine: ItemTagsCombine.withTextBefore,
  //             onPressed: (i) => print(i),
  //             onLongPressed: (i) => print(i),
  //           );
  //         },
  //       ),
  //     ),
  //   );
  // }
}
