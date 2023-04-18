import 'package:OCSTApp/app/core/store_state.dart';
import 'package:OCSTApp/app/models/resposta_model.dart';
import 'package:OCSTApp/app/repositories/usuario_repository.dart';
import 'package:OCSTApp/app/utils/store_utils.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'colaborador_cadastro_controller.g.dart';

class ColaboradorCadastroController = _ColaboradorCadastroControllerBase
    with _$ColaboradorCadastroController;

abstract class _ColaboradorCadastroControllerBase with Store {
  GlobalKey<FormState> globalKeyCad = GlobalKey<FormState>();
  final UsuarioRepository usuarioRepository;

  _ColaboradorCadastroControllerBase(
    this.usuarioRepository,
  );

  @observable
  String pessoa;
  @observable
  String login;
  @observable
  String email;
  @observable
  String senha;
  @observable
  String confirmaSenha;

  @action
  changePessoa(String pessoaValue) => pessoa = pessoaValue;
  @action
  changeLogin(String loginValue) => login = loginValue;
  @action
  changeEmail(String emailValue) => email = emailValue;
  @action
  changeSenha(String senhaValue) => senha = senhaValue;
  @action
  changeConfirmaSenha(String confirmaSenhaValue) =>
      confirmaSenha = confirmaSenhaValue;

  @observable
  ObservableFuture _cadastraColaboradorFuture;

  @observable
  ObservableFuture<RespostaModel> _loginExistenteFuture;

  @computed
  StoreState get state => StoreUtils.statusCheck(_cadastraColaboradorFuture);

  @observable
  String errorMessage;

  @observable
  String loginExistente;

  Future<void> salvarColaborador() async {
    if (globalKeyCad.currentState.validate()) {
      errorMessage = '';
      _usuarioExiste();
    }
  }

  Future<void> _usuarioExiste() async {
    if (globalKeyCad.currentState.validate()) {
      errorMessage = '';
      try {
        _loginExistenteFuture =
            ObservableFuture(usuarioRepository.usuarioExiste(login));
        RespostaModel resposta = await _loginExistenteFuture;
        loginExistente = resposta.resposta;
        if (loginExistente == 'NAO') {
          await _salvarColaborador();
          final idUsuarioCriado = await usuarioRepository
              .consultarUsuarioLogado(login)
              .then((r) => r.id);
          await usuarioRepository
              .criarAcessosFixosDoUsuarioComum(idUsuarioCriado);
        } else {
          errorMessage =
              'O login $login já existe cadastrado.\nPor favor, tente usar outro usuário no login.';
        }
      } catch (e) {
        print(e);
        errorMessage = '$e';
      }
    }
  }

  Future<void> _salvarColaborador() async {
    if (globalKeyCad.currentState.validate()) {
      errorMessage = '';
      try {
        final loginPai = await usuarioRepository.getUltimoLoginParam();
        _cadastraColaboradorFuture = ObservableFuture(
            usuarioRepository.gravarUsuarioFilho(
                'CAD', null, login, senha, email, pessoa, loginPai));
        return await _cadastraColaboradorFuture;
      } catch (e) {
        print(e);
        errorMessage = '$e';
      }
    }
  }
}
