import 'package:OCSTApp/app/components/app_flat_button.dart';
import 'package:OCSTApp/app/components/app_text_form_field.dart';
import 'package:OCSTApp/app/core/store_state.dart';
import 'package:OCSTApp/app/mixins/loader_mixin.dart';
import 'package:OCSTApp/app/models/cliente_manequim_model.dart';
import 'package:OCSTApp/app/utils/size_utils.dart';
import 'package:OCSTApp/app/utils/snackbar_utils.dart';
import 'package:OCSTApp/app/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'cliente_manequim_editar_controller.dart';

class ClienteManequimEditarPage extends StatefulWidget {
  final String title;
  const ClienteManequimEditarPage({Key key, this.title = "Editar"})
      : super(key: key);

  @override
  _ClienteManequimEditarPageState createState() =>
      _ClienteManequimEditarPageState();
}

class _ClienteManequimEditarPageState extends ModularState<
    ClienteManequimEditarPage,
    ClienteManequimEditarController> with LoaderMixin {
  //use 'controller' variable to access controller

  // List<ReactionDisposer> _disposer;
  AppBar appBar = AppBar(
    elevation: 0,
    title: Text('Editar'),
  );

  ClienteManequimModel item;
  // var clienteManequimEditarController =
  //     GetIt.I.get<ClienteManequimEditarController>();

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
              'Altere o Manequim do Cliente',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            bottom: 12,
            child: Text(
              '(o que vale é sempre o mais atual)',
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
      key: controller.globalKeyAlt,
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
                  controller.observacao == null ? 'N/C' : controller.observacao,
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
    final nF = new NumberFormat("#,###,##0.00", "pt_BR");
    final item = Get.args(context)['item'];
    controller.id = item.id;
    // controller.clienteId = item.atendimentoServicoId;
    controller.controllerMaskBusto.text =
        item.busto == null ? '0.00' : nF.format(item.busto);
    controller.controllerMaskCintura.text =
        item.cintura == null ? '0.00' : nF.format(item.cintura);
    controller.controllerMaskQuadril.text =
        item.quadril == null ? '0.00' : nF.format(item.quadril);
    controller.observacao = item.observacao == null ? '' : item.observacao;
    return item;
  }
}
