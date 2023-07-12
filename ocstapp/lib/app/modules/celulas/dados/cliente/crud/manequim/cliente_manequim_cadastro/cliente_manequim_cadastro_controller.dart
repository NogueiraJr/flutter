import 'package:OCSTApp/app/core/store_state.dart';
import 'package:OCSTApp/app/repositories/cliente_repository.dart';
import 'package:OCSTApp/app/utils/snackbar_utils.dart';
import 'package:OCSTApp/app/utils/store_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:mobx/mobx.dart';

part 'cliente_manequim_cadastro_controller.g.dart';

class ClienteManequimCadastroController = _ClienteManequimCadastroControllerBase
    with _$ClienteManequimCadastroController;

abstract class _ClienteManequimCadastroControllerBase with Store {
  GlobalKey<FormState> globalKeyCad = GlobalKey<FormState>();
  final ClienteRepository clienteRepository;

  _ClienteManequimCadastroControllerBase(this.clienteRepository);

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
  ObservableFuture<bool> _cadFuture;

  @computed
  StoreState get state => StoreUtils.statusCheck(_cadFuture);

  var controllerMaskBusto = new MoneyMaskedTextController(
      decimalSeparator: ',', thousandSeparator: '.');
  var controllerMaskCintura = new MoneyMaskedTextController(
      decimalSeparator: ',', thousandSeparator: '.');
  var controllerMaskQuadril = new MoneyMaskedTextController(
      decimalSeparator: ',', thousandSeparator: '.');

  Future<bool> gravar() async {
    if (!globalKeyCad.currentState.validate()) return false;
    errorMessage = '';
    try {
      if (await clienteRepository
          .existeManequimCadastradoClienteHoje(clienteId)) {
        SnackBarUtils.showSnackBar('Manequim existente',
            'Já existe um manequim cadastrado hoje para este Cliente. Edite este manequim existente.');
        return false;
      }
      _cadFuture = ObservableFuture(clienteRepository.gravarManequim(
        'ins',
        controllerMaskBusto.numberValue,
        controllerMaskCintura.numberValue,
        controllerMaskQuadril.numberValue,
        observacao,
        clienteId,
        id,
      ));
      await _cadFuture.asObservable();
      if (await _cadFuture) {
        SnackBarUtils.showSnackBar(
            'Sucesso!', 'Novo Manequim do Cliente cadastrado com sucesso!');
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
