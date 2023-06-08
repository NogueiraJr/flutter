// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'escolher_cliente_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EscolherClienteController on _EscolherClienteControllerBase, Store {
  Computed<StoreState> _$clientesStateComputed;

  @override
  StoreState get clientesState => (_$clientesStateComputed ??=
          Computed<StoreState>(() => super.clientesState))
      .value;
  Computed<StoreState> _$tagsStateComputed;

  @override
  StoreState get tagsState =>
      (_$tagsStateComputed ??= Computed<StoreState>(() => super.tagsState))
          .value;
  Computed<List<ClienteModel>> _$listFilteredComputed;

  @override
  List<ClienteModel> get listFiltered => (_$listFilteredComputed ??=
          Computed<List<ClienteModel>>(() => super.listFiltered))
      .value;

  final _$clientesEspeciaisAtom =
      Atom(name: '_EscolherClienteControllerBase.clientesEspeciais');

  @override
  int get clientesEspeciais {
    _$clientesEspeciaisAtom.context.enforceReadPolicy(_$clientesEspeciaisAtom);
    _$clientesEspeciaisAtom.reportObserved();
    return super.clientesEspeciais;
  }

  @override
  set clientesEspeciais(int value) {
    _$clientesEspeciaisAtom.context.conditionallyRunInAction(() {
      super.clientesEspeciais = value;
      _$clientesEspeciaisAtom.reportChanged();
    }, _$clientesEspeciaisAtom, name: '${_$clientesEspeciaisAtom.name}_set');
  }

  final _$clientesComDesvioAtom =
      Atom(name: '_EscolherClienteControllerBase.clientesComDesvio');

  @override
  int get clientesComDesvio {
    _$clientesComDesvioAtom.context.enforceReadPolicy(_$clientesComDesvioAtom);
    _$clientesComDesvioAtom.reportObserved();
    return super.clientesComDesvio;
  }

  @override
  set clientesComDesvio(int value) {
    _$clientesComDesvioAtom.context.conditionallyRunInAction(() {
      super.clientesComDesvio = value;
      _$clientesComDesvioAtom.reportChanged();
    }, _$clientesComDesvioAtom, name: '${_$clientesComDesvioAtom.name}_set');
  }

  final _$_clientesFutureAtom =
      Atom(name: '_EscolherClienteControllerBase._clientesFuture');

  @override
  ObservableFuture<List<ClienteModel>> get _clientesFuture {
    _$_clientesFutureAtom.context.enforceReadPolicy(_$_clientesFutureAtom);
    _$_clientesFutureAtom.reportObserved();
    return super._clientesFuture;
  }

  @override
  set _clientesFuture(ObservableFuture<List<ClienteModel>> value) {
    _$_clientesFutureAtom.context.conditionallyRunInAction(() {
      super._clientesFuture = value;
      _$_clientesFutureAtom.reportChanged();
    }, _$_clientesFutureAtom, name: '${_$_clientesFutureAtom.name}_set');
  }

  final _$clientesAtom = Atom(name: '_EscolherClienteControllerBase.clientes');

  @override
  ObservableList<ClienteModel> get clientes {
    _$clientesAtom.context.enforceReadPolicy(_$clientesAtom);
    _$clientesAtom.reportObserved();
    return super.clientes;
  }

  @override
  set clientes(ObservableList<ClienteModel> value) {
    _$clientesAtom.context.conditionallyRunInAction(() {
      super.clientes = value;
      _$clientesAtom.reportChanged();
    }, _$clientesAtom, name: '${_$clientesAtom.name}_set');
  }

  final _$filterAtom = Atom(name: '_EscolherClienteControllerBase.filter');

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

  final _$_tagsFutureAtom =
      Atom(name: '_EscolherClienteControllerBase._tagsFuture');

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

  final _$tagsModelAtom =
      Atom(name: '_EscolherClienteControllerBase.tagsModel');

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

  final _$tagsAtom = Atom(name: '_EscolherClienteControllerBase.tags');

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

  final _$sistemaRefAtom =
      Atom(name: '_EscolherClienteControllerBase.sistemaRef');

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
      Atom(name: '_EscolherClienteControllerBase.errorMessage');

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

  final _$obterPrimeirosClientesParaTelaAsyncAction =
      AsyncAction('obterPrimeirosClientesParaTela');

  @override
  Future<void> obterPrimeirosClientesParaTela() {
    return _$obterPrimeirosClientesParaTelaAsyncAction
        .run(() => super.obterPrimeirosClientesParaTela());
  }

  final _$obterSistemaUsuarioLogadoAsyncAction =
      AsyncAction('obterSistemaUsuarioLogado');

  @override
  Future<void> obterSistemaUsuarioLogado() {
    return _$obterSistemaUsuarioLogadoAsyncAction
        .run(() => super.obterSistemaUsuarioLogado());
  }

  final _$_EscolherClienteControllerBaseActionController =
      ActionController(name: '_EscolherClienteControllerBase');

  @override
  dynamic setFilter(String value) {
    final _$actionInfo =
        _$_EscolherClienteControllerBaseActionController.startAction();
    try {
      return super.setFilter(value);
    } finally {
      _$_EscolherClienteControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'clientesEspeciais: ${clientesEspeciais.toString()},clientesComDesvio: ${clientesComDesvio.toString()},clientes: ${clientes.toString()},filter: ${filter.toString()},tagsModel: ${tagsModel.toString()},tags: ${tags.toString()},sistemaRef: ${sistemaRef.toString()},errorMessage: ${errorMessage.toString()},clientesState: ${clientesState.toString()},tagsState: ${tagsState.toString()},listFiltered: ${listFiltered.toString()}';
    return '{$string}';
  }
}
