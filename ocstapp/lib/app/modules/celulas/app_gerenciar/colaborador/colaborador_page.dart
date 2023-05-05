import 'package:OCSTApp/app/core/store_state.dart';
import 'package:OCSTApp/app/modules/celulas/app_gerenciar/colaborador/Components/colaborador_item.dart';
import 'package:OCSTApp/app/utils/size_utils.dart';
import 'package:OCSTApp/app/utils/snackbar_utils.dart';
import 'package:OCSTApp/app/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
import 'colaborador_controller.dart';

class ColaboradorPage extends StatefulWidget {
  final String title;
  const ColaboradorPage({Key key, this.title = "Colaboradores"})
      : super(key: key);

  @override
  _ColaboradorPageState createState() => _ColaboradorPageState();
}

class _ColaboradorPageState
    extends ModularState<ColaboradorPage, ColaboradorController> {
  //use 'controller' variable to access controller

  List<ReactionDisposer> _disposer;

  ColaboradorController controller = Modular.get<ColaboradorController>();

  @override
  void initState() {
    super.initState();
    //final login = Get.args(context)['login'] ?? ''; --> ERRO
    //controller.obterDadosUsuario();

    //controller.obterDadosParaListaEquipe();

    controller.obterUsuarioRaiz();

    _disposer ??= [];
  }

  @override
  void dispose() {
    super.dispose();
    //controller.removeLoginParam();
    _disposer.forEach((d) => d());
  }

  @override
  Widget build(BuildContext context) {
    //controller.login = Get.args(context)['login'];
    //final login = Get.args(context)['login'] ?? '';

    controller.obterDadosParaListaEquipe();
    controller.obterDadosUsuario();

    AppBar appBar = AppBar(
      elevation: 0,
      title: Text(widget.title),
      primary: true,
      //centerTitle: true,
    );
    return WillPopScope(
      child: new Scaffold(
        appBar: appBar,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed('/colaborador_cadastro');
          },
          child: Icon(
            Icons.add,
            color: Colors.black,
          ),
          backgroundColor: ThemeUtils.primaryColor,
        ),
        body: Container(
          height: SizeUtils.heightScreen,
          child: Stack(
            children: <Widget>[
              Observer(builder: (_) {
                switch (controller.menusState) {
                  case StoreState.initial:
                  case StoreState.loading:
                    return Container(
                      height: SizeUtils.heightScreen,
                      alignment: Alignment.topCenter,
                      child: Container(
                        margin: EdgeInsets.only(top: 30),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  case StoreState.loaded:
                    return _makeContent();
                  case StoreState.error:
                    SnackBarUtils.showSnackBar(
                        'Erro ao buscar dados', controller.errorMessage);
                    return Container();
                }
                return Container();
              }),
            ],
          ),
        ),
      ),
      onWillPop: () async {
        return controller.removeUltimoLoginParam();
        //controller.voltarAoInicio();
        //return false;
      },
    );
  }

  Widget _makeHeader() {
    return Container(
      decoration: BoxDecoration(
        color: ThemeUtils.primaryColor,
        border: Border(bottom: BorderSide(width: 1, color: Colors.black12)),
      ),
// color: ThemeUtils.primaryColor,
      height: (SizeUtils.heightScreen * .18) - SizeUtils.statusBarHeight,
      width: SizeUtils.widthScreen * 2,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              children: <Widget>[
                Container(
                  height: (SizeUtils.heightScreen * .16) -
                      SizeUtils.statusBarHeight,
                  child: Image.asset(
                    'assets/images/grc-colaboradores.png',
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              controller.usuarioAnterior.pessoa ??
                                  'N/C', //'Sua Equipe',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              controller.usuarios.length == 0
                                  ? '(cadastre seus colaboradores)'
                                  : controller.usuarios.length > 1
                                      ? 'Lidera ${controller.usuarios.length.toString()} colaboradores'
                                      : 'Lidera ${controller.usuarios.length.toString()} colaborador',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _makeContent() {
    return Column(
      children: <Widget>[
        _makeHeader(),
        Expanded(
          child: Container(
            color: Colors.white,
            child: ListView.separated(
              padding: const EdgeInsets.only(bottom: 80),
              itemBuilder: (_, index) => ColaboradorItem(
                  item: controller.usuarios[index],
                  colaboradorAnterior: controller.usuarioAnterior,
                  controller: controller,
                  candidatoLider: controller.candidatoLider),
              separatorBuilder: (_, index) => Divider(color: Colors.black),
              itemCount: controller.usuarios?.length ?? 0,
            ),
          ),
        ),
      ],
    );
  }
}
