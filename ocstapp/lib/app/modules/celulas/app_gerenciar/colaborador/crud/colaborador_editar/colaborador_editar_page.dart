import 'package:OCSTApp/app/components/app_button.dart';
import 'package:OCSTApp/app/components/app_flat_button.dart';
import 'package:OCSTApp/app/components/app_text_form_field.dart';
import 'package:OCSTApp/app/core/store_state.dart';
import 'package:OCSTApp/app/mixins/loader_mixin.dart';
import 'package:OCSTApp/app/models/usuario_consulta_model.dart';
import 'package:OCSTApp/app/utils/size_utils.dart';
import 'package:OCSTApp/app/utils/snackbar_utils.dart';
import 'package:OCSTApp/app/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
import 'colaborador_editar_controller.dart';

class ColaboradorEditarPage extends StatefulWidget {
  final String title;
  final UsuarioConsultaModel item;

  const ColaboradorEditarPage({
    Key key,
    this.title = "Editar Colaborador",
    this.item,
  }) : super(key: key);

  @override
  _ColaboradorEditarPageState createState() => _ColaboradorEditarPageState();
}

class _ColaboradorEditarPageState
    extends ModularState<ColaboradorEditarPage, ColaboradorEditarController>
    with LoaderMixin {
  //use 'controller' variable to access controller

  List<ReactionDisposer> _disposer;
  AppBar appBar = AppBar(
    elevation: 0,
    title: Text('Editar Colaborador'),
  );

  @override
  void initState() {
    super.initState();

    _disposer ??= [
      reaction((_) => controller.state, (StoreState state) {
        if (state == StoreState.initial) {
          showLoader();
        } else if (state == StoreState.loading) {
          showLoader();
        } else if (state == StoreState.loaded) {
          hideLoader();
          Get.back();
        }
      }),
      reaction((_) => controller.errorMessage, (String errorMessage) {
        if (errorMessage.trim().length > 0) {
          SnackBarUtils.showSnackBar('Problemas', errorMessage);
          print('PROBLEMAS: [$errorMessage]');
        }
      }),
    ];
  }

  @override
  void dispose() {
    super.dispose();
    _disposer.forEach((d) => d());
  }

  @override
  Widget build(BuildContext context) {
    //controller.obterDadosDoColaboradorEditando();
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _makeHeader(),
            SizedBox(height: 10),
            _makeForm(),
          ],
        ),
      ),
    );
  }

  Widget _makeHeader() {
    return Container(
      decoration: BoxDecoration(
        color: ThemeUtils.primaryColor,
        border: Border(bottom: BorderSide(width: 1, color: Colors.black12)),
      ),
      height: (SizeUtils.heightScreen * .35) - SizeUtils.statusBarHeight,
      width: SizeUtils.widthScreen * 2,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            height: SizeUtils.heightScreen * .18,
            bottom: 70,
            child: Image.asset(
              'assets/images/grc-colaborador-editar.png',
            ),
          ),
          Positioned(
            bottom: 28,
            child: Text(
              'Altere os dados',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            bottom: 12,
            child: Text(
              '(e-mail do colaborador ou da empresa)',
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Form _makeForm() {
    var item = popularVarComDadosDoParametro();
    return Form(
      key: controller.globalKeyAlt,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            AppTextFormField(
              label: 'Nome',
              initialValue: item == null ? 'N/C' : item.pessoa,
              icon: Icons.face,
              onChanged: (String valor) => controller.changePessoa(valor),
              validator: (String valor) {
                if (valor.trim().isEmpty ||
                    valor.trim().length != valor.length) {
                  return 'Obrigatório, sem espaços antes e depois';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            AppTextFormField(
              label: 'Login',
              initialValue: item == null ? 'N/C' : item.login,
              icon: Icons.account_circle,
              onChanged: (String valor) => controller.changeLogin(valor.trim()),
              validator: (String valor) {
                if (valor.trim().isEmpty ||
                    valor.trim().length != valor.length ||
                    valor.trim().length != valor.replaceAll(' ', '').length) {
                  return 'Obrigatório, letras e números sem espaços';
                }
                return null;
              },
              apenasLetrasNumeros: true,
            ),
            SizedBox(height: 10),
            AppTextFormField(
              label: 'Email',
              keyboardType: TextInputType.emailAddress,
              initialValue:
                  item == null ? 'N/C' : item.email.toString().toLowerCase(),
              icon: Icons.email,
              onChanged: (String valor) => controller.changeEmail(valor.trim()),
              validator: (String valor) {
                if (valor.trim().isEmpty ||
                    valor.trim().length != valor.length ||
                    valor.trim().length != valor.replaceAll(' ', '').length) {
                  return 'Obrigatório, letras e números sem espaços';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            AppFlatButton(
              label: 'Gravar',
              onPressed: () => controller.gravar(item),
            ),
            SizedBox(height: 10),
            AppFlatButton(
              label: 'Bloqueio',
              color: Colors.red[300],
              onPressed: () => confirmarAcao(
                context,
                'BLOQUEIO',
                item.ativo == 'S'
                    ? 'Vou BLOQUEAR o acesso de ${item.pessoa} no App inteiro. Posso?'
                    : 'Vou DESBLOQUEAR o acesso de ${item.pessoa} no App inteiro. Posso?',
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  void confirmarAcao(
    BuildContext context,
    String acao,
    String msg,
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
          case 'BLOQUEIO':
            tratarBloqueioColaborador();
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

  Future tratarBloqueioColaborador() async {
    final msg = await controller.bloqueioAcessoColaborador();
    SnackBarUtils.showSnackBar('Atenção', msg);
    Get.back();
    Get.back();
  }

  popularVarComDadosDoParametro() {
    final item = Get.args(context)['item'];
    controller.id = item.id;
    controller.login = item.login;
    controller.loginAnterior = item.login;
    controller.pessoa = item.pessoa;
    controller.email = item.email.toString().toLowerCase();
    return item;
  }
}
