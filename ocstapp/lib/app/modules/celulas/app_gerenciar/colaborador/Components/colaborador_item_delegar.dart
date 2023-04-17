import 'package:OCSTApp/app/models/usuario_consulta_model.dart';
import 'package:OCSTApp/app/modules/celulas/app_gerenciar/colaborador/colaborador_controller.dart';
import 'package:OCSTApp/app/repositories/usuario_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class ColaboradorItemDelegar extends StatelessWidget {
  final UsuarioConsultaModel pessoaSendoDelegada;
  final UsuarioConsultaModel candidatoLider;
  final UsuarioRepository repository;
  final ColaboradorController controller;

  const ColaboradorItemDelegar(this.pessoaSendoDelegada,
      {Key key, this.candidatoLider, this.repository, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Visibility(
          visible: candidatoLider.id != pessoaSendoDelegada.id,
          child: Slidable(
            actionPane: SlidableBehindActionPane(),
            actionExtentRatio: 0.25,
            child: Container(
              color: Colors.white,
              child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    maxRadius: 20,
                    child: Image(
                      image: candidatoLider.qtdeFilhos > 0
                          ? AssetImage('assets/images/grc-lider.png')
                          : AssetImage('assets/images/grc-colaborador.png'),
                      height: 370,
                    ),
                  ),
                  title: Text(
                    candidatoLider.pessoa,
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '${candidatoLider.login}',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  onTap: () => confirmarAcao(
                      context,
                      'DELEGARPARA',
                      'Vou colocar ${pessoaSendoDelegada.pessoa} aos cuidados de ${candidatoLider.pessoa}. Posso?',
                      pessoaSendoDelegada,
                      candidatoLider)),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> delegarColaborador(UsuarioConsultaModel pessoaSendoDelegada,
      UsuarioConsultaModel novoLider) async {
    final repository = new UsuarioRepository();
    await repository.delegarColaborador(pessoaSendoDelegada, novoLider);
    //controller.obterDados();
    controller.obterDadosParaListaEquipe();
  }

  void confirmarAcao(
      BuildContext context,
      String acao,
      String msg,
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
          case 'DELEGARPARA':
            delegarColaborador(pessoaSendoDelegada, novoLider);
            Get.back(); //Lista de Novos Lideres
            Get.back(); //Lista de Colaboradores, agora sem a pessoa delegada.
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
}
