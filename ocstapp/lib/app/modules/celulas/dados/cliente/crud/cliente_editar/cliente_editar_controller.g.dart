// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cliente_editar_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClienteEditarController on _ClienteEditarControllerBase, Store {
  Computed<StoreState> _$stateComputed;

  @override
  StoreState get state =>
      (_$stateComputed ??= Computed<StoreState>(() => super.state)).value;

  final _$idAtom = Atom(name: '_ClienteEditarControllerBase.id');

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

  final _$usuarioIdAtom = Atom(name: '_ClienteEditarControllerBase.usuarioId');

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

  final _$nomeAtom = Atom(name: '_ClienteEditarControllerBase.nome');

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

  final _$celularAtom = Atom(name: '_ClienteEditarControllerBase.celular');

  @override
  String get celular {
    _$celularAtom.context.enforceReadPolicy(_$celularAtom);
    _$celularAtom.reportObserved();
    return super.celular;
  }

  @override
  set celular(String value) {
    _$celularAtom.context.conditionallyRunInAction(() {
      super.celular = value;
      _$celularAtom.reportChanged();
    }, _$celularAtom, name: '${_$celularAtom.name}_set');
  }

  final _$emailAtom = Atom(name: '_ClienteEditarControllerBase.email');

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

  final _$tagsAtom = Atom(name: '_ClienteEditarControllerBase.tags');

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
      Atom(name: '_ClienteEditarControllerBase.errorMessage');

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
      Atom(name: '_ClienteEditarControllerBase._editarFuture');

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

  final _$_ClienteEditarControllerBaseActionController =
      ActionController(name: '_ClienteEditarControllerBase');

  @override
  dynamic changeNome(String nomeValue) {
    final _$actionInfo =
        _$_ClienteEditarControllerBaseActionController.startAction();
    try {
      return super.changeNome(nomeValue);
    } finally {
      _$_ClienteEditarControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCelular(String celularValue) {
    final _$actionInfo =
        _$_ClienteEditarControllerBaseActionController.startAction();
    try {
      return super.changeCelular(celularValue);
    } finally {
      _$_ClienteEditarControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeEmail(String emailValue) {
    final _$actionInfo =
        _$_ClienteEditarControllerBaseActionController.startAction();
    try {
      return super.changeEmail(emailValue);
    } finally {
      _$_ClienteEditarControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'id: ${id.toString()},usuarioId: ${usuarioId.toString()},nome: ${nome.toString()},celular: ${celular.toString()},email: ${email.toString()},tags: ${tags.toString()},errorMessage: ${errorMessage.toString()},state: ${state.toString()}';
    return '{$string}';
  }
}
