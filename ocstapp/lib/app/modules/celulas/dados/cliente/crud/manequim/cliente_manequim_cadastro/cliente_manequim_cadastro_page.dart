import 'package:OCSTApp/app/components/app_flat_button.dart';
import 'package:OCSTApp/app/components/app_text_form_field.dart';
import 'package:OCSTApp/app/core/store_state.dart';
import 'package:OCSTApp/app/mixins/loader_mixin.dart';
import 'package:OCSTApp/app/models/cliente_manequim_model.dart';
import 'package:OCSTApp/app/modules/celulas/dados/cliente/crud/manequim/cliente_manequim_cadastro/cliente_manequim_cadastro_controller.dart';
import 'package:OCSTApp/app/utils/size_utils.dart';
import 'package:OCSTApp/app/utils/snackbar_utils.dart';
import 'package:OCSTApp/app/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

class ClienteManequimCadastroPage extends StatefulWidget {
  final String title;
  const ClienteManequimCadastroPage({Key key, this.title = "Cadastro"})
      : super(key: key);

  @override
  _ClienteManequimCadastroPageState createState() =>
      _ClienteManequimCadastroPageState();
}

class _ClienteManequimCadastroPageState extends ModularState<
    ClienteManequimCadastroPage,
    ClienteManequimCadastroController> with LoaderMixin {
  //use 'controller' variable to access controller

  // List<ReactionDisposer> _disposer;
  AppBar appBar = AppBar(
    elevation: 0,
    title: Text('Cadastro'),
  );

  ClienteManequimModel item;
  // var ClienteManequimCadastroController =
  //     GetIt.I.get<ClienteManequimCadastroController>();

  // @override
  // void initState() {
  //   super.initState();
  //   _popularVarComDadosDoParametro();
  //   _disposer ??= [
  //     reaction((_) => controller.state, (StoreState state) {
  //       if (state == StoreState.initial) {
  //         showLoader();
  //       } else if (state == StoreState.loading) {
  //         showLoader();
  //       } else if (state == StoreState.loaded) {
  //         hideLoader();
  //         Get.back();
  //       }
  //     }),
  //     reaction((_) => controller.errorMessage, (String errorMessage) {
  //       if (errorMessage.trim().length > 0) {
  //         SnackBarUtils.showSnackBar('Problemas', errorMessage);
  //         print('PROBLEMAS: [$errorMessage]');
  //       }
  //     }),
  //   ];
  // }

  @override
  void dispose() {
    super.dispose();
    // _disposer.forEach((d) => d());
    // GetIt.I.unregister<ClienteManequimModel>();
  }

  @override
  Widget build(BuildContext context) {
    _popularVarComDadosDoParametro();
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
              'assets/images/dds-cliente-manequim.png',
            ),
          ),
          Positioned(
            bottom: 28,
            child: Text(
              'Cadastre o Manequim do Cliente',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            bottom: 12,
            child: Text(
              '(apenas um por dia)',
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
              label: 'Busto',
              keyboardType: TextInputType.number,
              controller: controller.controllerMaskBusto,
              icon: Icons.content_cut,
              onChanged: (String valor) => controller.changeBusto(valor),
              validator: (String valor) {
                if (double.parse(valor.replaceAll(',', '.')) <= 0) {
                  return 'Obrigatório';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            AppTextFormField(
              label: 'Cintura',
              keyboardType: TextInputType.number,
              controller: controller.controllerMaskCintura,
              icon: Icons.content_cut,
              onChanged: (String valor) => controller.changeCintura(valor),
              validator: (String valor) {
                if (double.parse(valor.replaceAll(',', '.')) <= 0) {
                  return 'Obrigatório';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            AppTextFormField(
              label: 'Quadril',
              keyboardType: TextInputType.number,
              controller: controller.controllerMaskQuadril,
              icon: Icons.content_cut,
              onChanged: (String valor) => controller.changeQuadril(valor),
              validator: (String valor) {
                if (double.parse(valor.replaceAll(',', '.')) <= 0) {
                  return 'Obrigatório';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            AppTextFormField(
              label: 'Observação',
              initialValue:
                  controller.observacao == null ? '' : controller.observacao,
              keyboardType: TextInputType.text,
              icon: Icons.note,
              onChanged: (String valor) => controller.changeObservacao(valor),
              validator: (String valor) {
                if (valor.trim().isEmpty ||
                    valor.trim().length != valor.length) {
                  return 'Obrigatório, sem espaços antes e depois';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            AppFlatButton(
              label: 'Gravar',
              onPressed: () => gravar(),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  gravar() async {
    if (await controller.gravar()) {
      Get.back();
      Get.back();
    }
  }

  _popularVarComDadosDoParametro() {
    final clienteId = Get.args(context)['clienteId'];
    controller.clienteId = clienteId;
    return clienteId;
  }
}
