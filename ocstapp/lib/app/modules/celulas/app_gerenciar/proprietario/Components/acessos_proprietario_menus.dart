import 'package:OCSTApp/app/models/menu_model.dart';
import 'package:OCSTApp/app/models/usuario_consulta_model.dart';
import 'package:OCSTApp/app/modules/usuarios/acesso_usuario/acesso_usuario_controller.dart';
import 'package:OCSTApp/app/repositories/usuario_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class AcessoProprietarioMenus extends StatelessWidget {
  final MenuModel item;
  final UsuarioConsultaModel usuario;
  final UsuarioRepository repository;
  final AcessoUsuarioController controller;

  const AcessoProprietarioMenus({
    Key key,
    this.item,
    this.usuario,
    this.repository,
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
                  image: AssetImage('${item.menuFigura}'),
                  height: 320,
                ),
              ),
              title: Text(
                item.menuNome,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
              subtitle: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '${item.menuDescricao}',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.normal),
                        ),
                        Text(
                          item.menuPai == 'DDS'
                              ? 'DADOS'
                              : item.menuPai == 'OPR'
                                  ? 'OPERACIONAL'
                                  : item.menuPai == 'RLT' ? 'RELATÓRIO' : '',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
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
              //onTap: () => exibirLiderados(item),
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
            //  caption: 'BLOQUEAR',
            //  color: Colors.red,
            //  icon: Icons.block,
            //  onTap: () => confirmarAcao(
            //      context,
            //      'BLOQUEARACESSO',
            //      'Vou bloquear o acesso de ${usuario.pessoa} ao Módulo ${item.menuNome}. Posso?',
            //      controller.usuarioAlvo.login,
            //      usuario.id,
            //      item.idMenu),
            //),
          ],
        )
      ],
    );
  }

  //Future editar(UsuarioConsultaModel item) async {
  //  return Get.toNamed('/colaborador_editar', arguments: {'item': item});
  //}

  //void apagar(String login) async {
  //  final repository = new UsuarioRepository();
  //  await repository.apagarUsuarioPorLogin(login);
  //  //controller.obterDados();
  //  Get.back();
  //}

  //void bloquearAcessoAoMenu(int idUsuario, int idMenu) async {
  //  final repository = new UsuarioRepository();
  //  await repository.bloquearAcessoAoMenu(idUsuario, idMenu);
  //  controller.obterAcessosUsuario(usuario.login);
  //}

  //void confirmarAcao(BuildContext context, String acao, String msg,
  //    String login, int idUsuario, int idMenu) {
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
  //        case 'APAGAR':
  //          apagar(login);
  //          break;
  //        case 'BLOQUEARACESSO':
  //          bloquearAcessoAoMenu(idUsuario, idMenu);
  //          Get.back();
  //          break;
  //        //case 'DELEGAR':
  //        //  //apagar(login);
  //        //  break;
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

  //delegar(UsuarioConsultaModel item) {
  //  if (controller.usuarios.length <= 1) {
  //    SnackBarUtils.showSnackBar('Puxa vida!',
  //        'Preciso de ao menos 2 Colaboradores para definir Hierarquia entre eles.');
  //  } else {
  //    //Get.defaultDialog(
  //    //  title: '${item.pessoa} vai trabalhar para quem?',
  //    //  content: Column(children: <Widget>[
  //    //    Expanded(
  //    //        child: ListView.builder(
  //    //      itemBuilder: (_, index) => ColaboradorItemDelegar(item,
  //    //          candidatoLider: controller.usuarios[index],
  //    //          controller: controller),
  //    //      itemCount: controller.usuarios?.length ?? 0,
  //    //    ))
  //    //  ]),
  //    //  cancel: FlatButton(
  //    //    onPressed: () => Get.back(),
  //    //    child: Text(
  //    //      'Fechar',
  //    //      style: TextStyle(color: ThemeUtils.primaryColor, fontSize: 20),
  //    //    ),
  //    //  ),
  //    //);
  //  }
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
  //  }
  //}
}
