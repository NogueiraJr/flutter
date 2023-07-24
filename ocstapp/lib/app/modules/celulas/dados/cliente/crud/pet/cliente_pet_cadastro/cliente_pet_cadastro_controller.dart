import 'package:OCSTApp/app/core/store_state.dart';
import 'package:OCSTApp/app/repositories/cliente_repository.dart';
import 'package:OCSTApp/app/utils/snackbar_utils.dart';
import 'package:OCSTApp/app/utils/store_utils.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'cliente_pet_cadastro_controller.g.dart';

class ClientePetCadastroController = _ClientePetCadastroControllerBase
    with _$ClientePetCadastroController;

abstract class _ClientePetCadastroControllerBase with Store {
  GlobalKey<FormState> globalKeyCad = GlobalKey<FormState>();
  final ClienteRepository clienteRepository;

  _ClientePetCadastroControllerBase(this.clienteRepository);

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
  ObservableFuture<bool> _cadFuture;

  @computed
  StoreState get state => StoreUtils.statusCheck(_cadFuture);

  Future<bool> gravar() async {
    if (!globalKeyCad.currentState.validate()) return false;
    errorMessage = '';
    try {
      _cadFuture = ObservableFuture(clienteRepository.gravarPetCliente(
          'ins',
          nome,
          raca,
          anoNascimento,
          mesNascimento,
          cor,
          observacao,
          clienteId,
          id));
      await _cadFuture.asObservable();
      if (await _cadFuture) {
        SnackBarUtils.showSnackBar(
            'Sucesso!', 'Novo Pet do Cliente cadastrado com sucesso!');
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
