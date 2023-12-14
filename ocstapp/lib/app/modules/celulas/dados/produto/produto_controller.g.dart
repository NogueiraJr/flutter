// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produto_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProdutoController on _ProdutoControllerBase, Store {
  Computed<StoreState> _$produtosStateComputed;

  @override
  StoreState get produtosState => (_$produtosStateComputed ??=
          Computed<StoreState>(() => super.produtosState))
      .value;
  Computed<StoreState> _$produtoResumoStateComputed;

  @override
  StoreState get produtoResumoState => (_$produtoResumoStateComputed ??=
          Computed<StoreState>(() => super.produtoResumoState))
      .value;
  Computed<StoreState> _$compoeStateComputed;

  @override
  StoreState get compoeState =>
      (_$compoeStateComputed ??= Computed<StoreState>(() => super.compoeState))
          .value;
  Computed<StoreState> _$compostoStateComputed;

  @override
  StoreState get compostoState => (_$compostoStateComputed ??=
          Computed<StoreState>(() => super.compostoState))
      .value;
  Computed<StoreState> _$tagsStateComputed;

  @override
  StoreState get tagsState =>
      (_$tagsStateComputed ??= Computed<StoreState>(() => super.tagsState))
          .value;
  Computed<List<ProdutoModel>> _$listFilteredComputed;

  @override
  List<ProdutoModel> get listFiltered => (_$listFilteredComputed ??=
          Computed<List<ProdutoModel>>(() => super.listFiltered))
      .value;

  final _$_produtosFutureAtom =
      Atom(name: '_ProdutoControllerBase._produtosFuture');

  @override
  ObservableFuture<List<ProdutoModel>> get _produtosFuture {
    _$_produtosFutureAtom.context.enforceReadPolicy(_$_produtosFutureAtom);
    _$_produtosFutureAtom.reportObserved();
    return super._produtosFuture;
  }

  @override
  set _produtosFuture(ObservableFuture<List<ProdutoModel>> value) {
    _$_produtosFutureAtom.context.conditionallyRunInAction(() {
      super._produtosFuture = value;
      _$_produtosFutureAtom.reportChanged();
    }, _$_produtosFutureAtom, name: '${_$_produtosFutureAtom.name}_set');
  }

  final _$_produtoFutureAtom =
      Atom(name: '_ProdutoControllerBase._produtoFuture');

  @override
  ObservableFuture<ProdutoModel> get _produtoFuture {
    _$_produtoFutureAtom.context.enforceReadPolicy(_$_produtoFutureAtom);
    _$_produtoFutureAtom.reportObserved();
    return super._produtoFuture;
  }

  @override
  set _produtoFuture(ObservableFuture<ProdutoModel> value) {
    _$_produtoFutureAtom.context.conditionallyRunInAction(() {
      super._produtoFuture = value;
      _$_produtoFutureAtom.reportChanged();
    }, _$_produtoFutureAtom, name: '${_$_produtoFutureAtom.name}_set');
  }

  final _$_produtoResumoFutureAtom =
      Atom(name: '_ProdutoControllerBase._produtoResumoFuture');

  @override
  ObservableFuture<ProdutoResumoModel> get _produtoResumoFuture {
    _$_produtoResumoFutureAtom.context
        .enforceReadPolicy(_$_produtoResumoFutureAtom);
    _$_produtoResumoFutureAtom.reportObserved();
    return super._produtoResumoFuture;
  }

  @override
  set _produtoResumoFuture(ObservableFuture<ProdutoResumoModel> value) {
    _$_produtoResumoFutureAtom.context.conditionallyRunInAction(() {
      super._produtoResumoFuture = value;
      _$_produtoResumoFutureAtom.reportChanged();
    }, _$_produtoResumoFutureAtom,
        name: '${_$_produtoResumoFutureAtom.name}_set');
  }

  final _$produtosAtom = Atom(name: '_ProdutoControllerBase.produtos');

  @override
  ObservableList<ProdutoModel> get produtos {
    _$produtosAtom.context.enforceReadPolicy(_$produtosAtom);
    _$produtosAtom.reportObserved();
    return super.produtos;
  }

  @override
  set produtos(ObservableList<ProdutoModel> value) {
    _$produtosAtom.context.conditionallyRunInAction(() {
      super.produtos = value;
      _$produtosAtom.reportChanged();
    }, _$produtosAtom, name: '${_$produtosAtom.name}_set');
  }

  final _$produtoResumoAtom =
      Atom(name: '_ProdutoControllerBase.produtoResumo');

  @override
  ProdutoResumoModel get produtoResumo {
    _$produtoResumoAtom.context.enforceReadPolicy(_$produtoResumoAtom);
    _$produtoResumoAtom.reportObserved();
    return super.produtoResumo;
  }

  @override
  set produtoResumo(ProdutoResumoModel value) {
    _$produtoResumoAtom.context.conditionallyRunInAction(() {
      super.produtoResumo = value;
      _$produtoResumoAtom.reportChanged();
    }, _$produtoResumoAtom, name: '${_$produtoResumoAtom.name}_set');
  }

  final _$_compoeFutureAtom =
      Atom(name: '_ProdutoControllerBase._compoeFuture');

  @override
  ObservableFuture<List<ProdutoModel>> get _compoeFuture {
    _$_compoeFutureAtom.context.enforceReadPolicy(_$_compoeFutureAtom);
    _$_compoeFutureAtom.reportObserved();
    return super._compoeFuture;
  }

  @override
  set _compoeFuture(ObservableFuture<List<ProdutoModel>> value) {
    _$_compoeFutureAtom.context.conditionallyRunInAction(() {
      super._compoeFuture = value;
      _$_compoeFutureAtom.reportChanged();
    }, _$_compoeFutureAtom, name: '${_$_compoeFutureAtom.name}_set');
  }

  final _$compoeAtom = Atom(name: '_ProdutoControllerBase.compoe');

  @override
  ObservableList<ProdutoModel> get compoe {
    _$compoeAtom.context.enforceReadPolicy(_$compoeAtom);
    _$compoeAtom.reportObserved();
    return super.compoe;
  }

  @override
  set compoe(ObservableList<ProdutoModel> value) {
    _$compoeAtom.context.conditionallyRunInAction(() {
      super.compoe = value;
      _$compoeAtom.reportChanged();
    }, _$compoeAtom, name: '${_$compoeAtom.name}_set');
  }

  final _$_compostoFutureAtom =
      Atom(name: '_ProdutoControllerBase._compostoFuture');

  @override
  ObservableFuture<List<ProdutoModel>> get _compostoFuture {
    _$_compostoFutureAtom.context.enforceReadPolicy(_$_compostoFutureAtom);
    _$_compostoFutureAtom.reportObserved();
    return super._compostoFuture;
  }

  @override
  set _compostoFuture(ObservableFuture<List<ProdutoModel>> value) {
    _$_compostoFutureAtom.context.conditionallyRunInAction(() {
      super._compostoFuture = value;
      _$_compostoFutureAtom.reportChanged();
    }, _$_compostoFutureAtom, name: '${_$_compostoFutureAtom.name}_set');
  }

  final _$compostoAtom = Atom(name: '_ProdutoControllerBase.composto');

  @override
  ObservableList<ProdutoModel> get composto {
    _$compostoAtom.context.enforceReadPolicy(_$compostoAtom);
    _$compostoAtom.reportObserved();
    return super.composto;
  }

  @override
  set composto(ObservableList<ProdutoModel> value) {
    _$compostoAtom.context.conditionallyRunInAction(() {
      super.composto = value;
      _$compostoAtom.reportChanged();
    }, _$compostoAtom, name: '${_$compostoAtom.name}_set');
  }

  final _$filterAtom = Atom(name: '_ProdutoControllerBase.filter');

  @override
  String get filter {
    _$filterAtom.context.enforceReadPolicy(_$filterAtom);
    _$filterAtom.reportObserved();
    return super.filter;
  }

  @override
  set filter(String value) {
    _$filterAtom.context.conditionallyRunInAction(() {
      super.filter = value;
      _$filterAtom.reportChanged();
    }, _$filterAtom, name: '${_$filterAtom.name}_set');
  }

  final _$_tagsFutureAtom = Atom(name: '_ProdutoControllerBase._tagsFuture');

  @override
  ObservableFuture<List<String>> get _tagsFuture {
    _$_tagsFutureAtom.context.enforceReadPolicy(_$_tagsFutureAtom);
    _$_tagsFutureAtom.reportObserved();
    return super._tagsFuture;
  }

  @override
  set _tagsFuture(ObservableFuture<List<String>> value) {
    _$_tagsFutureAtom.context.conditionallyRunInAction(() {
      super._tagsFuture = value;
      _$_tagsFutureAtom.reportChanged();
    }, _$_tagsFutureAtom, name: '${_$_tagsFutureAtom.name}_set');
  }

  final _$tagsModelAtom = Atom(name: '_ProdutoControllerBase.tagsModel');

  @override
  ObservableList<String> get tagsModel {
    _$tagsModelAtom.context.enforceReadPolicy(_$tagsModelAtom);
    _$tagsModelAtom.reportObserved();
    return super.tagsModel;
  }

  @override
  set tagsModel(ObservableList<String> value) {
    _$tagsModelAtom.context.conditionallyRunInAction(() {
      super.tagsModel = value;
      _$tagsModelAtom.reportChanged();
    }, _$tagsModelAtom, name: '${_$tagsModelAtom.name}_set');
  }

  final _$tagsAtom = Atom(name: '_ProdutoControllerBase.tags');

  @override
  ObservableList<String> get tags {
    _$tagsAtom.context.enforceReadPolicy(_$tagsAtom);
    _$tagsAtom.reportObserved();
    return super.tags;
  }

  @override
  set tags(ObservableList<String> value) {
    _$tagsAtom.context.conditionallyRunInAction(() {
      super.tags = value;
      _$tagsAtom.reportChanged();
    }, _$tagsAtom, name: '${_$tagsAtom.name}_set');
  }

  final _$sistemaRefAtom = Atom(name: '_ProdutoControllerBase.sistemaRef');

  @override
  String get sistemaRef {
    _$sistemaRefAtom.context.enforceReadPolicy(_$sistemaRefAtom);
    _$sistemaRefAtom.reportObserved();
    return super.sistemaRef;
  }

  @override
  set sistemaRef(String value) {
    _$sistemaRefAtom.context.conditionallyRunInAction(() {
      super.sistemaRef = value;
      _$sistemaRefAtom.reportChanged();
    }, _$sistemaRefAtom, name: '${_$sistemaRefAtom.name}_set');
  }

  final _$errorMessageAtom = Atom(name: '_ProdutoControllerBase.errorMessage');

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

  final _$obterTagsAsyncAction = AsyncAction('obterTags');

  @override
  Future<void> obterTags() {
    return _$obterTagsAsyncAction.run(() => super.obterTags());
  }

  final _$obterPrimeirosProdutosParaTelaAsyncAction =
      AsyncAction('obterPrimeirosProdutosParaTela');

  @override
  Future<void> obterPrimeirosProdutosParaTela() {
    return _$obterPrimeirosProdutosParaTelaAsyncAction
        .run(() => super.obterPrimeirosProdutosParaTela());
  }

  final _$obterSistemaUsuarioLogadoAsyncAction =
      AsyncAction('obterSistemaUsuarioLogado');

  @override
  Future<void> obterSistemaUsuarioLogado() {
    return _$obterSistemaUsuarioLogadoAsyncAction
        .run(() => super.obterSistemaUsuarioLogado());
  }

  final _$_ProdutoControllerBaseActionController =
      ActionController(name: '_ProdutoControllerBase');

  @override
  dynamic setFilter(String value) {
    final _$actionInfo = _$_ProdutoControllerBaseActionController.startAction();
    try {
      return super.setFilter(value);
    } finally {
      _$_ProdutoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'produtos: ${produtos.toString()},produtoResumo: ${produtoResumo.toString()},compoe: ${compoe.toString()},composto: ${composto.toString()},filter: ${filter.toString()},tagsModel: ${tagsModel.toString()},tags: ${tags.toString()},sistemaRef: ${sistemaRef.toString()},errorMessage: ${errorMessage.toString()},produtosState: ${produtosState.toString()},produtoResumoState: ${produtoResumoState.toString()},compoeState: ${compoeState.toString()},compostoState: ${compostoState.toString()},tagsState: ${tagsState.toString()},listFiltered: ${listFiltered.toString()}';
    return '{$string}';
  }
}
