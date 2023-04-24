import 'package:OCSTApp/app/core/store_state.dart';
import 'package:OCSTApp/app/models/resposta_model.dart';
import 'package:OCSTApp/app/repositories/usuario_repository.dart';
import 'package:OCSTApp/app/utils/store_utils.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'colaborador_editar_controller.g.dart';

class ColaboradorEditarController = _ColaboradorEditarControllerBase
    with _$ColaboradorEditarController;

abstract class _ColaboradorEditarControllerBase with Store {
  GlobalKey<FormState> globalKeyAlt = GlobalKey<FormState>();
  final UsuarioRepository usuarioRepository;
  _ColaboradorEditarControllerBase(
    this.usuarioRepository,
  );

  @observable
  int id;

  @observable
  String pessoa;
  @observable
  String login;
  @observable
  String email;

  @observable
  String loginAnterior;

  @action
  changePessoa(String pessoaValue) => pessoa = pessoaValue;
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
  ObservableFuture _bloqueioColaboradorFuture;

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
        if (login != loginAnterior) {
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
        await _salvarColaborador();
      } catch (e) {
        print(e);
        errorMessage = '$e';
      }
    }
  }

  Future<void> _salvarColaborador() async {
    if (globalKeyAlt.currentState.validate()) {
      errorMessage = '';
      try {
        final loginPai = await usuarioRepository.getUltimoLoginParam();
        _cadastraColaboradorFuture = ObservableFuture(usuarioRepository
            .gravarUsuarioFilho('ALT', id, login, '', email, pessoa, loginPai));
        return await _cadastraColaboradorFuture;
      } catch (e) {
        print(e);
        errorMessage = '$e';
      }
    }
  }

  Future<String> bloqueioAcessoColaborador() async {
    errorMessage = '';
    try {
      _bloqueioColaboradorFuture =
          ObservableFuture(usuarioRepository.bloqueioAcessoColaborador(id));
      RespostaModel resposta = await _bloqueioColaboradorFuture.asObservable();
      return resposta.resposta;
    } catch (e) {
      print(e);
      errorMessage =
          'Aplicativo: Problemas no Bloqueio / Desbloqueio do Colaborador';
      return '';
    }
  }
}
