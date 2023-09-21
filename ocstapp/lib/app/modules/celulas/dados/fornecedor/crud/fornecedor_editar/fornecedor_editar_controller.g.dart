// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fornecedor_editar_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FornecedorEditarController on _FornecedorEditarControllerBase, Store {
  Computed<StoreState> _$stateComputed;

  @override
  StoreState get state =>
      (_$stateComputed ??= Computed<StoreState>(() => super.state)).value;

  final _$idAtom = Atom(name: '_FornecedorEditarControllerBase.id');

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

  final _$usuarioIdAtom =
      Atom(name: '_FornecedorEditarControllerBase.usuarioId');

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

  final _$nomeAtom = Atom(name: '_FornecedorEditarControllerBase.nome');

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

  final _$telefoneAtom = Atom(name: '_FornecedorEditarControllerBase.telefone');

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

  final _$emailAtom = Atom(name: '_FornecedorEditarControllerBase.email');

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

  final _$tagsAtom = Atom(name: '_FornecedorEditarControllerBase.tags');

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
      Atom(name: '_FornecedorEditarControllerBase.errorMessage');

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

  final _$_editarFutureAtom =
      Atom(name: '_FornecedorEditarControllerBase._editarFuture');

  @override
  ObservableFuture<dynamic> get _editarFuture {
    _$_editarFutureAtom.context.enforceReadPolicy(_$_editarFutureAtom);
    _$_editarFutureAtom.reportObserved();
    return super._editarFuture;
  }

  @override
  set _editarFuture(ObservableFuture<dynamic> value) {
    _$_editarFutureAtom.context.conditionallyRunInAction(() {
      super._editarFuture = value;
      _$_editarFutureAtom.reportChanged();
    }, _$_editarFutureAtom, name: '${_$_editarFutureAtom.name}_set');
  }

  final _$_FornecedorEditarControllerBaseActionController =
      ActionController(name: '_FornecedorEditarControllerBase');

  @override
  dynamic changeNome(String nomeValue) {
    final _$actionInfo =
        _$_FornecedorEditarControllerBaseActionController.startAction();
    try {
      return super.changeNome(nomeValue);
    } finally {
      _$_FornecedorEditarControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeTelefone(String telefoneValue) {
    final _$actionInfo =
        _$_FornecedorEditarControllerBaseActionController.startAction();
    try {
      return super.changeTelefone(telefoneValue);
    } finally {
      _$_FornecedorEditarControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeEmail(String emailValue) {
    final _$actionInfo =
        _$_FornecedorEditarControllerBaseActionController.startAction();
    try {
      return super.changeEmail(emailValue);
    } finally {
      _$_FornecedorEditarControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'id: ${id.toString()},usuarioId: ${usuarioId.toString()},nome: ${nome.toString()},telefone: ${telefone.toString()},email: ${email.toString()},tags: ${tags.toString()},errorMessage: ${errorMessage.toString()},state: ${state.toString()}';
    return '{$string}';
  }
}
