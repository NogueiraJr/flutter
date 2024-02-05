import 'package:OCSTApp/app/components/app_flat_button.dart';
import 'package:OCSTApp/app/core/store_state.dart';
import 'package:OCSTApp/app/models/atendimento_servico_model.dart';
import 'package:OCSTApp/app/modules/celulas/operacional/atendimento_servico/atendimento_servico_controller.dart';
import 'package:OCSTApp/app/modules/celulas/operacional/atendimento_servico/components/faturamento_atendimento_servico_item.dart';
import 'package:OCSTApp/app/modules/celulas/operacional/atendimento_servico/components/produto_atendimento_servico_item.dart';
import 'package:OCSTApp/app/modules/principal/principal_controller.dart';
import 'package:OCSTApp/app/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

class AtendimentoServicoResumoDialog extends StatelessWidget {
  final AtendimentoServicoModel item;
  const AtendimentoServicoResumoDialog({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nF = new NumberFormat("#,###,##0.00", "pt_BR");
    final atendimentoServicoController =
        GetIt.I.get<AtendimentoServicoController>();
    atendimentoServicoController.consultarProdutosDoServico(item.id);
    atendimentoServicoController.consultarFaturamentoDoServico(item.id);
    _consultarObjetoDoAtendimento();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('Resumo do Atendimento'),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 3, right: 3, bottom: 3),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text(item.descricao,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w500)),
                      dense: true,
                    ),
                    Visibility(
                      visible: item.usuarioPessoa != null,
                      child: ListTile(
                        title: Text('Colaborador(a): ${item.usuarioPessoa}',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w300)),
                        dense: true,
                      ),
                    ),
                    _makeObserverDoObjeto(),
                    SizedBox(height: 10),
                    ListTile(
                      leading: Icon(Icons.play_circle_outline,
                          size: 40, color: Colors.black12),
                      title: Text(
                        'Iniciar ${item.iniciarSemana}',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 1.2),
                      ),
                      subtitle: Text(
                        '${item.iniciar}',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                    //
                    Visibility(
                      visible: item.iniciado != null,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Container(
                          padding: EdgeInsets.only(left: 12.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.blue,
                          ),
                          height: 55,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0)),
                              color: Colors.blue[50],
                            ),
                            child: ListTile(
                              isThreeLine: true,
                              dense: true,
                              leading: Icon(Icons.check,
                                  size: 40, color: Colors.transparent),
                              trailing: Icon(Icons.check_circle_outline,
                                  color: Colors.blue),
                              title: Text(
                                'Iniciado ${item.iniciadoSemana}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300,
                                    letterSpacing: 1.2),
                              ),
                              subtitle: Text(
                                '${item.iniciado}',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.check_circle_outline,
                          size: 40, color: Colors.black12),
                      title: Row(
                        children: <Widget>[
                          Text(
                            'Finalizar ${item.finalizarSemana}',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w300,
                                letterSpacing: 1.2),
                          ),
                        ],
                      ),
                      subtitle: Text(
                        '${item.finalizar}',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                    Visibility(
                      visible: item.iniciado != null && item.finalizado != null,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Container(
                          padding: EdgeInsets.only(left: 12.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.green,
                          ),
                          height: 55,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0)),
                              color: Colors.green[50],
                            ),
                            child: ListTile(
                              isThreeLine: true,
                              dense: true,
                              leading: Icon(Icons.check,
                                  size: 40, color: Colors.transparent),
                              trailing: Icon(Icons.check_circle_outline,
                                  color: Colors.green),
                              title: Text(
                                'Finalizado ${item.finalizadoSemana}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300,
                                    letterSpacing: 1.2),
                              ),
                              subtitle: Text(
                                '${item.finalizado}',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Observer(
                      builder: (_) {
                        switch (atendimentoServicoController
                            .produtosDoServicoState) {
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
                            return _makeProdutosDoServico();
                          case StoreState.error:
                            // SnackBarUtils.showSnackBar(
                            //     'Atenção', controller.errorMessage);
                            return Container();
                        }
                        return Container();
                      },
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: AppFlatButton(
                          label: 'Inserir Produto',
                          onPressed: () => {
                                atendimentoServicoController.origemProdutoTela =
                                    'editar',
                                atendimentoServicoController
                                        .origemProdutoAtendimentoServicoId =
                                    item.id,
                                atendimentoServicoController.escolherProdutos(),
                              }),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Preço do Atendimento",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w300),
                    ),
                    Observer(
                      builder: (_) {
                        switch (atendimentoServicoController
                            .produtosDoServicoState) {
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
                            return _makeValorTotalProdutos(
                                nF, atendimentoServicoController);
                          case StoreState.error:
                            // SnackBarUtils.showSnackBar(
                            //     'Atenção', controller.errorMessage);
                            return Container();
                        }
                        return Container();
                      },
                    ),
                    Visibility(
                      visible:
                          item.observacao != null && item.observacao.length > 0,
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 10),
                          Icon(Icons.speaker_notes,
                              size: 40, color: Colors.black12),
                          // Text(
                          //   "Observação",
                          //   style: TextStyle(color: Colors.black, fontSize: 20),
                          // ),
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              '${item.observacao}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w200),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        padding: EdgeInsets.only(top: 15, bottom: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          color: Colors.purple[50],
                        ),
                        child: Observer(
                          builder: (_) {
                            switch (atendimentoServicoController
                                .faturamentoDoServicoState) {
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
                                return _makeFaturamentoDoServico(nF);
                              case StoreState.error:
                                // SnackBarUtils.showSnackBar(
                                //     'Atenção', controller.errorMessage);
                                return Container();
                            }
                            return Container();
                          },
                        ),
                      ),
                    ),
                    // SizedBox(height: 10),
                    // Text(
                    //   "Valor Total das Parcelas",
                    //   style: TextStyle(color: Colors.black, fontSize: 20),
                    // ),
                    // Observer(
                    //   builder: (_) {
                    //     switch (atendimentoServicoController
                    //         .faturamentoDoServicoState) {
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
                    //         return _makeValorTotalParcelasFaturamento(
                    //             nF, atendimentoServicoController);
                    //       case StoreState.error:
                    //         // SnackBarUtils.showSnackBar(
                    //         //     'Atenção', controller.errorMessage);
                    //         return Container();
                    //     }
                    //     return Container();
                    //   },
                    // ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Observer _makeObserverDoObjeto() {
    final controllerPrincipal = GetIt.I.get<PrincipalController>();
    var atendimentoServicoController =
        GetIt.I.get<AtendimentoServicoController>();
    switch (controllerPrincipal.sistemaRef) {
      case 'refOficinaCarros':
        return Observer(
          builder: (_) {
            switch (atendimentoServicoController.clienteVeiculoState) {
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
                return _makeClienteVeiculo(atendimentoServicoController);
              case StoreState.error:
                // SnackBarUtils.showSnackBar(
                //     'Atenção', controller.errorMessage);
                return Container();
            }
            return Container();
          },
        );
        break;
      case 'refPetShop':
        return Observer(
          builder: (_) {
            switch (atendimentoServicoController.clientePetState) {
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
                return _makeClientePet(atendimentoServicoController);
              case StoreState.error:
                // SnackBarUtils.showSnackBar(
                //     'Atenção', controller.errorMessage);
                return Container();
            }
            return Container();
          },
        );
        break;
      case 'refClinicaVeterinaria':
        return Observer(
          builder: (_) {
            switch (atendimentoServicoController.clientePetState) {
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
                return _makeClientePet(atendimentoServicoController);
              case StoreState.error:
                // SnackBarUtils.showSnackBar(
                //     'Atenção', controller.errorMessage);
                return Container();
            }
            return Container();
          },
        );
        break;
      default:
        return Observer(builder: (_) {
          return Container();
        });
    }
  }

  Future<void> _consultarObjetoDoAtendimento() async {
    final controllerPrincipal = GetIt.I.get<PrincipalController>();
    var atendimentoServicoController =
        GetIt.I.get<AtendimentoServicoController>();
    switch (controllerPrincipal.sistemaRef) {
      case 'refOficinaCarros':
        atendimentoServicoController.consultarClienteVeiculo(item.id);
        break;
      case 'refPetShop':
        atendimentoServicoController.consultarClientePet(item.id);
        break;
      case 'refClinicaVeterinaria':
        atendimentoServicoController.consultarClientePet(item.id);
        break;
      default:
    }
  }

  Text _makeValorTotalProdutos(NumberFormat nF,
      AtendimentoServicoController atendimentoServicoController) {
    return Text(
      // 'R\$ ${nF.format(item.valor)}',
      // 'R\$ ${nF.format(atendimentoServicoController.produtosDoServico.fold(0, (prev, produtoPreco) => prev + produtoPreco))}',
      // 'R\$ ${nF.format(atendimentoServicoController.produtosDoServico.reduce((prev, item) => prev + item))}',
      // 'R\$ ${nF.format(atendimentoServicoController.produtosDoServico.length)} //teste apenas para ver se mostrava algo',
      'R\$ ${nF.format(atendimentoServicoController.produtosDoServicoValorTotal)}',
      style: TextStyle(
          color: Colors.black, fontSize: 30, fontWeight: FontWeight.w300),
    );
  }

  Text _makeValorTotalParcelasFaturamento(NumberFormat nF,
      AtendimentoServicoController atendimentoServicoController) {
    return Text(
      // 'R\$ ${nF.format(item.valor)}',
      // 'R\$ ${nF.format(atendimentoServicoController.produtosDoServico.fold(0, (prev, produtoPreco) => prev + produtoPreco))}',
      // 'R\$ ${nF.format(atendimentoServicoController.produtosDoServico.reduce((prev, item) => prev + item))}',
      // 'R\$ ${nF.format(atendimentoServicoController.produtosDoServico.length)} //teste apenas para ver se mostrava algo',
      'R\$ ${nF.format(atendimentoServicoController.faturamentoDoServicoValorTotal)}',
      style: TextStyle(
          color: Colors.black, fontSize: 30, fontWeight: FontWeight.w300),
    );
  }

  Visibility _makeProdutosDoServico() {
    final atendimentoServicoController =
        GetIt.I.get<AtendimentoServicoController>();
    return Visibility(
      visible: atendimentoServicoController.produtosDoServico.length > 0,
      child: Column(
        children: <Widget>[
          Text(
            "PRODUTOS",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                letterSpacing: 5,
                fontWeight: FontWeight.w300),
          ),
          ListView.separated(
            controller: ScrollController(keepScrollOffset: false),
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 10),
            itemBuilder: (_, index) => ProdutoAtendimentoServicoItem(
              item: atendimentoServicoController.produtosDoServico[index],
              atendimentoServicoController: atendimentoServicoController,
            ),
            separatorBuilder: (_, index) => Divider(color: Colors.black),
            itemCount: atendimentoServicoController.produtosDoServico.length,
          ),
        ],
      ),
    );
  }

  Visibility _makeClienteVeiculo(
      AtendimentoServicoController atendimentoServicoController) {
    // final atendimentoServicoController =
    //     GetIt.I.get<AtendimentoServicoController>();
    return Visibility(
      visible: atendimentoServicoController.clienteVeiculo != null,
      child: Column(
        children: <Widget>[
          Text(
            "VEÍCULO",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                letterSpacing: 5,
                fontWeight: FontWeight.w300),
          ),
          ListTile(
            leading:
                Icon(Icons.directions_car, size: 40, color: Colors.black12),
            title: Text(
              '${atendimentoServicoController.clienteVeiculo.marca} ${atendimentoServicoController.clienteVeiculo.modelo} ${atendimentoServicoController.clienteVeiculo.cor}',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 1.0),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Ano ${atendimentoServicoController.clienteVeiculo.ano}, Placa ${atendimentoServicoController.clienteVeiculo.placa}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1.1,
                  ),
                ),
                Text(
                  '${atendimentoServicoController.clienteVeiculo.observacao}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Visibility _makeClientePet(
      AtendimentoServicoController atendimentoServicoController) {
    // final atendimentoServicoController =
    //     GetIt.I.get<AtendimentoServicoController>();
    return Visibility(
      visible: atendimentoServicoController.clientePet != null,
      child: Column(
        children: <Widget>[
          Text(
            "PET",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                letterSpacing: 5,
                fontWeight: FontWeight.w300),
          ),
          ListTile(
            leading: Icon(Icons.pets, size: 40, color: Colors.black12),
            title: Text(
              '${atendimentoServicoController.clientePet.raca} ${atendimentoServicoController.clientePet.cor}',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 1.0),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '${atendimentoServicoController.clientePet.nome} (${atendimentoServicoController.clientePet.mesNascimento}/${atendimentoServicoController.clientePet.anoNascimento})',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1.1,
                  ),
                ),
                Text(
                  '${atendimentoServicoController.clientePet.observacao}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Visibility _makeFaturamentoDoServico(NumberFormat nF) {
    final atendimentoServicoController =
        GetIt.I.get<AtendimentoServicoController>();
    return Visibility(
      visible: atendimentoServicoController.faturamentoDoServico.length > 0,
      child: Column(
        children: <Widget>[
          Text(
            "FATURAMENTO",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                letterSpacing: 5,
                fontWeight: FontWeight.w300),
          ),
          ListView.separated(
            controller: ScrollController(keepScrollOffset: false),
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 10),
            itemBuilder: (_, index) => FaturamentoAtendimentoServicoItem(
              item: atendimentoServicoController.faturamentoDoServico[index],
              controller: atendimentoServicoController,
            ),
            separatorBuilder: (_, index) => Divider(color: Colors.black),
            itemCount: atendimentoServicoController.faturamentoDoServico.length,
          ),
          // SizedBox(height: 10),
          Text(
            "Valor Total do Faturamento",
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w300),
          ),
          _makeValorTotalParcelasFaturamento(nF, atendimentoServicoController),
        ],
      ),
    );
  }
}
