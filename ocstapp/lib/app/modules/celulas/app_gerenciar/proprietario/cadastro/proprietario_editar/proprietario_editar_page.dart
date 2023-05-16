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
import 'proprietario_editar_controller.dart';

class ProprietarioEditarPage extends StatefulWidget {
  final String title;
  final UsuarioConsultaModel usuario;

  const ProprietarioEditarPage(
      {Key key, this.title = "Editar Você", this.usuario})
      : super(key: key);

  @override
  _ProprietarioEditarPageState createState() => _ProprietarioEditarPageState();
}

class _ProprietarioEditarPageState
    extends ModularState<ProprietarioEditarPage, ProprietarioEditarController>
    with LoaderMixin {
  //use 'controller' variable to access controller

  List<ReactionDisposer> _disposer;
  AppBar appBar = AppBar(
    elevation: 0,
    title: Text('Editar Você'),
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
              'assets/images/grc-proprietario.png',
            ),
          ),
          Positioned(
            bottom: 28,
            child: Text(
              'Altere os seus dados',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            bottom: 12,
            child: Text(
              '(sempre use o seu melhor e-mail)',
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
    var usuario = popularVarComDadosDoParametro();
    return Form(
      key: controller.globalKeyAlt,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            AppTextFormField(
              label: 'Nome',
              initialValue: usuario == null ? 'N/C' : usuario.pessoa,
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
              label: 'Seu Negócio ou Empresa',
              initialValue: usuario == null ? 'N/C' : usuario.empresa,
              icon: Icons.store,
              onChanged: (String valor) => controller.changeEmpresa(valor),
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
              initialValue: usuario == null ? 'N/C' : usuario.login,
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
              initialValue: usuario == null
                  ? 'N/C'
                  : usuario.email.toString().toLowerCase(),
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
              onPressed: () => controller.gravar(usuario),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  popularVarComDadosDoParametro() {
    final usuario = Get.args(context)['usuario'];
    controller.id = usuario.id;
    controller.login = usuario.login;
    controller.loginAnterior = usuario.login;
    controller.pessoa = usuario.pessoa;
    controller.empresa = usuario.empresa;
    controller.email = usuario.email.toString().toLowerCase();
    return usuario;
  }
}
