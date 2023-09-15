// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fornecedor_cadastro_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FornecedorCadastroController
    on _FornecedorCadastroControllerBase, Store {
  Computed<StoreState> _$stateComputed;

  @override
  StoreState get state =>
      (_$stateComputed ??= Computed<StoreState>(() => super.state)).value;

  final _$nomeAtom = Atom(name: '_FornecedorCadastroControllerBase.nome');

  @override
  String get nome {
    _$nomeAtom.context.enforceReadPolicy(_$nomeAtom);
    _$nomeAtom.reportObserved();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.context.conditionallyRunInAction(() {
      super.nome = value;
      _$nomeAtom.reportChanged();
    }, _$nomeAtom, name: '${_$nomeAtom.name}_set');
  }

  final _$telefoneAtom =
      Atom(name: '_FornecedorCadastroControllerBase.telefone');

  @override
  String get telefone {
    _$telefoneAtom.context.enforceReadPolicy(_$telefoneAtom);
    _$telefoneAtom.reportObserved();
    return super.telefone;
  }

  @override
  set telefone(String value) {
    _$telefoneAtom.context.conditionallyRunInAction(() {
      super.telefone = value;
      _$telefoneAtom.reportChanged();
    }, _$telefoneAtom, name: '${_$telefoneAtom.name}_set');
  }

  final _$emailAtom = Atom(name: '_FornecedorCadastroControllerBase.email');

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

  final _$usuarioIdAtom =
      Atom(name: '_FornecedorCadastroControllerBase.usuarioId');

  @override
  int get usuarioId {
    _$usuarioIdAtom.context.enforceReadPolicy(_$usuarioIdAtom);
    _$usuarioIdAtom.reportObserved();
    return super.usuarioId;
  }

  @override
  set usuarioId(int value) {
    _$usuarioIdAtom.context.conditionallyRunInAction(() {
      super.usuarioId = value;
      _$usuarioIdAtom.reportChanged();
    }, _$usuarioIdAtom, name: '${_$usuarioIdAtom.name}_set');
  }

  final _$tagsAtom = Atom(name: '_FornecedorCadastroControllerBase.tags');

  @override
  String get tags {
    _$tagsAtom.context.enforceReadPolicy(_$tagsAtom);
    _$tagsAtom.reportObserved();
    return super.tags;
  }

  @override
  set tags(String value) {
    _$tagsAtom.context.conditionallyRunInAction(() {
      super.tags = value;
      _$tagsAtom.reportChanged();
    }, _$tagsAtom, name: '${_$tagsAtom.name}_set');
  }

  final _$errorMessageAtom =
      Atom(name: '_FornecedorCadastroControllerBase.errorMessage');

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

  final _$_cadastrarFutureAtom =
      Atom(name: '_FornecedorCadastroControllerBase._cadastrarFuture');

  @override
  ObservableFuture<dynamic> get _cadastrarFuture {
    _$_cadastrarFutureAtom.context.enforceReadPolicy(_$_cadastrarFutureAtom);
    _$_cadastrarFutureAtom.reportObserved();
    return super._cadastrarFuture;
  }

  @override
  set _cadastrarFuture(ObservableFuture<dynamic> value) {
    _$_cadastrarFutureAtom.context.conditionallyRunInAction(() {
      super._cadastrarFuture = value;
      _$_cadastrarFutureAtom.reportChanged();
    }, _$_cadastrarFutureAtom, name: '${_$_cadastrarFutureAtom.name}_set');
  }

  final _$_FornecedorCadastroControllerBaseActionController =
      ActionController(name: '_FornecedorCadastroControllerBase');

  @override
  dynamic changeNome(String nomeValue) {
    final _$actionInfo =
        _$_FornecedorCadastroControllerBaseActionController.startAction();
    try {
      return super.changeNome(nomeValue);
    } finally {
      _$_FornecedorCadastroControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeTelefone(String telefoneValue) {
    final _$actionInfo =
        _$_FornecedorCadastroControllerBaseActionController.startAction();
    try {
      return super.changeTelefone(telefoneValue);
    } finally {
      _$_FornecedorCadastroControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeEmail(String emailValue) {
    final _$actionInfo =
        _$_FornecedorCadastroControllerBaseActionController.startAction();
    try {
      return super.changeEmail(emailValue);
    } finally {
      _$_FornecedorCadastroControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'nome: ${nome.toString()},telefone: ${telefone.toString()},email: ${email.toString()},usuarioId: ${usuarioId.toString()},tags: ${tags.toString()},errorMessage: ${errorMessage.toString()},state: ${state.toString()}';
    return '{$string}';
  }
}
