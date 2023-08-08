import 'package:OCSTApp/app/components/app_flat_button.dart';
import 'package:OCSTApp/app/components/app_text_form_field.dart';
import 'package:OCSTApp/app/mixins/loader_mixin.dart';
import 'package:OCSTApp/app/models/cliente_veiculo_model.dart';
import 'package:OCSTApp/app/modules/celulas/dados/cliente/crud/veiculo/cliente_veiculo_cadastro/cliente_veiculo_cadastro_controller.dart';
import 'package:OCSTApp/app/utils/size_utils.dart';
import 'package:OCSTApp/app/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';

class ClienteVeiculoCadastroPage extends StatefulWidget {
  final String title;
  const ClienteVeiculoCadastroPage({Key key, this.title = "Cadastro"})
      : super(key: key);

  @override
  _ClienteVeiculoCadastroPageState createState() =>
      _ClienteVeiculoCadastroPageState();
}

class _ClienteVeiculoCadastroPageState extends ModularState<
    ClienteVeiculoCadastroPage,
    ClienteVeiculoCadastroController> with LoaderMixin {
  //use 'controller' variable to access controller

  // List<ReactionDisposer> _disposer;
  AppBar appBar = AppBar(
    elevation: 0,
    title: Text('Cadastro'),
  );

  ClienteVeiculoModel item;
  // var ClienteVeiculoCadastroController =
  //     GetIt.I.get<ClienteVeiculoCadastroController>();

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
    // GetIt.I.unregister<ClienteVeiculoModel>();
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
              'assets/images/dds-cliente-veiculo.png',
            ),
          ),
          Positioned(
            bottom: 28,
            child: Text(
              'Cadastre o Veículo do Cliente',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            bottom: 12,
            child: Text(
              '(pode ter mais de um)',
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
              label: 'Marca',
              keyboardType: TextInputType.text,
              // controller: controller.controllerMaskBusto,
              icon: Icons.directions_car,
              onChanged: (String valor) => controller.changeMarca(valor),
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
              label: 'Modelo',
              keyboardType: TextInputType.text,
              // controller: controller.controllerMaskCintura,
              icon: Icons.info_outline,
              onChanged: (String valor) => controller.changeModelo(valor),
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
              label: 'Ano',
              keyboardType: TextInputType.number,
              // controller: controller.controllerMaskQuadril,
              icon: Icons.date_range,
              onChanged: (String valor) => controller.changeAno(valor),
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
              label: 'Cor',
              keyboardType: TextInputType.text,
              // controller: controller.controllerMaskQuadril,
              icon: Icons.color_lens,
              onChanged: (String valor) => controller.changeCor(valor),
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
              label: 'Placa',
              keyboardType: TextInputType.text,
              // controller: controller.controllerMaskQuadril,
              icon: Icons.credit_card,
              onChanged: (String valor) => controller.changePlaca(valor),
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
