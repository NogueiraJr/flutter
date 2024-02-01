import 'package:OCSTApp/app/models/atendimento_servico_model.dart';
import 'package:OCSTApp/app/models/usuario_consulta_model.dart';
import 'package:OCSTApp/app/modules/celulas/operacional/atendimento_servico/atendimento_servico_controller.dart';
import 'package:OCSTApp/app/modules/celulas/operacional/atendimento_servico/components/atendimento_servico_resumo_dialog.dart';
import 'package:OCSTApp/app/modules/celulas/operacional/atendimento_servico/info/atendimento_servico_info_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

class AtendimentoServicoCalendarioItem extends StatelessWidget {
  final AtendimentoServicoModel item;
  //final UsuarioConsultaModel colaboradorAnterior;
  //final UsuarioRepository repository;
  final AtendimentoServicoController controller;
  //final UsuarioConsultaModel candidatoLider;

  const AtendimentoServicoCalendarioItem({
    Key key,
    this.item,
    //this.colaboradorAnterior,
    //this.repository,
    this.controller,
    //this.candidatoLider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var horario = '';
    var cor = Colors.white;
    if (item.iniciado == null) {
      cor = Colors.black12;
      horario = item.iniciar.split(' ')[1];
    } else if (item.iniciado != null && item.finalizado == null) {
      cor = Colors.blue[400];
      horario = item.iniciado.split(' ')[1];
    } else if (item.finalizado != null && item.ativo == 'S') {
      cor = Colors.green;
      horario = item.finalizado.split(' ')[1];
    }
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Slidable(
            actionPane: SlidableBehindActionPane(),
            actionExtentRatio: 0.25,
            child: Container(
              color: cor,
              child: ListTile(
                // leading: CircleAvatar(
                //   backgroundColor: Colors.transparent,
                //   maxRadius: 30,
                //   child: Row(
                //     children: <Widget>[
                //       Visibility(
                //         visible:
                //             (item.iniciado == null && item.finalizado == null),
                //         child: Image(
                //           image: AssetImage(
                //               'assets/images/opr-atendimento-iniciar.png'),
                //           height: 320,
                //         ),
                //       ),
                //       Visibility(
                //         visible:
                //             (item.iniciado != null && item.finalizado == null),
                //         child: Image(
                //           image: AssetImage(
                //               'assets/images/opr-atendimento-iniciado.png'),
                //           height: 320,
                //         ),
                //       ),
                //       Visibility(
                //         visible: (item.iniciado != null &&
                //             item.finalizado != null &&
                //             item.ativo == 'S'),
                //         child: Image(
                //           image: AssetImage(
                //               'assets/images/opr-atendimento-finalizado.png'),
                //           height: 320,
                //         ),
                //       ),
                //       Visibility(
                //         visible: (item.iniciado != null &&
                //             item.finalizado != null &&
                //             item.ativo == 'N'),
                //         child: Image(
                //           image: AssetImage(
                //               'assets/images/opr-atendimento-arquivado.png'),
                //           height: 320,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                title: Container(
                  child: Text(
                    horario,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                  ),
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
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          Visibility(
                            visible: item.observacao.length > 0,
                            child: Text(
                              '${item.observacao}',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w300),
                            ),
                          ),
                          // _makeIniciar(),
                          // _makeFinalizar(),
                          // _makeFinalizado(),
                          // _makeTags(item.tags),
                        ],
                      ),
                    ),
                    //     //
                    //     // Usar isso para exibir ou não:
                    //     // App Locação de Roupas: qde de locações
                    //     // App Oficina: qde de reparos realizados
                    //     // etc.
                    //     //
                    //     // Visibility(
                    //     //   visible: item.iniciado != null,
                    //     //   child: Expanded(
                    //     //     child: Row(
                    //     //       children: <Widget>[
                    //     //         Icon(
                    //     //           Icons.arrow_forward,
                    //     //           color: Colors.black,
                    //     //           size: 18,
                    //     //         ),
                    //     //         Padding(
                    //     //           padding: const EdgeInsets.only(left: 4),
                    //     //           child: Text(
                    //     //             '${item.id}',
                    //     //             style: TextStyle(fontWeight: FontWeight.bold),
                    //     //             textAlign: TextAlign.end,
                    //     //           ),
                    //     //         ),
                    //     //       ],
                    //     //     ),
                    //     //   ),
                    //     // )
                    //   ],
                    // ),
                    // trailing: Column(
                    //   children: <Widget>[
                    //     Visibility(
                    //         visible: item.iniciado != null && item.finalizado == null,
                    //         child: Icon(
                    //           Icons.check_circle_outline,
                    //           color: Colors.blue,
                    //         )),
                    //     Visibility(
                    //         visible: item.finalizado != null,
                    //         child: Icon(
                    //           Icons.check_circle_outline,
                    //           color: Colors.green,
                    //         )),
                    //     Visibility(
                    //       visible: item.finalizado != null && item.ativo == 'N',
                    //       child: Icon(
                    //         Icons.check_circle_outline,
                    //         color: Colors.orange,
                    //       ),
                    //     ),
                  ],
                ),
                trailing: Container(
                  child: Wrap(
                    direction: Axis.vertical,
                    children: <Widget>[
                      // Visibility(
                      //     visible:
                      //         item.iniciado != null && item.finalizado == null,
                      //     child: Icon(
                      //       Icons.check_circle_outline,
                      //       color: Colors.blue,
                      //     )),
                      // Visibility(
                      //     visible: item.finalizado != null,
                      //     child: Icon(
                      //       Icons.check_circle_outline,
                      //       color: Colors.green,
                      //     )),
                      // Visibility(
                      //   visible: item.finalizado != null && item.ativo == 'N',
                      //   child: Icon(
                      //     Icons.check_circle_outline,
                      //     color: Colors.orange,
                      //   ),
                      // ),
                      Visibility(
                        visible: item.faturado,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          maxRadius: 12,
                          child: Icon(
                            Icons.check_circle,
                            color: Colors.deepPurple[400],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //Causa um erro ao abrir a tela de Resumo do Atendimento.
                //Parece ser no momento em que verifica o estado
                //[atendimentoServicoController.produtosDoServicoState]
                //para listar os produtos do atendimento.
                //Como os produtos não estão relacionados à agenda (datas, etc.), sanar isso depois.
                onTap: () => exibirAtendimentoServico(context),
                onLongPress: () => mudarDataHora(item, context),
              ),
            ),
            actions: actions(context),
            secondaryActions: secondaryActions(context),
          ),
        )
      ],
    );
  }

  List<Widget> secondaryActions(BuildContext context) {
    List<Widget> _actions = [];
    if (item.iniciado == null) {
      _actions.add(IconSlideAction(
        caption: 'CANCELAR',
        color: Colors.red,
        icon: Icons.cancel,
        onTap: () => confirmarAcao(
            context,
            'CANCELAR',
            'Vou cancelar (apagar) o Atendimento ${item.descricao}. Posso?',
            item.id),
      ));
    }
    if (item.iniciado != null && !item.faturado) {
      _actions.add(IconSlideAction(
          caption: 'FATURAR',
          color: Colors.deepPurple[400],
          icon: Icons.attach_money,
          onTap: () async => await faturar(item)));
      //   onTap: () => confirmarAcao(
      //       context,
      //       'FATURAR',
      //       'Irei Faturar o Atendimento ${item.descricao}. Posso?',
      //       item.id,
      //       null,
      //       null),
      // ));
    }
    if (item.iniciado != null && item.finalizado != null && item.ativo == 'S') {
      _actions.add(IconSlideAction(
        caption: 'ARQUIVAR',
        color: Colors.orange[300],
        icon: Icons.save_alt,
        onTap: () => confirmarAcao(context, 'ARQUIVAR',
            'Vou arquivar o Atendimento ${item.descricao}. Posso?', item.id),
      ));
    }
    return _actions;
  }

  Future<void> faturar(AtendimentoServicoModel item) async {
    final atendimentoServicoController =
        Modular.get<AtendimentoServicoController>();
    await atendimentoServicoController.consultarProdutosDoServico(item.id);
    item.valor = atendimentoServicoController.produtosDoServicoValorTotal;
    await controller.faturar(item);
  }

  List<Widget> actions(BuildContext context) {
    List<Widget> _actions = [];
    if (item.iniciado == null && item.finalizado == null) {
      _actions.add(IconSlideAction(
        caption: 'INICIAR',
        color: Colors.blue,
        icon: Icons.play_circle_outline,
        onTap: () => iniciar(item, context),
      ));
    }
    if (item.iniciado != null && item.finalizado == null) {
      _actions.add(IconSlideAction(
        caption: 'FINALIZAR',
        color: Colors.green,
        icon: Icons.check_circle_outline,
        onTap: () => finalizar(item, context),
      ));
    }
    // if (item.finalizado == null) {
    //Causa um erro ao abrir a tela de Atuação.
    //Como a atuação não está relacionada diretamente à agenda (datas, etc.), sanar isso depois.
    _actions.add(IconSlideAction(
      caption: 'ATUAÇÃO',
      color: Colors.yellowAccent[400],
      icon: Icons.list,
      onTap: () => atuacao(item.clienteId, context),
    ));
    // }
    return _actions;
  }

  Visibility _makeIniciar() {
    return Visibility(
      visible: item.iniciado == null,
      child: Column(
        children: <Widget>[
          // Row(
          //   children: <Widget>[
          //     Icon(
          //       Icons.accessibility,
          //       color: Colors.black,
          //       size: 18,
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.only(left: 3),
          //       child: Text(
          //         '${item.provar}',
          //         style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          //       ),
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.only(left: 3),
          //       child: Text(
          //         '${item.provarSemana}',
          //         style: TextStyle(fontSize: 11),
          //       ),
          //     ),
          //   ],
          // ),
          Row(
            children: <Widget>[
              Icon(
                // Icons.flip_to_back,
                Icons.play_circle_outline,
                color: Colors.black,
                size: 18,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 3),
                child: Text(
                  '${item.iniciar}',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 3),
                child: Text(
                  '${item.iniciarSemana}',
                  style: TextStyle(fontSize: 11),
                ),
              ),
            ],
          ), //
          Row(
            children: <Widget>[
              Icon(
                // Icons.flip_to_back,
                Icons.check_circle_outline,
                color: Colors.black,
                size: 18,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 3),
                child: Text(
                  '${item.finalizar}',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 3),
                child: Text(
                  '${item.finalizarSemana}',
                  style: TextStyle(fontSize: 11),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Visibility _makeFinalizar() {
    return Visibility(
      visible: (item.iniciado != null && item.finalizado == null),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                // Icons.flip_to_back,
                Icons.play_circle_outline,
                color: Colors.black,
                size: 18,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 3),
                child: Text(
                  '${item.iniciar}',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 3),
                child: Text(
                  '${item.iniciarSemana}',
                  style: TextStyle(fontSize: 11),
                ),
              ),
            ],
          ), //
          Row(
            children: <Widget>[
              Icon(
                Icons.play_circle_outline,
                color: Colors.blue,
                size: 18,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 3),
                child: Text(
                  '${item.iniciado}',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 3),
                child: Text(
                  '${item.iniciadoSemana}',
                  style: TextStyle(fontSize: 11, color: Colors.blue),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Icon(
                // Icons.flip_to_back,
                Icons.check_circle_outline,
                color: Colors.black,
                size: 18,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 3),
                child: Text(
                  '${item.finalizar}',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 3),
                child: Text(
                  '${item.finalizarSemana}',
                  style: TextStyle(fontSize: 11),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Visibility _makeFinalizado() {
    return Visibility(
      visible: (item.iniciado != null && item.finalizado != null),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                // Icons.flip_to_back,
                Icons.play_circle_outline,
                color: Colors.black,
                size: 18,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 3),
                child: Text(
                  '${item.iniciar}',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 3),
                child: Text(
                  '${item.iniciarSemana}',
                  style: TextStyle(fontSize: 11),
                ),
              ),
            ],
          ), //
          Row(
            children: <Widget>[
              Icon(
                Icons.play_circle_outline,
                color: Colors.blue,
                size: 18,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 3),
                child: Text(
                  '${item.iniciado}',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 3),
                child: Text(
                  '${item.iniciadoSemana}',
                  style: TextStyle(fontSize: 11, color: Colors.blue),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.check_circle_outline,
                color: Colors.black,
                size: 18,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 3),
                child: Text(
                  '${item.finalizar}',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 3),
                child: Text(
                  '${item.finalizarSemana}',
                  style: TextStyle(fontSize: 11),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Icon(
                // Icons.flip_to_back,
                Icons.check,
                color: Colors.green,
                size: 18,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 3),
                child: Text(
                  '${item.finalizado}',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 3),
                child: Text(
                  '${item.finalizadoSemana}',
                  style: TextStyle(fontSize: 11, color: Colors.green),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  atuacao(int clienteId, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) =>
            AtendimentoServicoInfoDialog(atendimentoServicoId: item.id),
        fullscreenDialog: true,
      ),
    );
  }

  Future mudarDataHora(
      AtendimentoServicoModel item, BuildContext context) async {
    DateTime _data;
    if (item.finalizado != null) {
      _data = DateFormat('dd/MM/yyyy HH:mm').parse(item.finalizado);
    } else if (item.iniciado != null) {
      _data = DateFormat('dd/MM/yyyy HH:mm').parse(item.iniciado);
    } else if (item.iniciar != null) {
      _data = DateFormat('dd/MM/yyyy HH:mm').parse(item.iniciar);
    }

    var date = await showDatePicker(
      context: context,
      initialDate: _data ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (date == null) return;
    var time = await showTimePicker(
        context: context,
        initialTime: _data != null
            ? TimeOfDay(hour: _data.hour, minute: _data.minute)
            : TimeOfDay(hour: 12, minute: 00));
    if (date != null && time != null) {
      if (item.finalizado != null) {
        await controller.finalizar(item, date, time);
      } else if (item.iniciado != null) {
        await controller.iniciar(item, date, time);
      } else if (item.iniciar != null) {
        await controller.inicio(item, date, time);
      }

      var dataDoCalendario =
          new DateFormat("yyyy-MM-dd").format(controller.selectedDay);
      await controller.obterServicos('tudo', 'date', dataDoCalendario);
    }
  }

  Future iniciar(AtendimentoServicoModel item, BuildContext context) async {
    var _data = DateFormat('dd/MM/yyyy HH:mm').parse(item.iniciar);
    var date = await showDatePicker(
      context: context,
      initialDate: _data ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (date == null) return;
    var time = await showTimePicker(
        context: context,
        initialTime: _data != null
            ? TimeOfDay(hour: _data.hour, minute: _data.minute)
            : TimeOfDay(hour: 12, minute: 00));
    if (date != null && time != null) {
      await controller.iniciar(item, date, time);
      //
      await controller.obterUltimosServicosDaEmpresaParaTela();
      await controller.montaDadosParaAgenda();
      await controller.obterServicos('tudo', 'date',
          DateFormat('yyyy-MM-dd').format(controller.selectedDay));
      //
    }
  }

  Future finalizar(AtendimentoServicoModel item, BuildContext context) async {
    var _data = DateFormat('dd/MM/yyyy HH:mm').parse(item.finalizar);
    var date = await showDatePicker(
      context: context,
      initialDate: _data ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (date == null) return;
    var time = await showTimePicker(
        context: context,
        initialTime: _data != null
            ? TimeOfDay(hour: _data.hour, minute: _data.minute)
            : TimeOfDay(hour: 12, minute: 00));
    if (date != null && time != null) {
      await controller.finalizar(item, date, time);
      //
      await controller.obterUltimosServicosDaEmpresaParaTela();
      await controller.montaDadosParaAgenda();
      await controller.obterServicos('tudo', 'date',
          DateFormat('yyyy-MM-dd').format(controller.selectedDay));
      //
    }
  }

  Future arquivar(int id) async {
    await controller.arquivar(item.id);
    //
    await controller.obterUltimosServicosDaEmpresaParaTela();
    await controller.montaDadosParaAgenda();
    await controller.obterServicos('tudo', 'date',
        DateFormat('yyyy-MM-dd').format(controller.selectedDay));
    //
    Get.back();
  }

  void cancelar(int id) async {
    await controller.cancelar(id);
    //
    await controller.obterUltimosServicosDaEmpresaParaTela();
    await controller.montaDadosParaAgenda();
    await controller.obterServicos('tudo', 'date',
        DateFormat('yyyy-MM-dd').format(controller.selectedDay));
    //
    Get.back();
  }

  void confirmarAcao(BuildContext context, String acao, String msg, int id) {
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
          case 'CANCELAR':
            cancelar(id);
            break;
          case 'ARQUIVAR':
            arquivar(id);
            break;
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

  // delegar(UsuarioConsultaModel item) {
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
  // }

  exibirAtendimentoServico(BuildContext context) async {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) =>
            AtendimentoServicoResumoDialog(item: item),
        fullscreenDialog: true,
      ),
    );

//   //Get.toNamed('/colaborador', arguments: {'login': item.login});
//   UsuarioRepository usuarioRepository = new UsuarioRepository();
//   await usuarioRepository.addLoginParam(item.login);
//   Get.toNamed('/colaborador', arguments: {'login': item.login});
//   //Get.toNamed('/colaborador');

//   if (await controller.obterLiderados(item.id)) {
//    if (controller.usuariosLiderados?.length == 0) {
//      //SnackBarUtils.showSnackBar(
//      //    'Colaborador', 'Puxa vida! ${item.pessoa} não é lider.');
//      return;
//    }
//    Get.defaultDialog(
//      title: 'Colaboradores liderados por ${item.pessoa}',
//      content: Column(children: <Widget>[
//        Expanded(
//            child: ListView.builder(
//          itemBuilder: (_, index) => ColaboradorItemLiderados(item,
//              candidatoLider: controller.usuariosLiderados[index],
//              colaboradorAnterior: colaboradorAnterior,
//              controller: controller),
//          itemCount: controller.usuariosLiderados?.length ?? 0,
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
//   }
// }

// Future definirAcessos(UsuarioConsultaModel usuario) async {
//  return Get.toNamed('/acessos_usuario', arguments: {'usuario': usuario});
// }

// Future<void> delegarColaborador(UsuarioConsultaModel pessoaSendoDelegada,
//    UsuarioConsultaModel novoLider) async {
//  final repository = new UsuarioRepository();
//  await repository.delegarColaborador(pessoaSendoDelegada, novoLider);
//  //controller.defineProprietarioComoLoginParam();
//  //controller.obterDadosUsuario();
//  //controller.obterDados();
//  controller.obterDadosParaListaEquipe();
//  Get.back();
//  //Get.back();
  }

  Widget _makeTags(String tagsItem) {
    GlobalKey<TagsState> globalKeyTag = GlobalKey<TagsState>();
    final atendimentoServicoController =
        GetIt.I.get<AtendimentoServicoController>();
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
                  atendimentoServicoController.filter.length == 0 ||
                          atendimentoServicoController.filter != i.title
                      ? atendimentoServicoController.filter = i.title
                      : atendimentoServicoController.filter = '',
            );
          },
        ),
      ),
    );
  }
}
