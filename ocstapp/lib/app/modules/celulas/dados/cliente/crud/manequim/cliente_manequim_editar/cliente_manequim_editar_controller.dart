import 'package:OCSTApp/app/core/store_state.dart';
import 'package:OCSTApp/app/repositories/cliente_repository.dart';
import 'package:OCSTApp/app/utils/snackbar_utils.dart';
import 'package:OCSTApp/app/utils/store_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:mobx/mobx.dart';

part 'cliente_manequim_editar_controller.g.dart';

class ClienteManequimEditarController = _ClienteManequimEditarControllerBase
    with _$ClienteManequimEditarController;

abstract class _ClienteManequimEditarControllerBase with Store {
  GlobalKey<FormState> globalKeyAlt = GlobalKey<FormState>();
  final ClienteRepository clienteRepository;

  _ClienteManequimEditarControllerBase(this.clienteRepository);

  @observable
  int id;
  @observable
  int clienteId;

  @observable
  String busto;
  @observable
  String cintura;
  @observable
  String quadril;
  @observable
  String observacao;

  @action
  changeBusto(String bustoValue) => busto = bustoValue;
  @action
  changeCintura(String cinturaValue) => cintura = cinturaValue;
  @action
  changeQuadril(String quadrilValue) => quadril = quadrilValue;
  @action
  changeObservacao(String observacaoValue) => observacao = observacaoValue;

  @observable
  String errorMessage;

  @observable
  ObservableFuture<bool> _editarFuture;

  @computed
  StoreState get state => StoreUtils.statusCheck(_editarFuture);

  var controllerMaskBusto = new MoneyMaskedTextController(
      decimalSeparator: ',', thousandSeparator: '.');
  var controllerMaskCintura = new MoneyMaskedTextController(
      decimalSeparator: ',', thousandSeparator: '.');
  var controllerMaskQuadril = new MoneyMaskedTextController(
      decimalSeparator: ',', thousandSeparator: '.');

  Future<bool> gravar() async {
    if (!globalKeyAlt.currentState.validate()) return false;
    errorMessage = '';
    try {
      _editarFuture = ObservableFuture(clienteRepository.gravarManequim(
        'upd',
        controllerMaskBusto.numberValue,
        controllerMaskCintura.numberValue,
        controllerMaskQuadril.numberValue,
        observacao,
        clienteId,
        id,
      ));
      if (await _editarFuture.asObservable()) {
        SnackBarUtils.showSnackBar(
            'Sucesso!', 'Manequim do Cliente alterado com sucesso!');
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      errorMessage = '$e';
      return false;
    }
  }
}
