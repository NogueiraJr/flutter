import 'package:OCSTApp/app/core/store_state.dart';
import 'package:OCSTApp/app/repositories/cliente_repository.dart';
import 'package:OCSTApp/app/utils/snackbar_utils.dart';
import 'package:OCSTApp/app/utils/store_utils.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'cliente_veiculo_editar_controller.g.dart';

class ClienteVeiculoEditarController = _ClienteVeiculoEditarControllerBase
    with _$ClienteVeiculoEditarController;

abstract class _ClienteVeiculoEditarControllerBase with Store {
  GlobalKey<FormState> globalKeyAlt = GlobalKey<FormState>();
  final ClienteRepository clienteRepository;

  _ClienteVeiculoEditarControllerBase(this.clienteRepository);

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
  ObservableFuture<bool> _editarFuture;

  @computed
  StoreState get state => StoreUtils.statusCheck(_editarFuture);

  Future<bool> gravar() async {
    if (!globalKeyAlt.currentState.validate()) return false;
    errorMessage = '';
    try {
      _editarFuture = ObservableFuture(clienteRepository.gravarVeiculoCliente(
          'upd', marca, modelo, ano, cor, placa, observacao, clienteId, id));
      if (await _editarFuture.asObservable()) {
        SnackBarUtils.showSnackBar(
            'Sucesso!', 'Veículo do Cliente alterado com sucesso!');
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
