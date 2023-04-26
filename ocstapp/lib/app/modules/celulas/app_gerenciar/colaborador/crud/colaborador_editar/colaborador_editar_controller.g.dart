// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'colaborador_editar_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ColaboradorEditarController on _ColaboradorEditarControllerBase, Store {
  Computed<StoreState> _$stateComputed;

  @override
  StoreState get state =>
      (_$stateComputed ??= Computed<StoreState>(() => super.state)).value;

  final _$idAtom = Atom(name: '_ColaboradorEditarControllerBase.id');

  @override
  int get id {
    _$idAtom.context.enforceReadPolicy(_$idAtom);
    _$idAtom.reportObserved();
    return super.id;
  }

  @override
  set id(int value) {
    _$idAtom.context.conditionallyRunInAction(() {
      super.id = value;
      _$idAtom.reportChanged();
    }, _$idAtom, name: '${_$idAtom.name}_set');
  }

  final _$pessoaAtom = Atom(name: '_ColaboradorEditarControllerBase.pessoa');

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

  final _$loginAtom = Atom(name: '_ColaboradorEditarControllerBase.login');

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

  final _$emailAtom = Atom(name: '_ColaboradorEditarControllerBase.email');

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

  final _$loginAnteriorAtom =
      Atom(name: '_ColaboradorEditarControllerBase.loginAnterior');

  @override
  String get loginAnterior {
    _$loginAnteriorAtom.context.enforceReadPolicy(_$loginAnteriorAtom);
    _$loginAnteriorAtom.reportObserved();
    return super.loginAnterior;
  }

  @override
  set loginAnterior(String value) {
    _$loginAnteriorAtom.context.conditionallyRunInAction(() {
      super.loginAnterior = value;
      _$loginAnteriorAtom.reportChanged();
    }, _$loginAnteriorAtom, name: '${_$loginAnteriorAtom.name}_set');
  }

  final _$_loginExistenteFutureAtom =
      Atom(name: '_ColaboradorEditarControllerBase._loginExistenteFuture');

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

  final _$_cadastraColaboradorFutureAtom =
      Atom(name: '_ColaboradorEditarControllerBase._cadastraColaboradorFuture');

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

  final _$_bloqueioColaboradorFutureAtom =
      Atom(name: '_ColaboradorEditarControllerBase._bloqueioColaboradorFuture');

  @override
  ObservableFuture<dynamic> get _bloqueioColaboradorFuture {
    _$_bloqueioColaboradorFutureAtom.context
        .enforceReadPolicy(_$_bloqueioColaboradorFutureAtom);
    _$_bloqueioColaboradorFutureAtom.reportObserved();
    return super._bloqueioColaboradorFuture;
  }

  @override
  set _bloqueioColaboradorFuture(ObservableFuture<dynamic> value) {
    _$_bloqueioColaboradorFutureAtom.context.conditionallyRunInAction(() {
      super._bloqueioColaboradorFuture = value;
      _$_bloqueioColaboradorFutureAtom.reportChanged();
    }, _$_bloqueioColaboradorFutureAtom,
        name: '${_$_bloqueioColaboradorFutureAtom.name}_set');
  }

  final _$errorMessageAtom =
      Atom(name: '_ColaboradorEditarControllerBase.errorMessage');

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
      Atom(name: '_ColaboradorEditarControllerBase.loginExistente');

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

  final _$_ColaboradorEditarControllerBaseActionController =
      ActionController(name: '_ColaboradorEditarControllerBase');

  @override
  dynamic changePessoa(String pessoaValue) {
    final _$actionInfo =
        _$_ColaboradorEditarControllerBaseActionController.startAction();
    try {
      return super.changePessoa(pessoaValue);
    } finally {
      _$_ColaboradorEditarControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeLogin(String loginValue) {
    final _$actionInfo =
        _$_ColaboradorEditarControllerBaseActionController.startAction();
    try {
      return super.changeLogin(loginValue);
    } finally {
      _$_ColaboradorEditarControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeEmail(String emailValue) {
    final _$actionInfo =
        _$_ColaboradorEditarControllerBaseActionController.startAction();
    try {
      return super.changeEmail(emailValue);
    } finally {
      _$_ColaboradorEditarControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'id: ${id.toString()},pessoa: ${pessoa.toString()},login: ${login.toString()},email: ${email.toString()},loginAnterior: ${loginAnterior.toString()},errorMessage: ${errorMessage.toString()},loginExistente: ${loginExistente.toString()},state: ${state.toString()}';
    return '{$string}';
  }
}
