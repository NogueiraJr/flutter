import 'package:OCSTApp/app/core/store_state.dart';
import 'package:OCSTApp/app/modules/celulas/dados/produto/produto_composicao/components/produto_composicao_itens.dart';
import 'package:OCSTApp/app/modules/celulas/dados/produto/produto_composicao/components/produto_composicao_itens_disponiveis.dart';
import 'package:OCSTApp/app/utils/size_utils.dart';
import 'package:OCSTApp/app/utils/snackbar_utils.dart';
import 'package:OCSTApp/app/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
import 'produto_composicao_controller.dart';

class ProdutoComposicaoPage extends StatefulWidget {
  final String title;
  const ProdutoComposicaoPage({Key key, this.title = "Composição"})
      : super(key: key);

  @override
  _ProdutoComposicaoPageState createState() => _ProdutoComposicaoPageState();
}

class _ProdutoComposicaoPageState
    extends ModularState<ProdutoComposicaoPage, ProdutoComposicaoController> {
  //use 'controller' variable to access controller

  List<ReactionDisposer> _disposer;

  ProdutoComposicaoController controller =
      Modular.get<ProdutoComposicaoController>();

  @override
  void initState() {
    super.initState();
    _disposer ??= [];
  }

  @override
  void dispose() {
    super.dispose();
    _disposer.forEach((d) => d());
  }

  @override
  Widget build(BuildContext context) {
    final produto = Get.args(context)['produto'];
    controller.obterProdutoItemPorIdProdutoPai(produto.id);
    AppBar appBar = AppBar(
      elevation: 0,
      title: Text(widget.title),
      primary: true,
      //centerTitle: true,
    );
    return Scaffold(
      appBar: appBar,
      floatingActionButton: FloatingActionButton(
        onPressed: () => listarProdutosDisponiveis(produto.id),
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
              switch (controller.produtosState) {
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
                  return _makeContent(produto);
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

  Widget _makeHeader() {
    final produto = Get.args(context)['produto'];
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
                    'assets/images/dds-produtos.png',
                  ),
                ),
                Observer(builder: (_) {
                  switch (controller.produtosState) {
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
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Flexible(
                                    child: new Text(
                                      produto.nome ?? 'Produto',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Flexible(
                                    child: new Text(
                                      produto.descricao,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    produto.codigo,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: 2,
                                    ),
                                  ),
                                ],
                              ),
                              //Row(
                              //  children: <Widget>[
                              //    Padding(
                              //      padding: const EdgeInsets.only(top: 3),
                              //      child: Text(
                              //        controller.itens.length == 0
                              //            ? '(defina a composição deste produto)'
                              //            : 'Possui ${controller.itens.length.toString()} iten(s)',
                              //        style: TextStyle(
                              //          color: Colors.black,
                              //          fontWeight: FontWeight.w300,
                              //          fontSize: 13,
                              //        ),
                              //      ),
                              //    ),
                              //  ],
                              //),
                            ],
                          ),
                        ),
                      );
                    case StoreState.error:
                      SnackBarUtils.showSnackBar(
                          'Erro ao buscar dados', controller.errorMessage);
                      return Container();
                  }
                  return Container();
                })
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _makeContent(dynamic produto) {
    return Column(
      children: <Widget>[
        _makeHeader(),
        Expanded(
          child: Container(
            color: Colors.white,
            child: ListView.separated(
              padding: const EdgeInsets.only(bottom: 80),
              itemBuilder: (_, index) => ProdutoComposicaoItens(
                item: controller.produtos[index],
                produtoBase: produto,
                controller: controller,
              ),
              separatorBuilder: (_, index) => Divider(color: Colors.black),
              itemCount: controller.produtos?.length ?? 0,
            ),
          ),
        ),
      ],
    );
  }

  listarProdutosDisponiveis(int produtoId) async {
    await controller.obterProdutosDisponiveis(produtoId);
    Get.defaultDialog(
      title: 'Produtos disponíveis',
      content: Observer(
        builder: (_) {
          switch (controller.produtosState) {
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
              return listagemProdutosDisponiveisComFiltro(produtoId);
            case StoreState.error:
              SnackBarUtils.showSnackBar('Atenção', controller.errorMessage);
              return Container();
          }
          return Container();
        },
      ),
      cancel: FlatButton(
        onPressed: () => Get.back(),
        child: Text(
          'Fechar',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
    );
  }

  Container listagemProdutosDisponiveisComFiltro(int produtoId) {
    return Container(
      width: SizeUtils.widthScreen * .8,
      height: SizeUtils.heightScreen * .8,
      child: Column(
        children: <Widget>[
          Container(
            // padding: EdgeInsets.only(left: 15, right: 80),
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
                icon: Icon(Icons.search),
                hintText: 'Procure aqui ...',
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (_, index) => ProdutoComposicaoItensDisponiveis(
                item: controller.filter.length == 0
                    ? controller.produtosDisponiveis[index]
                    : controller.listFiltered[index],
                // usuario: controller.usuarioAlvo,
                controller: controller,
                produtoPrincipal: produtoId,
              ),
              itemCount: controller.filter.length == 0
                  ? controller.produtosDisponiveis.length
                  : controller.listFiltered?.length ?? 0,
            ),
          )
        ],
      ),
    );
  }
}
