import 'package:OCSTApp/app/core/store_state.dart';
import 'package:OCSTApp/app/repositories/cliente_repository.dart';
import 'package:OCSTApp/app/utils/snackbar_utils.dart';
import 'package:OCSTApp/app/utils/store_utils.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'cliente_veiculo_cadastro_controller.g.dart';

class ClienteVeiculoCadastroController = _ClienteVeiculoCadastroControllerBase
    with _$ClienteVeiculoCadastroController;

abstract class _ClienteVeiculoCadastroControllerBase with Store {
  GlobalKey<FormState> globalKeyCad = GlobalKey<FormState>();
  final ClienteRepository clienteRepository;

  _ClienteVeiculoCadastroControllerBase(this.clienteRepository);

  @observable
  int id;
  @observable
  int clienteId;

  @observable
  String marca;
  @observable
  String modelo;
  @observable
  String ano;
  @observable
  String cor;
  @observable
  String placa;
  @observable
  String observacao;

  @action
  changeMarca(String marcaValue) => marca = marcaValue;
  @action
  changeModelo(String modeloValue) => modelo = modeloValue;
  @action
  changeAno(String anoValue) => ano = anoValue;
  @action
  changeCor(String corValue) => cor = corValue;
  @action
  changePlaca(String placaValue) => placa = placaValue;
  @action
  changeObservacao(String observacaoValue) => observacao = observacaoValue;

  @observable
  String errorMessage;

  @observable
  ObservableFuture<bool> _cadFuture;

  @computed
  StoreState get state => StoreUtils.statusCheck(_cadFuture);

  Future<bool> gravar() async {
    if (!globalKeyCad.currentState.validate()) return false;
    errorMessage = '';
    try {
      _cadFuture = ObservableFuture(clienteRepository.gravarVeiculoCliente(
          'ins', marca, modelo, ano, cor, placa, observacao, clienteId, id));
      await _cadFuture.asObservable();
      if (await _cadFuture) {
        SnackBarUtils.showSnackBar(
            'Sucesso!', 'Novo Veiculo do Cliente cadastrado com sucesso!');
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
