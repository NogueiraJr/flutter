import 'package:OCSTApp/app/core/store_state.dart';
import 'package:OCSTApp/app/models/usuario_consulta_model.dart';
import 'package:OCSTApp/app/modules/celulas/dados/cliente/cliente_controller.dart';
import 'package:OCSTApp/app/modules/celulas/dados/cliente/cliente_escolher/escolher_cliente_item.dart';
import 'package:OCSTApp/app/utils/size_utils.dart';
import 'package:OCSTApp/app/utils/snackbar_utils.dart';
import 'package:OCSTApp/app/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'escolher_cliente_controller.dart';

class EscolherClientePage extends StatefulWidget {
  final String title;
  const EscolherClientePage({Key key, this.title = "Escolha o Cliente"})
      : super(key: key);

  @override
  _EscolherClientePageState createState() => _EscolherClientePageState();
}

class _EscolherClientePageState
    extends ModularState<EscolherClientePage, EscolherClienteController> {
  List<ReactionDisposer> _disposer;
  EscolherClienteController controller =
      Modular.get<EscolherClienteController>();

  @override
  void initState() {
    controller.obterSistemaUsuarioLogado();
    super.initState();
    _disposer ??= [];
    if (GetIt.I.isRegistered<EscolherClienteController>()) {
      GetIt.I.unregister<EscolherClienteController>();
    }
    GetIt.I.registerSingleton<EscolherClienteController>(controller);
  }

  @override
  void dispose() {
    super.dispose();
    _disposer.forEach((d) => d());
  }

  @override
  Widget build(BuildContext context) {
    controller.obterPrimeirosClientesParaTela();
    return new Scaffold(
      body: buildNestedScrollView(),
      floatingActionButton: buildFloatingActionButton(),
    );
  }

  NestedScrollView buildNestedScrollView() {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            // expandedHeight: 260,
            floating: false,
            pinned: true,
            // forceElevated: true,
            // actions: _buildActions(),
            flexibleSpace: Container(
                decoration: BoxDecoration(
                  color: ThemeUtils.primaryColor,
                  border: Border(
                      bottom: BorderSide(width: 1, color: Colors.black12)),
                ),
                child: buildFlexibleSpaceBar()),
          ),
        ];
      },
      body: buildNestedScrollViewBody(),
    );
  }

  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        Get.toNamed('/cliente_cadastro');
      },
      child: Icon(
        Icons.add,
        color: Colors.black,
      ),
      backgroundColor: ThemeUtils.primaryColor,
    );
  }

  FlexibleSpaceBar buildFlexibleSpaceBar() {
    return FlexibleSpaceBar(
      centerTitle: true,
      title: Text(
        'Escolha o Cliente',
        style: TextStyle(
          color: Colors.black,
          fontSize: 14.0,
        ),
      ),
    );
  }

  Container buildNestedScrollViewBody() {
    return Container(
      height: SizeUtils.heightScreen,
      child: Stack(
        children: <Widget>[
          Observer(
            builder: (_) {
              switch (controller.clientesState) {
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
                      'Atenção', controller.errorMessage);
                  return Container();
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }

  Widget _makeContent() {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 15, right: 80),
          color: Colors.white,
          child: TextFormField(
            onChanged: controller.setFilter,
            initialValue: controller.filter,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w300,
              letterSpacing: 1,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              hintText: 'Digite aqui para procurar',
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.white,
            child: ListView.separated(
              padding: const EdgeInsets.only(bottom: 80),
              itemBuilder: (_, index) => EscolherClienteItem(
                item: controller.filter.length == 0
                    ? controller.clientes[index]
                    : controller.listFiltered[index],
                //colaboradorAnterior: controller.usuarioAnterior,
                controller: controller,
                //candidatoLider: controller.candidatoLider,
              ),
              separatorBuilder: (_, index) => Divider(color: Colors.black),
              itemCount: controller.filter.length == 0
                  ? controller.clientes.length
                  : controller.listFiltered?.length ?? 0,
            ),
          ),
        ),
      ],
    );
  }
}
