import 'package:OCSTApp/app/components/app_button.dart';
import 'package:OCSTApp/app/components/app_flat_button.dart';
import 'package:OCSTApp/app/components/app_text_form_field.dart';
import 'package:OCSTApp/app/core/store_state.dart';
import 'package:OCSTApp/app/mixins/loader_mixin.dart';
import 'package:OCSTApp/app/utils/size_utils.dart';
import 'package:OCSTApp/app/utils/snackbar_utils.dart';
import 'package:OCSTApp/app/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
import 'colaborador_cadastro_controller.dart';

class ColaboradorCadastroPage extends StatefulWidget {
  final String title;
  const ColaboradorCadastroPage({Key key, this.title = "Cadastro"})
      : super(key: key);

  @override
  _ColaboradorCadastroPageState createState() =>
      _ColaboradorCadastroPageState();
}

class _ColaboradorCadastroPageState
    extends ModularState<ColaboradorCadastroPage, ColaboradorCadastroController>
    with LoaderMixin {
  //use 'controller' variable to access controller

  List<ReactionDisposer> _disposer;
  AppBar appBar = AppBar(
    elevation: 0,
    title: Text('Cadastro'),
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
          //hideLoader();
        }
      })
    ];
  }

  @override
  void dispose() {
    super.dispose();
    _disposer.forEach((d) => d());
  }

  @override
  Widget build(BuildContext context) {
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
              'assets/images/grc-colaborador-cadastrar.png',
            ),
          ),
          Positioned(
            bottom: 28,
            child: Text(
              'Monte sua Equipe',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            bottom: 12,
            child: Text(
              '(e-mail do colaborador ou da sua empresa)',
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
    return Form(
      key: controller.globalKeyCad,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            AppTextFormField(
              label: 'Nome do Colaborador',
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
              label: 'Login (ex.: jose123)',
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
              label: 'Email do Colaborador',
              keyboardType: TextInputType.emailAddress,
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
            AppTextFormField(
              label: 'Senha do Colaborador',
              icon: Icons.lock_outline,
              onChanged: (String valor) => controller.changeSenha(valor.trim()),
              validator: (String valor) {
                if (valor.trim().isEmpty ||
                    valor.trim().length != valor.length ||
                    valor.trim().length != valor.replaceAll(' ', '').length) {
                  return 'Obrigatório, letras e números sem espaços';
                }
                return null;
              },
              obscureText: true,
            ),
            SizedBox(height: 10),
            AppTextFormField(
                label: 'Confirme a senha',
                icon: Icons.lock_outline,
                onChanged: (String valor) =>
                    controller.changeConfirmaSenha(valor.trim()),
                validator: (String valor) {
                  if (valor.trim().isEmpty ||
                      valor.trim().length != valor.length ||
                      valor.trim().length != valor.replaceAll(' ', '').length) {
                    return 'Obrigatório, letras e números sem espaços';
                  }
                  if (valor.isNotEmpty && controller.senha.isNotEmpty) {
                    if (valor != controller.senha) {
                      return 'Obrigatório, senhas devem ser iguais';
                    }
                  }
                  return null;
                },
                obscureText: true),
            SizedBox(height: 10),
            AppFlatButton(
              label: 'Gravar',
              onPressed: () => controller.salvarColaborador(),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
