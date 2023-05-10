import 'package:OCSTApp/app/models/usuario_consulta_model.dart';
import 'package:OCSTApp/app/modules/celulas/app_gerenciar/colaborador/colaborador_controller.dart';
import 'package:OCSTApp/app/repositories/usuario_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class EquipeProprietario extends StatelessWidget {
  //final UsuarioConsultaModel pessoaSendoDelegada;
  final UsuarioConsultaModel membroEquipe;
  //final UsuarioConsultaModel colaboradorAnterior;
  final UsuarioRepository repository;
  final ColaboradorController controller;

  const EquipeProprietario(
      //this.pessoaSendoDelegada,
      {Key key,
      this.membroEquipe,
      //this.colaboradorAnterior,
      this.repository,
      this.controller})
      : super(key: key);

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
                  image: membroEquipe.qtdeFilhos > 0
                      ? AssetImage('assets/images/grc-lider.png')
                      : AssetImage('assets/images/grc-colaborador.png'),
                  height: 320,
                ),
              ),
              title: Text(
                membroEquipe.pessoa,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
              subtitle: Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '${membroEquipe.email.toLowerCase()}',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.normal),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            '${membroEquipe.login}',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          Visibility(
                            visible: membroEquipe.ativo == 'N',
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                '[SEM ACESSO]',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.red),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Visibility(
                    visible: membroEquipe.qtdeFilhos > 0,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          Icons.people,
                          color: Colors.black,
                          size: 18,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Text(
                            '${membroEquipe.qtdeFilhos}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: membroEquipe.ativo == 'N',
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          Icons.block,
                          color: Colors.red,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              //onTap: () => exibirLiderados(item),
              //onLongPress: () => delegar(item),
            ),
          ),
          //actions: <Widget>[
          //  IconSlideAction(
          //    caption: 'DELEGAR',
          //    color: Colors.green,
          //    icon: Icons.group,
          //    //onTap: () => delegar(item),
          //  ),
          //],
          //secondaryActions: <Widget>[
          //  //IconSlideAction(
          //  //  caption: 'OPCAO3',
          //  //  color: Colors.black45,
          //  //  icon: Icons.more_horiz,
          //  //  onTap: () => SnackBarUtils.showSnackBar('Mensagem', ''),
          //  //),
          //  IconSlideAction(
          //    caption: 'APAGAR',
          //    color: Colors.red,
          //    icon: Icons.delete_outline,
          //    //onTap: () => confirmarAcao(context, 'APAGAR',
          //    //    'Vou apagar ${item.pessoa}. Posso?', item.login),
          //  ),
          //],
        ),
      ],
    );
  }

  //Future<void> delegarColaborador(UsuarioConsultaModel pessoaSendoDelegada,
  //    UsuarioConsultaModel novoLider) async {
  //  final repository = new UsuarioRepository();
  //  await repository.delegarColaborador(pessoaSendoDelegada, novoLider);
  //  controller.obterDados();
  //}

  //void confirmarAcao(
  //    BuildContext context,
  //    String acao,
  //    String msg,
  //    UsuarioConsultaModel pessoaSendoDelegada,
  //    UsuarioConsultaModel novoLider) {
  //  Widget naoButton = FlatButton(
  //    child: Text("Não"),
  //    onPressed: () {
  //      Get.back();
  //    },
  //  );
  //  Widget simButton = FlatButton(
  //    child: Text("Sim"),
  //    onPressed: () {
  //      switch (acao) {
  //        case 'LIBERAR':
  //          delegarColaborador(pessoaSendoDelegada, colaboradorAnterior);
  //          Get.back(); //Lista de Novos Lideres
  //          Get.back(); //Lista de Colaboradores, agora sem a pessoa delegada.
  //          break;
  //        default:
  //      }
  //    },
  //  );
  //  AlertDialog alert = AlertDialog(
  //    title: Text("Atenção"),
  //    content: Text(msg),
  //    actions: [
  //      naoButton,
  //      simButton,
  //    ],
  //  );
  //  showDialog(
  //    context: context,
  //    builder: (BuildContext context) {
  //      return alert;
  //    },
  //  );
  //}

  //exibirLiderados(UsuarioConsultaModel item) async {
  //  if (await controller.obterLiderados(item.id)) {
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
  //              membroEquipe: controller.usuariosLiderados[index],
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
  //  }
  //}
}
