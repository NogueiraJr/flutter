import 'package:OCSTApp/app/core/store_state.dart';
import 'package:OCSTApp/app/modules/celulas/dados/produto/produto_escolher/escolher_produto_item.dart';
import 'package:OCSTApp/app/utils/size_utils.dart';
import 'package:OCSTApp/app/utils/snackbar_utils.dart';
import 'package:OCSTApp/app/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'escolher_produto_controller.dart';

class EscolherProdutoPage extends StatefulWidget {
  final String title;
  const EscolherProdutoPage({Key key, this.title = "EscolherProduto"})
      : super(key: key);

  @override
  _EscolherProdutoPageState createState() => _EscolherProdutoPageState();
}

class _EscolherProdutoPageState
    extends ModularState<EscolherProdutoPage, EscolherProdutoController> {
  //use 'controller' variable to access controller

  List<ReactionDisposer> _disposer;
  EscolherProdutoController controller =
      Modular.get<EscolherProdutoController>();

  @override
  void initState() {
    controller.obterSistemaUsuarioLogado();
    super.initState();
    _disposer ??= [];
    if (GetIt.I.isRegistered<EscolherProdutoController>()) {
      GetIt.I.unregister<EscolherProdutoController>();
    }
    GetIt.I.registerSingleton<EscolherProdutoController>(controller);
  }

  @override
  void dispose() {
    super.dispose();
    _disposer.forEach((d) => d());
  }

  @override
  Widget build(BuildContext context) {
    controller.obterPrimeirosProdutosParaTela();
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
        Get.toNamed('/produto_cadastro');
      },
      child: Icon(
        Icons.add,
        color: Colors.black,
      ),
      backgroundColor: ThemeUtils.primaryColor,
    );
  }

  // List<Widget> _buildActions() {
  //   return <Widget>[
  //     IconButton(
  //       icon: Icon(Icons.find_in_page),
  //       onPressed: () {
  //         //Get.offAllNamed('/<pagina/tela>');
  //       },
  //     ),
  //     PopupMenuButton<String>(
  //       icon: Icon(Icons.more_vert),
  //       onSelected: (opcaoMenu) {
  //         //controller.acaoDoMenuEscolhido(opcaoMenu);
  //       },
  //       itemBuilder: (_) {
  //         return [
  //           PopupMenuItem<String>(
  //             value: 'ajuda',
  //             child: Text(
  //               'Ajuda',
  //               style: TextStyle(
  //                 fontSize: 14,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //           ),
  //           // PopupMenuItem<String>(
  //           //   value: '',
  //           //   child: Text(
  //           //     'Opção 1 Produto',
  //           //     style: TextStyle(fontSize: 14),
  //           //   ),
  //           // ),
  //           // PopupMenuItem<String>(
  //           //   value: '',
  //           //   child: Text(
  //           //     'Opção 2 Produto DEF XXX',
  //           //     style: TextStyle(fontSize: 14),
  //           //   ),
  //           // ),
  //           // PopupMenuItem<String>(
  //           //   value: '',
  //           //   child: Text(
  //           //     'Opção 2 Produto GHI',
  //           //     style: TextStyle(fontSize: 14),
  //           //   ),
  //           // ),
  //           // PopupMenuItem<String>(
  //           //   value: '',
  //           //   child: Text(
  //           //     'Opção 5 Produto JLM 12345',
  //           //     style: TextStyle(fontSize: 14),
  //           //   ),
  //           // ),
  //         ];
  //       },
  //     ),
  //   ];
  // }

  FlexibleSpaceBar buildFlexibleSpaceBar() {
    return FlexibleSpaceBar(
      // background: Observer(
      //   builder: (_) {
      //     switch (controller.produtosState) {
      //       case StoreState.initial:
      //       case StoreState.loading:
      //         return Container(
      //           padding: EdgeInsets.only(top: 50),
      //           height: SizeUtils.heightScreen,
      //           alignment: Alignment.topCenter,
      //           child: Container(
      //             margin: EdgeInsets.only(top: 30),
      //             child: CircularProgressIndicator(),
      //           ),
      //         );
      //       case StoreState.loaded:
      //         return _makeHeader();
      //       case StoreState.error:
      //         SnackBarUtils.showSnackBar('Atenção', controller.errorMessage);
      //         return Container();
      //     }
      //     return Container();
      //   },
      // ),
      centerTitle: true,
      title: Text(
        'Escolha o Produto',
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

  // Widget _makeHeader() {
  //   final figura = Get.args(context)['figura'];
  //   // controller.obterSistemaUsuarioLogado();
  //   return Stack(
  //     children: <Widget>[
  //       Positioned(
  //         bottom: 140,
  //         left: 10,
  //         child: Row(
  //           children: <Widget>[
  //             Container(
  //               width: 70,
  //               height: 70,
  //               child: Image(
  //                 image: AssetImage(figura ?? ''),
  //               ),
  //             ),
  //             Container(
  //               padding: EdgeInsets.only(left: 8),
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: <Widget>[
  //                   Text(
  //                     controller.produtos.length > 0
  //                         ? '${controller.produtos?.length ?? 0} Produtos'
  //                         : '${controller.produtos?.length ?? 0} Produto',
  //                     style: TextStyle(
  //                         color: Colors.black,
  //                         fontSize: 16,
  //                         fontWeight: FontWeight.normal),
  //                   ),
  //                   //Text(
  //                   //  controller.produtosEspeciais > 1
  //                   //      ? '${controller.produtosEspeciais} Especiais'
  //                   //      : '${controller.produtosEspeciais} Especial',
  //                   //  style: TextStyle(
  //                   //    color: Colors.black,
  //                   //    fontSize: 13,
  //                   //  ),
  //                   //),
  //                   //Text(
  //                   //  controller.produtosComDesvio > 1
  //                   //      ? '${controller.produtosComDesvio} com Desvios'
  //                   //      : '${controller.produtosComDesvio} com Desvio',
  //                   //  style: TextStyle(
  //                   //    color: Colors.black,
  //                   //    fontSize: 13,
  //                   //  ),
  //                   //),
  //                 ],
  //               ),
  //             )
  //           ],
  //         ),
  //       ),
  //       // Visibility(
  //       //     visible: controller.sistemaRef == 'refLocacaoRoupas',
  //       //     child: BlocosDadosProdutoLocacaoRoupasWidget(
  //       //         left: 10, right: 10, top: 152, bottom: 50)),
  //       // Visibility(
  //       //     visible: controller.sistemaRef == 'refLanchonete',
  //       //     child: BlocosDadosProdutoLanchoneteWidget(
  //       //         left: 10, right: 10, top: 152, bottom: 50)),
  //       // Visibility(
  //       //     visible: controller.sistemaRef == 'refOficinaCarros',
  //       //     child: BlocosDadosProdutoAtendimentoServicosWidget(
  //       //         left: 10, right: 10, top: 152, bottom: 50)),
  //     ],
  //   );
  // }

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
              itemBuilder: (_, index) => EscolherProdutoItem(
                item: controller.filter.length == 0
                    ? controller.produtos[index]
                    : controller.listFiltered[index],
                controller: controller,
              ),
              separatorBuilder: (_, index) => Divider(color: Colors.black),
              itemCount: controller.filter.length == 0
                  ? controller.produtos.length
                  : controller.listFiltered?.length ?? 0,
            ),
          ),
        ),
      ],
    );
  }
}
