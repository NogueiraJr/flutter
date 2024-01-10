// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_editar_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TagEditarController on _TagEditarControllerBase, Store {
  Computed<StoreState> _$stateComputed;

  @override
  StoreState get state =>
      (_$stateComputed ??= Computed<StoreState>(() => super.state)).value;

  final _$idAtom = Atom(name: '_TagEditarControllerBase.id');

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

  final _$usuarioIdAtom = Atom(name: '_TagEditarControllerBase.usuarioId');

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

  final _$nomeAtom = Atom(name: '_TagEditarControllerBase.nome');

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

  final _$descricaoAtom = Atom(name: '_TagEditarControllerBase.descricao');

  @override
  String get descricao {
    _$descricaoAtom.context.enforceReadPolicy(_$descricaoAtom);
    _$descricaoAtom.reportObserved();
    return super.descricao;
  }

  @override
  set descricao(String value) {
    _$descricaoAtom.context.conditionallyRunInAction(() {
      super.descricao = value;
      _$descricaoAtom.reportChanged();
    }, _$descricaoAtom, name: '${_$descricaoAtom.name}_set');
  }

  final _$errorMessageAtom =
      Atom(name: '_TagEditarControllerBase.errorMessage');

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
      Atom(name: '_TagEditarControllerBase._editarFuture');

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

  final _$_TagEditarControllerBaseActionController =
      ActionController(name: '_TagEditarControllerBase');

  @override
  dynamic changeNome(String nomeValue) {
    final _$actionInfo =
        _$_TagEditarControllerBaseActionController.startAction();
    try {
      return super.changeNome(nomeValue);
    } finally {
      _$_TagEditarControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeDescricao(String emailValue) {
    final _$actionInfo =
        _$_TagEditarControllerBaseActionController.startAction();
    try {
      return super.changeDescricao(emailValue);
    } finally {
      _$_TagEditarControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'id: ${id.toString()},usuarioId: ${usuarioId.toString()},nome: ${nome.toString()},descricao: ${descricao.toString()},errorMessage: ${errorMessage.toString()},state: ${state.toString()}';
    return '{$string}';
  }
}
