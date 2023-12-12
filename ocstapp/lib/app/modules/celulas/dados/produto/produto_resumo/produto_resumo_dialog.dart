import 'package:OCSTApp/app/components/app_flat_button.dart';
import 'package:OCSTApp/app/core/store_state.dart';
import 'package:OCSTApp/app/models/produto_model.dart';
import 'package:OCSTApp/app/modules/celulas/dados/produto/produto_controller.dart';
import 'package:OCSTApp/app/modules/celulas/dados/produto/produto_item/produto_item.dart';
import 'package:OCSTApp/app/modules/principal/principal_controller.dart';
import 'package:OCSTApp/app/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

class ProdutoResumoDialog extends StatelessWidget {
  final ProdutoModel item;
  final ProdutoController produtoController;
  const ProdutoResumoDialog({Key key, this.item, this.produtoController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nF = new NumberFormat("#,###,##0.00", "pt_BR");
    // final produtoController = GetIt.I.get<ProdutoController>();
    // produtoController.consultarResumoDoProduto(item);
    // produtoController.montaListaCompoe();
    // produtoController.montaListaComposto();
    // _consultarObjetoDoAtendimento();
    // produtoController.consultarResumoDoProduto(item);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('Resumo do Produto'),
      ),
      backgroundColor: Colors.white,
      body: _makeBody(produtoController, nF),
    );
  }

  SingleChildScrollView _makeBody(
      ProdutoController produtoController, NumberFormat nF) {
    // final produtoResumo = produtoController.consultarResumoDoProduto(item);
    // produtoController.consultarResumoDoProduto(item);
    // produtoController.montaListaCompoe();
    // produtoController.montaListaComposto();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 3, right: 3, bottom: 3),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text(item.nome,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w500)),
                    dense: true,
                  ),
                  Visibility(
                    visible: item.usuarioNome != null,
                    child: ListTile(
                      title: Text('Colaborador(a): ${item.usuarioNome}',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w300)),
                      dense: true,
                    ),
                  ),
                  // _makeObserverDoObjeto(),
                  // SizedBox(height: 10),
                  ListTile(
                    leading: Icon(Icons.confirmation_number,
                        size: 40, color: Colors.black12),
                    title: Text(
                      'Código ${item.codigo}',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 1.2),
                    ),
                    subtitle: Text(
                      '${item.descricao}',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.attach_money,
                        size: 40, color: Colors.black12),
                    title: Row(
                      children: <Widget>[
                        Text(
                          'Custo R\$ ${nF.format(item.custo)}',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 1.2),
                        ),
                      ],
                    ),
                    subtitle: Text(
                      'Preço R\$ ${nF.format(item.preco)}',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                  // Visibility(
                  //   visible: item.iniciado != null && item.finalizado != null,
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(left: 8, right: 8),
                  //     child: Container(
                  //       padding: EdgeInsets.only(left: 12.0),
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(10.0),
                  //         color: Colors.green,
                  //       ),
                  //       height: 55,
                  //       child: Container(
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.only(
                  //               topRight: Radius.circular(10.0),
                  //               bottomRight: Radius.circular(10.0)),
                  //           color: Colors.green[50],
                  //         ),
                  //         child: ListTile(
                  //           isThreeLine: true,
                  //           dense: true,
                  //           leading: Icon(Icons.check,
                  //               size: 40, color: Colors.transparent),
                  //           trailing: Icon(Icons.check_circle_outline,
                  //               color: Colors.green),
                  //           title: Text(
                  //             'Finalizado ${item.finalizadoSemana}',
                  //             style: TextStyle(
                  //                 color: Colors.black,
                  //                 fontSize: 15,
                  //                 fontWeight: FontWeight.w300,
                  //                 letterSpacing: 1.2),
                  //           ),
                  //           subtitle: Text(
                  //             '${item.finalizado}',
                  //             style: TextStyle(
                  //                 color: Colors.black, fontSize: 15),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(height: 10),
                  Observer(
                    builder: (_) {
                      switch (produtoController.compoeState) {
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
                          return produtoController.compoe.length > 0
                              ? _makeProdutosCompoe(produtoController)
                              : Container();
                        // SizedBox(height: 10),
                        // _makeProdutosComposto(),
                        case StoreState.error:
                          // SnackBarUtils.showSnackBar(
                          //     'Atenção', controller.errorMessage);
                          return Container();
                      }
                      return Container();
                    },
                  ),

                  Observer(
                    builder: (_) {
                      switch (produtoController.compostoState) {
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
                          return produtoController.composto.length > 0
                              ? _makeProdutosComposto(produtoController)
                              : Container();
                        // SizedBox(height: 10),
                        // _makeProdutosComposto(),
                        case StoreState.error:
                          // SnackBarUtils.showSnackBar(
                          //     'Atenção', controller.errorMessage);
                          return Container();
                      }
                      return Container();
                    },
                  ),

                  // SizedBox(height: 10),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  //   child: AppFlatButton(
                  //       label: 'Inserir Produto',
                  //       onPressed: () => {
                  //             produtoController.origemProdutoTela =
                  //                 'editar',
                  //             produtoController
                  //                     .origemProdutoId =
                  //                 item.id,
                  //             produtoController.escolherProdutos(),
                  //           }),
                  // ),
                  // SizedBox(height: 10),
                  // Text(
                  //   "Preço do Atendimento",
                  //   style: TextStyle(color: Colors.black, fontSize: 20),
                  // ),
                  // Observer(
                  //   builder: (_) {
                  //     switch (produtoController
                  //         .produtosDoServicoState) {
                  //       case StoreState.initial:
                  //       case StoreState.loading:
                  //         return Container(
                  //           height: SizeUtils.heightScreen,
                  //           alignment: Alignment.topCenter,
                  //           child: Container(
                  //             margin: EdgeInsets.only(top: 30),
                  //             child: CircularProgressIndicator(),
                  //           ),
                  //         );
                  //       case StoreState.loaded:
                  //         return _makeValorTotalProdutos(
                  //             nF, produtoController);
                  //       case StoreState.error:
                  //         // SnackBarUtils.showSnackBar(
                  //         //     'Atenção', controller.errorMessage);
                  //         return Container();
                  //     }
                  //     return Container();
                  //   },
                  // ),
                  // Visibility(
                  //   visible:
                  //       item.observacao != null && item.observacao.length > 0,
                  //   child: Column(
                  //     children: <Widget>[
                  //       SizedBox(height: 10),
                  //       Icon(Icons.speaker_notes,
                  //           size: 40, color: Colors.black12),
                  //       // Text(
                  //       //   "Observação",
                  //       //   style: TextStyle(color: Colors.black, fontSize: 20),
                  //       // ),
                  //       Padding(
                  //         padding: const EdgeInsets.all(12),
                  //         child: Text(
                  //           '${item.observacao}',
                  //           textAlign: TextAlign.center,
                  //           style: TextStyle(
                  //               color: Colors.black,
                  //               fontSize: 18,
                  //               fontWeight: FontWeight.w200),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Observer _makeObserverDoObjeto() {
  //   final controllerPrincipal = GetIt.I.get<PrincipalController>();
  //   var produtoController =
  //       GetIt.I.get<ProdutoController>();
  //   switch (controllerPrincipal.sistemaRef) {
  //     case 'refOficinaCarros':
  //       return Observer(
  //         builder: (_) {
  //           switch (produtoController.clienteVeiculoState) {
  //             case StoreState.initial:
  //             case StoreState.loading:
  //               return Container(
  //                 height: SizeUtils.heightScreen,
  //                 alignment: Alignment.topCenter,
  //                 child: Container(
  //                   margin: EdgeInsets.only(top: 30),
  //                   child: CircularProgressIndicator(),
  //                 ),
  //               );
  //             case StoreState.loaded:
  //               return _makeClienteVeiculo(produtoController);
  //             case StoreState.error:
  //               // SnackBarUtils.showSnackBar(
  //               //     'Atenção', controller.errorMessage);
  //               return Container();
  //           }
  //           return Container();
  //         },
  //       );
  //       break;
  //     case 'refPetShop':
  //       return Observer(
  //         builder: (_) {
  //           switch (produtoController.clientePetState) {
  //             case StoreState.initial:
  //             case StoreState.loading:
  //               return Container(
  //                 height: SizeUtils.heightScreen,
  //                 alignment: Alignment.topCenter,
  //                 child: Container(
  //                   margin: EdgeInsets.only(top: 30),
  //                   child: CircularProgressIndicator(),
  //                 ),
  //               );
  //             case StoreState.loaded:
  //               return _makeClientePet(produtoController);
  //             case StoreState.error:
  //               // SnackBarUtils.showSnackBar(
  //               //     'Atenção', controller.errorMessage);
  //               return Container();
  //           }
  //           return Container();
  //         },
  //       );
  //       break;
  //     case 'refClinicaVeterinaria':
  //       return Observer(
  //         builder: (_) {
  //           switch (produtoController.clientePetState) {
  //             case StoreState.initial:
  //             case StoreState.loading:
  //               return Container(
  //                 height: SizeUtils.heightScreen,
  //                 alignment: Alignment.topCenter,
  //                 child: Container(
  //                   margin: EdgeInsets.only(top: 30),
  //                   child: CircularProgressIndicator(),
  //                 ),
  //               );
  //             case StoreState.loaded:
  //               return _makeClientePet(produtoController);
  //             case StoreState.error:
  //               // SnackBarUtils.showSnackBar(
  //               //     'Atenção', controller.errorMessage);
  //               return Container();
  //           }
  //           return Container();
  //         },
  //       );
  //       break;
  //     default:
  //       return Observer(builder: (_) {
  //         return Container();
  //       });
  //   }
  // }

  // Future<void> _consultarObjetoDoAtendimento() async {
  //   final controllerPrincipal = GetIt.I.get<PrincipalController>();
  //   var produtoController =
  //       GetIt.I.get<ProdutoController>();
  //   switch (controllerPrincipal.sistemaRef) {
  //     case 'refOficinaCarros':
  //       produtoController.consultarClienteVeiculo(item.id);
  //       break;
  //     case 'refPetShop':
  //       produtoController.consultarClientePet(item.id);
  //       break;
  //     case 'refClinicaVeterinaria':
  //       produtoController.consultarClientePet(item.id);
  //       break;
  //     default:
  //   }
  // }

  // Text _makeValorTotalProdutos(NumberFormat nF,
  //     ProdutoController produtoController) {
  //   return Text(
  //     // 'R\$ ${nF.format(item.valor)}',
  //     // 'R\$ ${nF.format(produtoController.produtosDoServico.fold(0, (prev, produtoPreco) => prev + produtoPreco))}',
  //     // 'R\$ ${nF.format(produtoController.produtosDoServico.reduce((prev, item) => prev + item))}',
  //     // 'R\$ ${nF.format(produtoController.produtosDoServico.length)} //teste apenas para ver se mostrava algo',
  //     'R\$ ${nF.format(produtoController.produtosDoServicoValorTotal)}',
  //     style: TextStyle(color: Colors.black, fontSize: 35),
  //   );
  // }

  Column _makeProdutosCompoe(ProdutoController produtoController) {
    // final produtoController = GetIt.I.get<ProdutoController>();
    // produtoController.consultarResumoDoProduto(item);
    return Column(
      children: <Widget>[
        Icon(Icons.filter_center_focus, size: 40, color: Colors.black12),
        Text(
          "COMPÕE",
          style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              letterSpacing: 5,
              fontWeight: FontWeight.w300),
        ),
        Text(
          "(faz parte dos produtos abaixo)",
          style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              // letterSpacing: 5,
              fontWeight: FontWeight.w300),
        ),
        ListView.separated(
          controller: ScrollController(keepScrollOffset: false),
          shrinkWrap: true,
          padding: const EdgeInsets.only(top: 10),
          itemBuilder: (_, index) => ProdutoItem(
            item: produtoController.compoe[index],
            controller: produtoController,
            podeEditar: false,
          ),
          separatorBuilder: (_, index) => Divider(color: Colors.black),
          itemCount: produtoController.compoe.length,
        ),
      ],
    );
  }

  Column _makeProdutosComposto(ProdutoController produtoController) {
    // final produtoController = GetIt.I.get<ProdutoController>();
    // produtoController.consultarResumoDoProduto(item);
    return Column(
      children: <Widget>[
        Icon(Icons.toll, size: 40, color: Colors.black12),
        Text(
          "COMPOSTO",
          style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              letterSpacing: 5,
              fontWeight: FontWeight.w300),
        ),
        Text(
          "(é composto dos produtos abaixo)",
          style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              // letterSpacing: 5,
              fontWeight: FontWeight.w300),
        ),
        ListView.separated(
          controller: ScrollController(keepScrollOffset: false),
          shrinkWrap: true,
          padding: const EdgeInsets.only(top: 10),
          itemBuilder: (_, index) => ProdutoItem(
            item: produtoController.composto[index],
            controller: produtoController,
            podeEditar: false,
          ),
          separatorBuilder: (_, index) => Divider(color: Colors.black),
          itemCount: produtoController.composto.length,
        ),
      ],
    );
  }

  // Visibility _makeClienteVeiculo(
  //     ProdutoController produtoController) {
  //   // final produtoController =
  //   //     GetIt.I.get<ProdutoController>();
  //   return Visibility(
  //     visible: produtoController.clienteVeiculo != null,
  //     child: Column(
  //       children: <Widget>[
  //         Text(
  //           "VEÍCULO",
  //           style: TextStyle(
  //               color: Colors.black,
  //               fontSize: 20,
  //               letterSpacing: 5,
  //               fontWeight: FontWeight.w300),
  //         ),
  //         ListTile(
  //           leading:
  //               Icon(Icons.directions_car, size: 40, color: Colors.black12),
  //           title: Text(
  //             '${produtoController.clienteVeiculo.marca} ${produtoController.clienteVeiculo.modelo} ${produtoController.clienteVeiculo.cor}',
  //             style: TextStyle(
  //                 color: Colors.black,
  //                 fontSize: 17,
  //                 fontWeight: FontWeight.w300,
  //                 letterSpacing: 1.0),
  //           ),
  //           subtitle: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: <Widget>[
  //               Text(
  //                 'Ano ${produtoController.clienteVeiculo.ano}, Placa ${produtoController.clienteVeiculo.placa}',
  //                 style: TextStyle(
  //                   color: Colors.black,
  //                   fontSize: 15,
  //                   fontWeight: FontWeight.w300,
  //                   letterSpacing: 1.1,
  //                 ),
  //               ),
  //               Text(
  //                 '${produtoController.clienteVeiculo.observacao}',
  //                 style: TextStyle(
  //                   color: Colors.black,
  //                   fontSize: 12,
  //                   fontWeight: FontWeight.w300,
  //                   letterSpacing: 1.0,
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Visibility _makeClientePet(
  //     ProdutoController produtoController) {
  //   // final produtoController =
  //   //     GetIt.I.get<ProdutoController>();
  //   return Visibility(
  //     visible: produtoController.clientePet != null,
  //     child: Column(
  //       children: <Widget>[
  //         Text(
  //           "PET",
  //           style: TextStyle(
  //               color: Colors.black,
  //               fontSize: 20,
  //               letterSpacing: 5,
  //               fontWeight: FontWeight.w300),
  //         ),
  //         ListTile(
  //           leading: Icon(Icons.pets, size: 40, color: Colors.black12),
  //           title: Text(
  //             '${produtoController.clientePet.raca} ${produtoController.clientePet.cor}',
  //             style: TextStyle(
  //                 color: Colors.black,
  //                 fontSize: 17,
  //                 fontWeight: FontWeight.w300,
  //                 letterSpacing: 1.0),
  //           ),
  //           subtitle: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: <Widget>[
  //               Text(
  //                 '${produtoController.clientePet.nome} (${produtoController.clientePet.mesNascimento}/${produtoController.clientePet.anoNascimento})',
  //                 style: TextStyle(
  //                   color: Colors.black,
  //                   fontSize: 15,
  //                   fontWeight: FontWeight.w300,
  //                   letterSpacing: 1.1,
  //                 ),
  //               ),
  //               Text(
  //                 '${produtoController.clientePet.observacao}',
  //                 style: TextStyle(
  //                   color: Colors.black,
  //                   fontSize: 12,
  //                   fontWeight: FontWeight.w300,
  //                   letterSpacing: 1.0,
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
