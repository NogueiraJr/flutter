// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_cadastro_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TagCadastroController on _TagCadastroControllerBase, Store {
  Computed<StoreState> _$stateComputed;

  @override
  StoreState get state =>
      (_$stateComputed ??= Computed<StoreState>(() => super.state)).value;

  final _$nomeAtom = Atom(name: '_TagCadastroControllerBase.nome');

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

  final _$descricaoAtom = Atom(name: '_TagCadastroControllerBase.descricao');

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

  final _$usuarioIdAtom = Atom(name: '_TagCadastroControllerBase.usuarioId');

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

  final _$errorMessageAtom =
      Atom(name: '_TagCadastroControllerBase.errorMessage');

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
      Atom(name: '_TagCadastroControllerBase._cadastrarFuture');

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

  final _$_TagCadastroControllerBaseActionController =
      ActionController(name: '_TagCadastroControllerBase');

  @override
  dynamic changeNome(String nomeValue) {
    final _$actionInfo =
        _$_TagCadastroControllerBaseActionController.startAction();
    try {
      return super.changeNome(nomeValue);
    } finally {
      _$_TagCadastroControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeDescricao(String descricaoValue) {
    final _$actionInfo =
        _$_TagCadastroControllerBaseActionController.startAction();
    try {
      return super.changeDescricao(descricaoValue);
    } finally {
      _$_TagCadastroControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'nome: ${nome.toString()},descricao: ${descricao.toString()},usuarioId: ${usuarioId.toString()},errorMessage: ${errorMessage.toString()},state: ${state.toString()}';
    return '{$string}';
  }
}
