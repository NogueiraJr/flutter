// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cliente_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClienteController on _ClienteControllerBase, Store {
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
  Computed<StoreState> _$manequinsClienteStateComputed;

  @override
  StoreState get manequinsClienteState => (_$manequinsClienteStateComputed ??=
          Computed<StoreState>(() => super.manequinsClienteState))
      .value;
  Computed<StoreState> _$veiculosClienteStateComputed;

  @override
  StoreState get veiculosClienteState => (_$veiculosClienteStateComputed ??=
          Computed<StoreState>(() => super.veiculosClienteState))
      .value;
  Computed<StoreState> _$petsClienteStateComputed;

  @override
  StoreState get petsClienteState => (_$petsClienteStateComputed ??=
          Computed<StoreState>(() => super.petsClienteState))
      .value;
  Computed<StoreState> _$enderecosClienteStateComputed;

  @override
  StoreState get enderecosClienteState => (_$enderecosClienteStateComputed ??=
          Computed<StoreState>(() => super.enderecosClienteState))
      .value;
  Computed<List<ClienteModel>> _$listFilteredComputed;

  @override
  List<ClienteModel> get listFiltered => (_$listFilteredComputed ??=
          Computed<List<ClienteModel>>(() => super.listFiltered))
      .value;

  final _$clientesEspeciaisAtom =
      Atom(name: '_ClienteControllerBase.clientesEspeciais');

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
      Atom(name: '_ClienteControllerBase.clientesComDesvio');

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
      Atom(name: '_ClienteControllerBase._clientesFuture');

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

  final _$clientesAtom = Atom(name: '_ClienteControllerBase.clientes');

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

  final _$filterAtom = Atom(name: '_ClienteControllerBase.filter');

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

  final _$_tagsFutureAtom = Atom(name: '_ClienteControllerBase._tagsFuture');

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

  final _$tagsModelAtom = Atom(name: '_ClienteControllerBase.tagsModel');

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

  final _$tagsAtom = Atom(name: '_ClienteControllerBase.tags');

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

  final _$manequinsClienteAtom =
      Atom(name: '_ClienteControllerBase.manequinsCliente');

  @override
  List<ClienteManequimModel> get manequinsCliente {
    _$manequinsClienteAtom.context.enforceReadPolicy(_$manequinsClienteAtom);
    _$manequinsClienteAtom.reportObserved();
    return super.manequinsCliente;
  }

  @override
  set manequinsCliente(List<ClienteManequimModel> value) {
    _$manequinsClienteAtom.context.conditionallyRunInAction(() {
      super.manequinsCliente = value;
      _$manequinsClienteAtom.reportChanged();
    }, _$manequinsClienteAtom, name: '${_$manequinsClienteAtom.name}_set');
  }

  final _$_manequinsClienteFutureAtom =
      Atom(name: '_ClienteControllerBase._manequinsClienteFuture');

  @override
  ObservableFuture<List<ClienteManequimModel>> get _manequinsClienteFuture {
    _$_manequinsClienteFutureAtom.context
        .enforceReadPolicy(_$_manequinsClienteFutureAtom);
    _$_manequinsClienteFutureAtom.reportObserved();
    return super._manequinsClienteFuture;
  }

  @override
  set _manequinsClienteFuture(
      ObservableFuture<List<ClienteManequimModel>> value) {
    _$_manequinsClienteFutureAtom.context.conditionallyRunInAction(() {
      super._manequinsClienteFuture = value;
      _$_manequinsClienteFutureAtom.reportChanged();
    }, _$_manequinsClienteFutureAtom,
        name: '${_$_manequinsClienteFutureAtom.name}_set');
  }

  final _$veiculosClienteAtom =
      Atom(name: '_ClienteControllerBase.veiculosCliente');

  @override
  List<ClienteVeiculoModel> get veiculosCliente {
    _$veiculosClienteAtom.context.enforceReadPolicy(_$veiculosClienteAtom);
    _$veiculosClienteAtom.reportObserved();
    return super.veiculosCliente;
  }

  @override
  set veiculosCliente(List<ClienteVeiculoModel> value) {
    _$veiculosClienteAtom.context.conditionallyRunInAction(() {
      super.veiculosCliente = value;
      _$veiculosClienteAtom.reportChanged();
    }, _$veiculosClienteAtom, name: '${_$veiculosClienteAtom.name}_set');
  }

  final _$_veiculosClienteFutureAtom =
      Atom(name: '_ClienteControllerBase._veiculosClienteFuture');

  @override
  ObservableFuture<List<ClienteVeiculoModel>> get _veiculosClienteFuture {
    _$_veiculosClienteFutureAtom.context
        .enforceReadPolicy(_$_veiculosClienteFutureAtom);
    _$_veiculosClienteFutureAtom.reportObserved();
    return super._veiculosClienteFuture;
  }

  @override
  set _veiculosClienteFuture(
      ObservableFuture<List<ClienteVeiculoModel>> value) {
    _$_veiculosClienteFutureAtom.context.conditionallyRunInAction(() {
      super._veiculosClienteFuture = value;
      _$_veiculosClienteFutureAtom.reportChanged();
    }, _$_veiculosClienteFutureAtom,
        name: '${_$_veiculosClienteFutureAtom.name}_set');
  }

  final _$petsClienteAtom = Atom(name: '_ClienteControllerBase.petsCliente');

  @override
  List<ClientePetModel> get petsCliente {
    _$petsClienteAtom.context.enforceReadPolicy(_$petsClienteAtom);
    _$petsClienteAtom.reportObserved();
    return super.petsCliente;
  }

  @override
  set petsCliente(List<ClientePetModel> value) {
    _$petsClienteAtom.context.conditionallyRunInAction(() {
      super.petsCliente = value;
      _$petsClienteAtom.reportChanged();
    }, _$petsClienteAtom, name: '${_$petsClienteAtom.name}_set');
  }

  final _$_petsClienteFutureAtom =
      Atom(name: '_ClienteControllerBase._petsClienteFuture');

  @override
  ObservableFuture<List<ClientePetModel>> get _petsClienteFuture {
    _$_petsClienteFutureAtom.context
        .enforceReadPolicy(_$_petsClienteFutureAtom);
    _$_petsClienteFutureAtom.reportObserved();
    return super._petsClienteFuture;
  }

  @override
  set _petsClienteFuture(ObservableFuture<List<ClientePetModel>> value) {
    _$_petsClienteFutureAtom.context.conditionallyRunInAction(() {
      super._petsClienteFuture = value;
      _$_petsClienteFutureAtom.reportChanged();
    }, _$_petsClienteFutureAtom, name: '${_$_petsClienteFutureAtom.name}_set');
  }

  final _$enderecosClienteAtom =
      Atom(name: '_ClienteControllerBase.enderecosCliente');

  @override
  List<ClienteEnderecoModel> get enderecosCliente {
    _$enderecosClienteAtom.context.enforceReadPolicy(_$enderecosClienteAtom);
    _$enderecosClienteAtom.reportObserved();
    return super.enderecosCliente;
  }

  @override
  set enderecosCliente(List<ClienteEnderecoModel> value) {
    _$enderecosClienteAtom.context.conditionallyRunInAction(() {
      super.enderecosCliente = value;
      _$enderecosClienteAtom.reportChanged();
    }, _$enderecosClienteAtom, name: '${_$enderecosClienteAtom.name}_set');
  }

  final _$_enderecosClienteFutureAtom =
      Atom(name: '_ClienteControllerBase._enderecosClienteFuture');

  @override
  ObservableFuture<List<ClienteEnderecoModel>> get _enderecosClienteFuture {
    _$_enderecosClienteFutureAtom.context
        .enforceReadPolicy(_$_enderecosClienteFutureAtom);
    _$_enderecosClienteFutureAtom.reportObserved();
    return super._enderecosClienteFuture;
  }

  @override
  set _enderecosClienteFuture(
      ObservableFuture<List<ClienteEnderecoModel>> value) {
    _$_enderecosClienteFutureAtom.context.conditionallyRunInAction(() {
      super._enderecosClienteFuture = value;
      _$_enderecosClienteFutureAtom.reportChanged();
    }, _$_enderecosClienteFutureAtom,
        name: '${_$_enderecosClienteFutureAtom.name}_set');
  }

  final _$sistemaRefAtom = Atom(name: '_ClienteControllerBase.sistemaRef');

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

  final _$errorMessageAtom = Atom(name: '_ClienteControllerBase.errorMessage');

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

  final _$_ClienteControllerBaseActionController =
      ActionController(name: '_ClienteControllerBase');

  @override
  dynamic setFilter(String value) {
    final _$actionInfo = _$_ClienteControllerBaseActionController.startAction();
    try {
      return super.setFilter(value);
    } finally {
      _$_ClienteControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'clientesEspeciais: ${clientesEspeciais.toString()},clientesComDesvio: ${clientesComDesvio.toString()},clientes: ${clientes.toString()},filter: ${filter.toString()},tagsModel: ${tagsModel.toString()},tags: ${tags.toString()},manequinsCliente: ${manequinsCliente.toString()},veiculosCliente: ${veiculosCliente.toString()},petsCliente: ${petsCliente.toString()},enderecosCliente: ${enderecosCliente.toString()},sistemaRef: ${sistemaRef.toString()},errorMessage: ${errorMessage.toString()},clientesState: ${clientesState.toString()},tagsState: ${tagsState.toString()},manequinsClienteState: ${manequinsClienteState.toString()},veiculosClienteState: ${veiculosClienteState.toString()},petsClienteState: ${petsClienteState.toString()},enderecosClienteState: ${enderecosClienteState.toString()},listFiltered: ${listFiltered.toString()}';
    return '{$string}';
  }
}
