import 'package:OCSTApp/app/core/store_state.dart';
import 'package:OCSTApp/app/utils/snackbar_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../atendimento_servico_controller.dart';

class BlocosOperacionalAtendimentoServicosWidget extends StatefulWidget {
  final double left;
  final double right;
  final double top;
  final double bottom;

  const BlocosOperacionalAtendimentoServicosWidget(
      {Key key, this.left, this.right, this.top, this.bottom})
      : super(key: key);
  @override
  _BlocosDadosClienteAtendimentoServicosWidgetState createState() =>
      _BlocosDadosClienteAtendimentoServicosWidgetState();
}

class _BlocosDadosClienteAtendimentoServicosWidgetState
    extends State<BlocosOperacionalAtendimentoServicosWidget> {
  var atendimentoServicoController =
      GetIt.I.get<AtendimentoServicoController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: widget.left,
          right: widget.right,
          top: widget.top,
          bottom: widget.bottom),
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: <Widget>[
          // buildAtendimentosAtivos(),
          buildAtendimentosIniciar(),
          buildAtendimentosFinalizar(),
          buildAtendimentosFinalizados(),
          buildAtendimentosArquivados(),
          // buildAtendimentosCalendarioHoje(),
        ],
      ),
    );
  }

  InkWell buildAtendimentosAtivos() {
    return InkWell(
      onTap: () {
        // roupaLocacaoController.obterLocacoes('ativas');
      },
      child: Container(
        padding: EdgeInsets.only(right: 5),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              color: Colors.white70),
          width: 90,
          padding: EdgeInsets.all(5),
          child: Container(
            child: Column(
              children: <Widget>[
                Observer(
                  builder: (_) {
                    switch (atendimentoServicoController
                        .qtdeAtendimentosArquivadosState) {
                      case StoreState.initial:
                      case StoreState.loading:
                        return Container(
                          child: Container(
                            height: 10,
                            width: 10,
                            child: CircularProgressIndicator(),
                          ),
                        );
                      case StoreState.loaded:
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                                atendimentoServicoController
                                    .qtdeAtendimentosAtivos,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                            // Icon(
                            //   Icons.list,
                            //   color: Colors.black,
                            // ),
                          ],
                        );
                      case StoreState.error:
                        SnackBarUtils.showSnackBar('Atenção',
                            atendimentoServicoController.errorMessage);
                        return Container();
                    }
                    return Container();
                  },
                ),
                Text(
                  'atendimentos ativos',
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InkWell buildAtendimentosIniciar() {
    return InkWell(
      onTap: () {
        atendimentoServicoController.obterServicos('iniciar', 'string', '');
      },
      child: Container(
        padding: EdgeInsets.only(right: 5),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              color: Colors.black12),
          width: 90,
          padding: EdgeInsets.all(5),
          child: Container(
            child: Column(
              children: <Widget>[
                Observer(
                  builder: (_) {
                    switch (atendimentoServicoController
                        .qtdeAtendimentosIniciarState) {
                      case StoreState.initial:
                      case StoreState.loading:
                        return Container(
                          child: Container(
                            height: 10,
                            width: 10,
                            child: CircularProgressIndicator(),
                          ),
                        );
                      case StoreState.loaded:
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                                atendimentoServicoController
                                    .qtdeAtendimentosIniciar,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                            // Icon(
                            //   Icons.list,
                            //   color: Colors.black,
                            // ),
                          ],
                        );
                      case StoreState.error:
                        SnackBarUtils.showSnackBar('Atenção',
                            atendimentoServicoController.errorMessage);
                        return Container();
                    }
                    return Container();
                  },
                ),
                Text(
                  'atendimentos ainda não iniciados',
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InkWell buildAtendimentosFinalizar() {
    return InkWell(
      onTap: () {
        atendimentoServicoController.obterServicos('finalizar', 'string', '');
      },
      child: Container(
        padding: EdgeInsets.only(right: 5),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              color: Colors.blue[400]),
          width: 90,
          padding: EdgeInsets.all(5),
          child: Container(
            child: Column(
              children: <Widget>[
                Observer(
                  builder: (_) {
                    switch (atendimentoServicoController
                        .qtdeAtendimentosFinalizarState) {
                      case StoreState.initial:
                      case StoreState.loading:
                        return Container(
                          child: Container(
                            height: 10,
                            width: 10,
                            child: CircularProgressIndicator(),
                          ),
                        );
                      case StoreState.loaded:
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                                atendimentoServicoController
                                    .qtdeAtendimentosFinalizar,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                            // Icon(
                            //   Icons.list,
                            //   color: Colors.black,
                            // ),
                          ],
                        );
                      case StoreState.error:
                        SnackBarUtils.showSnackBar('Atenção',
                            atendimentoServicoController.errorMessage);
                        return Container();
                    }
                    return Container();
                  },
                ),
                Text(
                  'atendimentos em andamento',
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InkWell buildAtendimentosFinalizados() {
    return InkWell(
      onTap: () {
        atendimentoServicoController.obterServicos('finalizados', 'string', '');
      },
      child: Container(
        padding: EdgeInsets.only(right: 5),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              color: Colors.green),
          width: 90,
          padding: EdgeInsets.all(5),
          child: Container(
            child: Column(
              children: <Widget>[
                Observer(
                  builder: (_) {
                    switch (atendimentoServicoController
                        .qtdeAtendimentosFinalizadosState) {
                      case StoreState.initial:
                      case StoreState.loading:
                        return Container(
                          child: Container(
                            height: 10,
                            width: 10,
                            child: CircularProgressIndicator(),
                          ),
                        );
                      case StoreState.loaded:
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                                atendimentoServicoController
                                    .qtdeAtendimentosFinalizados,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                            // Icon(
                            //   Icons.list,
                            //   color: Colors.black,
                            // ),
                          ],
                        );
                      case StoreState.error:
                        SnackBarUtils.showSnackBar('Atenção',
                            atendimentoServicoController.errorMessage);
                        return Container();
                    }
                    return Container();
                  },
                ),
                Text(
                  'atendimentos finalizados',
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InkWell buildAtendimentosArquivados() {
    return InkWell(
      onTap: () {
        atendimentoServicoController.obterServicos('arquivados', 'string', '');
      },
      child: Container(
        padding: EdgeInsets.only(right: 5),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              color: Colors.orange[300]),
          width: 90,
          padding: EdgeInsets.all(5),
          child: Container(
            child: Column(
              children: <Widget>[
                Observer(
                  builder: (_) {
                    switch (atendimentoServicoController
                        .qtdeAtendimentosArquivadosState) {
                      case StoreState.initial:
                      case StoreState.loading:
                        return Container(
                          child: Container(
                            height: 10,
                            width: 10,
                            child: CircularProgressIndicator(),
                          ),
                        );
                      case StoreState.loaded:
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                                atendimentoServicoController
                                    .qtdeAtendimentosArquivados,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                            // Icon(
                            //   Icons.list,
                            //   color: Colors.black,
                            // ),
                          ],
                        );
                      case StoreState.error:
                        SnackBarUtils.showSnackBar('Atenção',
                            atendimentoServicoController.errorMessage);
                        return Container();
                    }
                    return Container();
                  },
                ),
                Text(
                  'atendimentos arquivados',
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // InkWell buildAtendimentosCalendarioHoje() {
  //   return InkWell(
  //     onTap: () {
  //       atendimentoServicoController.obterServicos('arquivados');
  //     },
  //     child: Container(
  //       padding: EdgeInsets.only(right: 5),
  //       child: Container(
  //         decoration: BoxDecoration(
  //             border: Border.all(color: Colors.black12),
  //             borderRadius: const BorderRadius.all(Radius.circular(12)),
  //             color: Colors.yellow[300]),
  //         width: 90,
  //         padding: EdgeInsets.all(5),
  //         child: Container(
  //           child: Column(
  //             children: <Widget>[
  //               Observer(
  //                 builder: (_) {
  //                   switch (atendimentoServicoController
  //                       .qtdeAtendimentosArquivadosState) {
  //                     case StoreState.initial:
  //                     case StoreState.loading:
  //                       return Container(
  //                         child: Container(
  //                           height: 10,
  //                           width: 10,
  //                           child: CircularProgressIndicator(),
  //                         ),
  //                       );
  //                     case StoreState.loaded:
  //                       return Row(
  //                         mainAxisAlignment: MainAxisAlignment.center,
  //                         children: <Widget>[
  //                           Text(
  //                               atendimentoServicoController
  //                                   .qtdeAtendimentosArquivados,
  //                               style: TextStyle(
  //                                   color: Colors.black,
  //                                   fontSize: 20,
  //                                   fontWeight: FontWeight.bold)),
  //                           Icon(
  //                             Icons.date_range,
  //                             color: Colors.black,
  //                           ),
  //                         ],
  //                       );
  //                     case StoreState.error:
  //                       SnackBarUtils.showSnackBar('Atenção',
  //                           atendimentoServicoController.errorMessage);
  //                       return Container();
  //                   }
  //                   return Container();
  //                 },
  //               ),
  //               Text(
  //                 'atendimentos na semana',
  //                 softWrap: true,
  //                 textAlign: TextAlign.center,
  //                 style: TextStyle(
  //                   color: Colors.black,
  //                   fontSize: 10,
  //                   fontWeight: FontWeight.w300,
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
