// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fornecedor_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FornecedorController on _FornecedorControllerBase, Store {
  Computed<StoreState> _$fornecedoresStateComputed;

  @override
  StoreState get fornecedoresState => (_$fornecedoresStateComputed ??=
          Computed<StoreState>(() => super.fornecedoresState))
      .value;
  Computed<StoreState> _$tagsStateComputed;

  @override
  StoreState get tagsState =>
      (_$tagsStateComputed ??= Computed<StoreState>(() => super.tagsState))
          .value;
  Computed<List<FornecedorModel>> _$listFilteredComputed;

  @override
  List<FornecedorModel> get listFiltered => (_$listFilteredComputed ??=
          Computed<List<FornecedorModel>>(() => super.listFiltered))
      .value;

  final _$_fornecedoresFutureAtom =
      Atom(name: '_FornecedorControllerBase._fornecedoresFuture');

  @override
  ObservableFuture<List<FornecedorModel>> get _fornecedoresFuture {
    _$_fornecedoresFutureAtom.context
        .enforceReadPolicy(_$_fornecedoresFutureAtom);
    _$_fornecedoresFutureAtom.reportObserved();
    return super._fornecedoresFuture;
  }

  @override
  set _fornecedoresFuture(ObservableFuture<List<FornecedorModel>> value) {
    _$_fornecedoresFutureAtom.context.conditionallyRunInAction(() {
      super._fornecedoresFuture = value;
      _$_fornecedoresFutureAtom.reportChanged();
    }, _$_fornecedoresFutureAtom,
        name: '${_$_fornecedoresFutureAtom.name}_set');
  }

  final _$fornecedoresAtom =
      Atom(name: '_FornecedorControllerBase.fornecedores');

  @override
  ObservableList<FornecedorModel> get fornecedores {
    _$fornecedoresAtom.context.enforceReadPolicy(_$fornecedoresAtom);
    _$fornecedoresAtom.reportObserved();
    return super.fornecedores;
  }

  @override
  set fornecedores(ObservableList<FornecedorModel> value) {
    _$fornecedoresAtom.context.conditionallyRunInAction(() {
      super.fornecedores = value;
      _$fornecedoresAtom.reportChanged();
    }, _$fornecedoresAtom, name: '${_$fornecedoresAtom.name}_set');
  }

  final _$filterAtom = Atom(name: '_FornecedorControllerBase.filter');

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

  final _$_tagsFutureAtom = Atom(name: '_FornecedorControllerBase._tagsFuture');

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

  final _$tagsModelAtom = Atom(name: '_FornecedorControllerBase.tagsModel');

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

  final _$tagsAtom = Atom(name: '_FornecedorControllerBase.tags');

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

  final _$sistemaRefAtom = Atom(name: '_FornecedorControllerBase.sistemaRef');

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

  final _$errorMessageAtom =
      Atom(name: '_FornecedorControllerBase.errorMessage');

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

  final _$obterPrimeirosFornecedoresParaTelaAsyncAction =
      AsyncAction('obterPrimeirosFornecedoresParaTela');

  @override
  Future<void> obterPrimeirosFornecedoresParaTela() {
    return _$obterPrimeirosFornecedoresParaTelaAsyncAction
        .run(() => super.obterPrimeirosFornecedoresParaTela());
  }

  final _$obterSistemaUsuarioLogadoAsyncAction =
      AsyncAction('obterSistemaUsuarioLogado');

  @override
  Future<void> obterSistemaUsuarioLogado() {
    return _$obterSistemaUsuarioLogadoAsyncAction
        .run(() => super.obterSistemaUsuarioLogado());
  }

  final _$_FornecedorControllerBaseActionController =
      ActionController(name: '_FornecedorControllerBase');

  @override
  dynamic setFilter(String value) {
    final _$actionInfo =
        _$_FornecedorControllerBaseActionController.startAction();
    try {
      return super.setFilter(value);
    } finally {
      _$_FornecedorControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'fornecedores: ${fornecedores.toString()},filter: ${filter.toString()},tagsModel: ${tagsModel.toString()},tags: ${tags.toString()},sistemaRef: ${sistemaRef.toString()},errorMessage: ${errorMessage.toString()},fornecedoresState: ${fornecedoresState.toString()},tagsState: ${tagsState.toString()},listFiltered: ${listFiltered.toString()}';
    return '{$string}';
  }
}
