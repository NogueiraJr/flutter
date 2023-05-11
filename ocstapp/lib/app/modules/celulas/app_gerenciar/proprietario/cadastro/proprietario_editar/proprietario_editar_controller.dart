import 'package:OCSTApp/app/core/store_state.dart';
import 'package:OCSTApp/app/models/resposta_model.dart';
import 'package:OCSTApp/app/repositories/usuario_repository.dart';
import 'package:OCSTApp/app/utils/store_utils.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'proprietario_editar_controller.g.dart';

class ProprietarioEditarController = _ProprietarioEditarControllerBase
    with _$ProprietarioEditarController;

abstract class _ProprietarioEditarControllerBase with Store {
  GlobalKey<FormState> globalKeyAlt = GlobalKey<FormState>();
  final UsuarioRepository usuarioRepository;
  _ProprietarioEditarControllerBase(
    this.usuarioRepository,
  );

  @observable
  int id;

  @observable
  String pessoa;
  @observable
  String empresa;
  @observable
  String login;
  @observable
  String email;

  @observable
  String loginAnterior;

  @action
  changePessoa(String pessoaValue) => pessoa = pessoaValue;
  @action
  changeEmpresa(String empresaValue) => empresa = empresaValue;
  @action
  changeLogin(String loginValue) => login = loginValue;
  @action
  changeEmail(String emailValue) => email = emailValue;

  @observable
  ObservableFuture<RespostaModel> _loginExistenteFuture;

  @observable
  ObservableFuture _cadastraColaboradorFuture;

  @computed
  StoreState get state => StoreUtils.statusCheck(_cadastraColaboradorFuture);

  @observable
  String errorMessage;

  @observable
  String loginExistente;

  Future<void> gravar(item) async {
    if (globalKeyAlt.currentState.validate()) {
      errorMessage = '';
      _usuarioExiste();
    }
  }

  Future<void> _usuarioExiste() async {
    if (globalKeyAlt.currentState.validate()) {
      errorMessage = '';
      try {
        if (login.toUpperCase() != loginAnterior.toUpperCase()) {
          _loginExistenteFuture =
              ObservableFuture(usuarioRepository.usuarioExiste(login));
          RespostaModel resposta = await _loginExistenteFuture;
          loginExistente = resposta.resposta;
          if (loginExistente == 'SIM') {
            errorMessage =
                'O login $login já existe cadastrado.\nPor favor, tente usar outro usuário no login.';
            return;
          }
        }
        await _salvarDados();
      } catch (e) {
        print(e);
        errorMessage = '$e';
      }
    }
  }

  Future<void> _salvarDados() async {
    if (globalKeyAlt.currentState.validate()) {
      errorMessage = '';
      try {
        final loginPai = ''; //await usuarioRepository.getLogin();
        _cadastraColaboradorFuture = ObservableFuture(
            usuarioRepository.gravarProprietario(
                'ALT', id, login, '', email, pessoa, loginPai, empresa));
        return await _cadastraColaboradorFuture;
      } catch (e) {
        print(e);
        errorMessage = '$e';
      }
    }
  }
}
