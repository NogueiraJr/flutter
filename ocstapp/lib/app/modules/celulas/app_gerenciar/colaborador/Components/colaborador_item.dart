import 'package:OCSTApp/app/models/usuario_consulta_model.dart';
import 'package:OCSTApp/app/modules/celulas/app_gerenciar/colaborador/Components/colaborador_item_delegar.dart';
import 'package:OCSTApp/app/modules/celulas/app_gerenciar/colaborador/colaborador_controller.dart';
import 'package:OCSTApp/app/repositories/usuario_repository.dart';
import 'package:OCSTApp/app/utils/size_utils.dart';
import 'package:OCSTApp/app/utils/snackbar_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class ColaboradorItem extends StatelessWidget {
  final UsuarioConsultaModel item;
  final UsuarioConsultaModel colaboradorAnterior;
  final UsuarioRepository repository;
  final ColaboradorController controller;
  final UsuarioConsultaModel candidatoLider;

  const ColaboradorItem(
      {Key key,
      this.item,
      this.colaboradorAnterior,
      this.repository,
      this.controller,
      this.candidatoLider})
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
                  image: item.qtdeFilhos > 0
                      ? AssetImage('assets/images/grc-lider.png')
                      : AssetImage('assets/images/grc-colaborador.png'),
                  height: 320,
                ),
              ),
              title: Text(
                item.pessoa,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
              subtitle: Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '${item.email.toLowerCase()}',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.normal),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            '${item.login}',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          Visibility(
                            visible: item.ativo == 'N',
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
                    visible: item.qtdeFilhos > 0,
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
                            '${item.qtdeFilhos}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: item.ativo == 'N',
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
              onTap: () => exibirLiderados(item),
              onLongPress: () => delegar(item),
            ),
          ),
          actions: <Widget>[
            IconSlideAction(
              caption: 'EDITAR',
              color: Colors.green,
              icon: Icons.edit,
              onTap: () => editar(item),
            ),
            IconSlideAction(
              caption: 'ACESSOS',
              color: Colors.yellow[700],
              icon: Icons.lock,
              //onTap: () => SnackBarUtils.showSnackBar('Mensagem', ''),
              //onTap: () => Get.offAllNamed(item.menuRef),
              onTap: () => definirAcessos(item),
            ),
          ],
          secondaryActions: <Widget>[
            IconSlideAction(
              caption: 'LIBERAR',
              color: Colors.blue,
              icon: Icons.perm_identity,
              onTap: () => confirmarAcao(
                  context,
                  'LIBERAR',
                  'Vou LIBERAR ${item.pessoa} da Liderança atual. Posso?',
                  item.login,
                  item,
                  candidatoLider),
            ),
            IconSlideAction(
                caption: 'APAGAR',
                color: Colors.red,
                icon: Icons.delete_outline,
                onTap: () => confirmarAcao(
                    context,
                    'APAGAR',
                    'Vou apagar ${item.pessoa}. Posso?',
                    item.login,
                    null,
                    null)),
          ],
        )
      ],
    );
  }

  Future editar(UsuarioConsultaModel item) async {
    return Get.toNamed('/colaborador_editar', arguments: {'item': item});
  }

  void apagar(String login) async {
    final repository = new UsuarioRepository();
    await repository.apagarUsuarioPorLogin(login);
    controller.obterDados();
    Get.back();
  }

  void confirmarAcao(
      BuildContext context,
      String acao,
      String msg,
      String login,
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
            apagar(login);
            break;
          case 'LIBERAR':
            delegarColaborador(pessoaSendoDelegada, novoLider);
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

  delegar(UsuarioConsultaModel item) {
    if (controller.usuarios.length <= 1) {
      SnackBarUtils.showSnackBar('Puxa vida!',
          'Preciso de ao menos 2 Colaboradores para definir Hierarquia entre eles.');
    } else {
      Get.defaultDialog(
        title: '${item.pessoa} vai trabalhar para quem?',
        content: Container(
          width: SizeUtils.widthScreen * .8,
          height: SizeUtils.heightScreen * .8,
          child: Column(
            children: <Widget>[
              //Text(
              //  'Seu Grupo',
              //  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              //),
              Expanded(
                  child: ListView.builder(
                itemBuilder: (_, index) => ColaboradorItemDelegar(item,
                    candidatoLider: controller.usuarios[index],
                    controller: controller),
                itemCount: controller.usuarios?.length ?? 0,
              ))
            ],
          ),
        ),
        cancel: FlatButton(
          onPressed: () => Get.back(),
          child: Text(
            'Fechar',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
      );
    }
  }

  exibirLiderados(UsuarioConsultaModel item) async {
    //Get.toNamed('/colaborador', arguments: {'login': item.login});
    UsuarioRepository usuarioRepository = new UsuarioRepository();
    await usuarioRepository.addLoginParam(item.login);
    Get.toNamed('/colaborador', arguments: {'login': item.login});
    //Get.toNamed('/colaborador');

  }

  Future definirAcessos(UsuarioConsultaModel usuario) async {
    return Get.toNamed('/acessos_usuario', arguments: {'usuario': usuario});
  }

  Future<void> delegarColaborador(UsuarioConsultaModel pessoaSendoDelegada,
      UsuarioConsultaModel novoLider) async {
    final repository = new UsuarioRepository();
    await repository.delegarColaborador(pessoaSendoDelegada, novoLider);
    //controller.defineProprietarioComoLoginParam();
    //controller.obterDadosUsuario();
    //controller.obterDados();
    controller.obterDadosParaListaEquipe();
    Get.back();
    //Get.back();
  }
}
