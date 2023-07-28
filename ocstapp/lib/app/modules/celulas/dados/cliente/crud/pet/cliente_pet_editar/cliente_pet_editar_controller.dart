import 'package:OCSTApp/app/core/store_state.dart';
import 'package:OCSTApp/app/repositories/cliente_repository.dart';
import 'package:OCSTApp/app/utils/snackbar_utils.dart';
import 'package:OCSTApp/app/utils/store_utils.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'cliente_pet_editar_controller.g.dart';

class ClientePetEditarController = _ClientePetEditarControllerBase
    with _$ClientePetEditarController;

abstract class _ClientePetEditarControllerBase with Store {
  GlobalKey<FormState> globalKeyAlt = GlobalKey<FormState>();
  final ClienteRepository clienteRepository;

  _ClientePetEditarControllerBase(this.clienteRepository);

  @observable
  int id;
  @observable
  int clienteId;

  @observable
  String nome;
  @observable
  String raca;
  @observable
  String anoNascimento;
  @observable
  String mesNascimento;
  @observable
  String cor;
  @observable
  String observacao;

  @action
  changeNome(String nomeValue) => nome = nomeValue;
  @action
  changeRaca(String racaValue) => raca = racaValue;
  @action
  changeAnoNascimento(String anoNascimentoValue) =>
      anoNascimento = anoNascimentoValue;
  @action
  changeMesNascimento(String mesNascimentoValue) =>
      mesNascimento = mesNascimentoValue;
  @action
  changeCor(String corValue) => cor = corValue;
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
      _editarFuture = ObservableFuture(clienteRepository.gravarPetCliente(
          'upd',
          nome,
          raca,
          anoNascimento,
          mesNascimento,
          cor,
          observacao,
          clienteId,
          id));
      if (await _editarFuture.asObservable()) {
        SnackBarUtils.showSnackBar(
            'Sucesso!', 'Pet do Cliente alterado com sucesso!');
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
