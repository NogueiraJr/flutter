import 'package:OCSTApp/app/core/store_state.dart';
import 'package:OCSTApp/app/mixins/loader_mixin.dart';
import 'package:OCSTApp/app/modules/celulas/app_gerenciar/proprietario/Components/acessos_proprietario_menus.dart';
import 'package:OCSTApp/app/modules/celulas/app_gerenciar/proprietario/Components/equipe_proprietario.dart';
import 'package:OCSTApp/app/utils/size_utils.dart';
import 'package:OCSTApp/app/utils/snackbar_utils.dart';
import 'package:OCSTApp/app/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
import 'proprietario_controller.dart';

class ProprietarioPage extends StatefulWidget {
  final String title;
  const ProprietarioPage({Key key, this.title = "Você"}) : super(key: key);

  @override
  _ProprietarioPageState createState() => _ProprietarioPageState();
}

class _ProprietarioPageState
    extends ModularState<ProprietarioPage, ProprietarioController>
    with LoaderMixin {
  List<ReactionDisposer> _disposer;

  @override
  void initState() {
    super.initState();
    controller.obterUsuario();
    controller.obterAcessosUsuario();
    controller.obterEquipeUsuario();

    _disposer ??= [
      reaction((_) => controller.state, (StoreState state) {
        if (state == StoreState.initial) {
          showLoader();
        } else if (state == StoreState.loading) {
          showLoader();
        } else if (state == StoreState.loaded) {
          hideLoader();
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => editar(controller),
        child: Icon(
          Icons.edit,
          color: Colors.black,
        ),
        backgroundColor: ThemeUtils.primaryColor,
      ),
      body: Stack(
        children: <Widget>[
          Observer(builder: (_) {
            switch (controller.state) {
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
    );
  }

  Widget _makeContent() {
    return Column(children: <Widget>[
      _makeHeader(),
      _makeDetails(),
    ]);
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
                  // width: SizeUtils.widthScreen,
                  height: (SizeUtils.heightScreen * .16) -
                      SizeUtils.statusBarHeight,
                  child: Image.asset(
                    'assets/images/grc-proprietario.png',
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
                              controller.usuario.pessoa,
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
                              controller.usuario.empresa,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              controller.usuario.email.toLowerCase(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              controller.usuario.login.toUpperCase(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                letterSpacing: 2,
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

  _makeDetails() {
    if (controller.usuario.idPai == null) {
      return DetailsOwner(controller: controller);
    } else {
      return DetailsChild(controller: controller);
    }
  }
}

Future editar(ProprietarioController controller) async {
  final ret = await Get.toNamed('/proprietario_editar',
      arguments: {'usuario': controller.usuario});
  await controller.obterUsuario();
  return ret;
}

class DetailsOwner extends StatelessWidget {
  const DetailsOwner({
    Key key,
    @required this.controller,
  }) : super(key: key);

  final ProprietarioController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: Stack(
          children: <Widget>[
            Observer(builder: (_) {
              switch (controller.equipeState) {
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
                  return _makeUsersList();
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
    );
  }

  Widget _makeUsersList() {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Sua Equipe',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: ListView.separated(
                padding: const EdgeInsets.only(bottom: 80),
                itemBuilder: (_, index) => EquipeProprietario(
                  //item: controller.acessos[index],
                  membroEquipe: controller.usuariosEquipe[index],
                  controller: null,
                ),
                separatorBuilder: (_, index) => Divider(color: Colors.black),
                itemCount: controller.usuariosEquipe?.length ?? 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailsChild extends StatelessWidget {
  const DetailsChild({
    Key key,
    @required this.controller,
  }) : super(key: key);

  final ProprietarioController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeUtils.heightScreen * .73,
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
                return _makeAccessList();
              case StoreState.error:
                SnackBarUtils.showSnackBar(
                    'Erro ao buscar dados', controller.errorMessage);
                return Container();
            }
            return Container();
          }),
        ],
      ),
    );
  }

  Widget _makeAccessList() {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Acessos liberados para você',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.only(bottom: 80),
              itemBuilder: (_, index) => AcessoProprietarioMenus(
                item: controller.acessos[index],
                usuario: null,
                controller: null,
              ),
              separatorBuilder: (_, index) => Divider(color: Colors.black),
              itemCount: controller.acessos?.length ?? 0,
            ),
          ),
        ],
      ),
    );
  }
}
