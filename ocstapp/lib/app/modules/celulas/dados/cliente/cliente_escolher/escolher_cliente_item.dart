import 'package:OCSTApp/app/models/cliente_model.dart';
import 'package:OCSTApp/app/models/usuario_consulta_model.dart';
import 'package:OCSTApp/app/modules/celulas/dados/cliente/cliente_escolher/escolher_cliente_controller.dart';
import 'package:OCSTApp/app/modules/celulas/operacional/atendimento_servico/atendimento_servico_controller.dart';
import 'package:OCSTApp/app/modules/celulas/operacional/locacao_roupa/locacao_roupa_controller.dart';
import 'package:OCSTApp/app/repositories/cliente_repository.dart';
import 'package:OCSTApp/app/repositories/usuario_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class EscolherClienteItem extends StatelessWidget {
  final ClienteModel item;
  //final UsuarioConsultaModel colaboradorAnterior;
  //final UsuarioRepository repository;
  final EscolherClienteController controller;
  //final UsuarioConsultaModel candidatoLider;

  const EscolherClienteItem({
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
                  image: AssetImage('assets/images/dds-cliente.png'),
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
                          '${item.celular}',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        _makeTags(item.tags),
                        // Text(
                        //   '(${item.usuarioNome})',
                        //   style: TextStyle(
                        //       fontSize: 10, fontWeight: FontWeight.w400),
                        // ),
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
              onTap: () => clienteEscolhido(item),
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
            // IconSlideAction(
            //     caption: 'APAGAR',
            //     color: Colors.red,
            //     icon: Icons.delete_outline,
            //     onTap: () => confirmarAcao(
            //         context,
            //         'APAGAR',
            //         'Vou apagar o Cliente ${item.nome}. Posso?',
            //         item.id,
            //         null,
            //         null)),
          ],
        )
      ],
    );
  }

  // Future editar(ClienteModel item) async {
  //   GetIt.I.registerSingleton<ClienteModel>(item);
  //   //return Get.toNamed('/cliente_editar', arguments: {'item': item});
  //   return Get.toNamed('/cliente_editar');
  // }

  // void apagar(int id) async {
  //   final repository = new ClienteRepository();
  //   await repository.apagarClientePorId(item.id, item.usuarioId);

  //   //Trocar isso depois para o método principal
  //   //a ser usado pelo usuário no filtro, etc.
  //   controller.obterPrimeirosClientesParaTela();

  //   Get.back();
  // }

  // void confirmarAcao(
  //     BuildContext context,
  //     String acao,
  //     String msg,
  //     int id,
  //     UsuarioConsultaModel pessoaSendoDelegada,
  //     UsuarioConsultaModel novoLider) {
  //   Widget naoButton = FlatButton(
  //     child: Text("Não"),
  //     onPressed: () {
  //       Get.back();
  //     },
  //   );
  //   Widget simButton = FlatButton(
  //     child: Text("Sim"),
  //     onPressed: () {
  //       switch (acao) {
  //         case 'APAGAR':
  //           apagar(id);
  //           break;
  //         //  case 'LIBERAR':
  //         //    delegarColaborador(pessoaSendoDelegada, novoLider);
  //         //    break;
  //         default:
  //       }
  //     },
  //   );
  //   AlertDialog alert = AlertDialog(
  //     title: Text("Atenção"),
  //     content: Text(msg),
  //     actions: [
  //       naoButton,
  //       simButton,
  //     ],
  //   );
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return alert;
  //     },
  //   );
  // }

  clienteEscolhido(ClienteModel item) async {
    final usuarioRepository = new UsuarioRepository();
    final sistemaRef = await usuarioRepository
        .obterDadosDoSistemaEscolhidoPeloUsuario(
            await usuarioRepository.getLogin())
        .then((res) => res.sistemaRef);

    if (sistemaRef == 'refLocacaoRoupas') {
      var controller = GetIt.I.get<LocacaoRoupaController>();
      controller.clienteEscolhidoId = item.id;
      controller.clienteEscolhidoNome = item.nome.split(' ')[0];
      controller.descricaoReserva = 'Locação de ' + item.nome.split(' ')[0];
      Get.back();
    } else if (sistemaRef == 'refOficinaCarros' ||
        sistemaRef == 'refCabeleireiro' ||
        sistemaRef == 'refDentista' ||
        sistemaRef == 'refPetShop' ||
        sistemaRef == 'refClinicaVeterinaria' ||
        sistemaRef == 'refClinicaEstetica' ||
        sistemaRef == 'refEstudioFotografico') {
      var controller = GetIt.I.get<AtendimentoServicoController>();
      controller.clienteEscolhidoId = item.id;
      controller.clienteEscolhidoNome = item.nome.split(' ')[0];
      controller.descricaoServico = 'Atender ' + item.nome.split(' ')[0];
      //Zerar escolhas que dependem do Cliente selecionado
      controller.clienteObjetoEscolhidoId = 0;
      // controller.clienteObjetoEscolhidoNome = 'Qual Veículo?';
      Get.back();
    }
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
