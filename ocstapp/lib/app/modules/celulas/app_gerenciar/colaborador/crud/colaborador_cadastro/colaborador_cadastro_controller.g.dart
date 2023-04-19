// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'colaborador_cadastro_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ColaboradorCadastroController
    on _ColaboradorCadastroControllerBase, Store {
  Computed<StoreState> _$stateComputed;

  @override
  StoreState get state =>
      (_$stateComputed ??= Computed<StoreState>(() => super.state)).value;

  final _$pessoaAtom = Atom(name: '_ColaboradorCadastroControllerBase.pessoa');

  @override
  String get pessoa {
    _$pessoaAtom.context.enforceReadPolicy(_$pessoaAtom);
    _$pessoaAtom.reportObserved();
    return super.pessoa;
  }

  @override
  set pessoa(String value) {
    _$pessoaAtom.context.conditionallyRunInAction(() {
      super.pessoa = value;
      _$pessoaAtom.reportChanged();
    }, _$pessoaAtom, name: '${_$pessoaAtom.name}_set');
  }

  final _$loginAtom = Atom(name: '_ColaboradorCadastroControllerBase.login');

  @override
  String get login {
    _$loginAtom.context.enforceReadPolicy(_$loginAtom);
    _$loginAtom.reportObserved();
    return super.login;
  }

  @override
  set login(String value) {
    _$loginAtom.context.conditionallyRunInAction(() {
      super.login = value;
      _$loginAtom.reportChanged();
    }, _$loginAtom, name: '${_$loginAtom.name}_set');
  }

  final _$emailAtom = Atom(name: '_ColaboradorCadastroControllerBase.email');

  @override
  String get email {
    _$emailAtom.context.enforceReadPolicy(_$emailAtom);
    _$emailAtom.reportObserved();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.context.conditionallyRunInAction(() {
      super.email = value;
      _$emailAtom.reportChanged();
    }, _$emailAtom, name: '${_$emailAtom.name}_set');
  }

  final _$senhaAtom = Atom(name: '_ColaboradorCadastroControllerBase.senha');

  @override
  String get senha {
    _$senhaAtom.context.enforceReadPolicy(_$senhaAtom);
    _$senhaAtom.reportObserved();
    return super.senha;
  }

  @override
  set senha(String value) {
    _$senhaAtom.context.conditionallyRunInAction(() {
      super.senha = value;
      _$senhaAtom.reportChanged();
    }, _$senhaAtom, name: '${_$senhaAtom.name}_set');
  }

  final _$confirmaSenhaAtom =
      Atom(name: '_ColaboradorCadastroControllerBase.confirmaSenha');

  @override
  String get confirmaSenha {
    _$confirmaSenhaAtom.context.enforceReadPolicy(_$confirmaSenhaAtom);
    _$confirmaSenhaAtom.reportObserved();
    return super.confirmaSenha;
  }

  @override
  set confirmaSenha(String value) {
    _$confirmaSenhaAtom.context.conditionallyRunInAction(() {
      super.confirmaSenha = value;
      _$confirmaSenhaAtom.reportChanged();
    }, _$confirmaSenhaAtom, name: '${_$confirmaSenhaAtom.name}_set');
  }

  final _$_cadastraColaboradorFutureAtom = Atom(
      name: '_ColaboradorCadastroControllerBase._cadastraColaboradorFuture');

  @override
  ObservableFuture<dynamic> get _cadastraColaboradorFuture {
    _$_cadastraColaboradorFutureAtom.context
        .enforceReadPolicy(_$_cadastraColaboradorFutureAtom);
    _$_cadastraColaboradorFutureAtom.reportObserved();
    return super._cadastraColaboradorFuture;
  }

  @override
  set _cadastraColaboradorFuture(ObservableFuture<dynamic> value) {
    _$_cadastraColaboradorFutureAtom.context.conditionallyRunInAction(() {
      super._cadastraColaboradorFuture = value;
      _$_cadastraColaboradorFutureAtom.reportChanged();
    }, _$_cadastraColaboradorFutureAtom,
        name: '${_$_cadastraColaboradorFutureAtom.name}_set');
  }

  final _$_loginExistenteFutureAtom =
      Atom(name: '_ColaboradorCadastroControllerBase._loginExistenteFuture');

  @override
  ObservableFuture<RespostaModel> get _loginExistenteFuture {
    _$_loginExistenteFutureAtom.context
        .enforceReadPolicy(_$_loginExistenteFutureAtom);
    _$_loginExistenteFutureAtom.reportObserved();
    return super._loginExistenteFuture;
  }

  @override
  set _loginExistenteFuture(ObservableFuture<RespostaModel> value) {
    _$_loginExistenteFutureAtom.context.conditionallyRunInAction(() {
      super._loginExistenteFuture = value;
      _$_loginExistenteFutureAtom.reportChanged();
    }, _$_loginExistenteFutureAtom,
        name: '${_$_loginExistenteFutureAtom.name}_set');
  }

  final _$errorMessageAtom =
      Atom(name: '_ColaboradorCadastroControllerBase.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.context.enforceReadPolicy(_$errorMessageAtom);
    _$errorMessageAtom.reportObserved();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.context.conditionallyRunInAction(() {
      super.errorMessage = value;
      _$errorMessageAtom.reportChanged();
    }, _$errorMessageAtom, name: '${_$errorMessageAtom.name}_set');
  }

  final _$loginExistenteAtom =
      Atom(name: '_ColaboradorCadastroControllerBase.loginExistente');

  @override
  String get loginExistente {
    _$loginExistenteAtom.context.enforceReadPolicy(_$loginExistenteAtom);
    _$loginExistenteAtom.reportObserved();
    return super.loginExistente;
  }

  @override
  set loginExistente(String value) {
    _$loginExistenteAtom.context.conditionallyRunInAction(() {
      super.loginExistente = value;
      _$loginExistenteAtom.reportChanged();
    }, _$loginExistenteAtom, name: '${_$loginExistenteAtom.name}_set');
  }

  final _$_ColaboradorCadastroControllerBaseActionController =
      ActionController(name: '_ColaboradorCadastroControllerBase');

  @override
  dynamic changePessoa(String pessoaValue) {
    final _$actionInfo =
        _$_ColaboradorCadastroControllerBaseActionController.startAction();
    try {
      return super.changePessoa(pessoaValue);
    } finally {
      _$_ColaboradorCadastroControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeLogin(String loginValue) {
    final _$actionInfo =
        _$_ColaboradorCadastroControllerBaseActionController.startAction();
    try {
      return super.changeLogin(loginValue);
    } finally {
      _$_ColaboradorCadastroControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeEmail(String emailValue) {
    final _$actionInfo =
        _$_ColaboradorCadastroControllerBaseActionController.startAction();
    try {
      return super.changeEmail(emailValue);
    } finally {
      _$_ColaboradorCadastroControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeSenha(String senhaValue) {
    final _$actionInfo =
        _$_ColaboradorCadastroControllerBaseActionController.startAction();
    try {
      return super.changeSenha(senhaValue);
    } finally {
      _$_ColaboradorCadastroControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeConfirmaSenha(String confirmaSenhaValue) {
    final _$actionInfo =
        _$_ColaboradorCadastroControllerBaseActionController.startAction();
    try {
      return super.changeConfirmaSenha(confirmaSenhaValue);
    } finally {
      _$_ColaboradorCadastroControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'pessoa: ${pessoa.toString()},login: ${login.toString()},email: ${email.toString()},senha: ${senha.toString()},confirmaSenha: ${confirmaSenha.toString()},errorMessage: ${errorMessage.toString()},loginExistente: ${loginExistente.toString()},state: ${state.toString()}';
    return '{$string}';
  }
}
