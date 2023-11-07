// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produto_editar_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProdutoEditarController on _ProdutoEditarControllerBase, Store {
  Computed<StoreState> _$stateComputed;

  @override
  StoreState get state =>
      (_$stateComputed ??= Computed<StoreState>(() => super.state)).value;

  final _$idAtom = Atom(name: '_ProdutoEditarControllerBase.id');

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

  final _$usuarioIdAtom = Atom(name: '_ProdutoEditarControllerBase.usuarioId');

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

  final _$codigoAtom = Atom(name: '_ProdutoEditarControllerBase.codigo');

  @override
  String get codigo {
    _$codigoAtom.context.enforceReadPolicy(_$codigoAtom);
    _$codigoAtom.reportObserved();
    return super.codigo;
  }

  @override
  set codigo(String value) {
    _$codigoAtom.context.conditionallyRunInAction(() {
      super.codigo = value;
      _$codigoAtom.reportChanged();
    }, _$codigoAtom, name: '${_$codigoAtom.name}_set');
  }

  final _$nomeAtom = Atom(name: '_ProdutoEditarControllerBase.nome');

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

  final _$descricaoAtom = Atom(name: '_ProdutoEditarControllerBase.descricao');

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

  final _$custoAtom = Atom(name: '_ProdutoEditarControllerBase.custo');

  @override
  double get custo {
    _$custoAtom.context.enforceReadPolicy(_$custoAtom);
    _$custoAtom.reportObserved();
    return super.custo;
  }

  @override
  set custo(double value) {
    _$custoAtom.context.conditionallyRunInAction(() {
      super.custo = value;
      _$custoAtom.reportChanged();
    }, _$custoAtom, name: '${_$custoAtom.name}_set');
  }

  final _$precoAtom = Atom(name: '_ProdutoEditarControllerBase.preco');

  @override
  double get preco {
    _$precoAtom.context.enforceReadPolicy(_$precoAtom);
    _$precoAtom.reportObserved();
    return super.preco;
  }

  @override
  set preco(double value) {
    _$precoAtom.context.conditionallyRunInAction(() {
      super.preco = value;
      _$precoAtom.reportChanged();
    }, _$precoAtom, name: '${_$precoAtom.name}_set');
  }

  final _$tagsAtom = Atom(name: '_ProdutoEditarControllerBase.tags');

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
      Atom(name: '_ProdutoEditarControllerBase.errorMessage');

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
      Atom(name: '_ProdutoEditarControllerBase._editarFuture');

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

  final _$_ProdutoEditarControllerBaseActionController =
      ActionController(name: '_ProdutoEditarControllerBase');

  @override
  dynamic changeCodigo(String codigoValue) {
    final _$actionInfo =
        _$_ProdutoEditarControllerBaseActionController.startAction();
    try {
      return super.changeCodigo(codigoValue);
    } finally {
      _$_ProdutoEditarControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeNome(String nomeValue) {
    final _$actionInfo =
        _$_ProdutoEditarControllerBaseActionController.startAction();
    try {
      return super.changeNome(nomeValue);
    } finally {
      _$_ProdutoEditarControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeDescricao(String descricaoValue) {
    final _$actionInfo =
        _$_ProdutoEditarControllerBaseActionController.startAction();
    try {
      return super.changeDescricao(descricaoValue);
    } finally {
      _$_ProdutoEditarControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'id: ${id.toString()},usuarioId: ${usuarioId.toString()},codigo: ${codigo.toString()},nome: ${nome.toString()},descricao: ${descricao.toString()},custo: ${custo.toString()},preco: ${preco.toString()},tags: ${tags.toString()},errorMessage: ${errorMessage.toString()},state: ${state.toString()}';
    return '{$string}';
  }
}
