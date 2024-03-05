// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'atendimento_servico_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AtendimentoServicoController
    on _AtendimentoServicoControllerBase, Store {
  Computed<StoreState> _$servicoStateComputed;

  @override
  StoreState get servicoState => (_$servicoStateComputed ??=
          Computed<StoreState>(() => super.servicoState))
      .value;
  Computed<StoreState> _$servicoCalendarStateComputed;

  @override
  StoreState get servicoCalendarState => (_$servicoCalendarStateComputed ??=
          Computed<StoreState>(() => super.servicoCalendarState))
      .value;
  Computed<StoreState> _$tagsStateComputed;

  @override
  StoreState get tagsState =>
      (_$tagsStateComputed ??= Computed<StoreState>(() => super.tagsState))
          .value;
  Computed<StoreState> _$produtosEscolhidosStateComputed;

  @override
  StoreState get produtosEscolhidosState =>
      (_$produtosEscolhidosStateComputed ??=
              Computed<StoreState>(() => super.produtosEscolhidosState))
          .value;
  Computed<StoreState> _$produtosDoServicoStateComputed;

  @override
  StoreState get produtosDoServicoState => (_$produtosDoServicoStateComputed ??=
          Computed<StoreState>(() => super.produtosDoServicoState))
      .value;
  Computed<StoreState> _$faturamentoDoServicoStateComputed;

  @override
  StoreState get faturamentoDoServicoState =>
      (_$faturamentoDoServicoStateComputed ??=
              Computed<StoreState>(() => super.faturamentoDoServicoState))
          .value;
  Computed<StoreState> _$clienteVeiculoStateComputed;

  @override
  StoreState get clienteVeiculoState => (_$clienteVeiculoStateComputed ??=
          Computed<StoreState>(() => super.clienteVeiculoState))
      .value;
  Computed<StoreState> _$clientePetStateComputed;

  @override
  StoreState get clientePetState => (_$clientePetStateComputed ??=
          Computed<StoreState>(() => super.clientePetState))
      .value;
  Computed<StoreState> _$atendimentoServicoInfoStateComputed;

  @override
  StoreState get atendimentoServicoInfoState =>
      (_$atendimentoServicoInfoStateComputed ??=
              Computed<StoreState>(() => super.atendimentoServicoInfoState))
          .value;
  Computed<StoreState> _$qtdeAtendimentosAtivosStateComputed;

  @override
  StoreState get qtdeAtendimentosAtivosState =>
      (_$qtdeAtendimentosAtivosStateComputed ??=
              Computed<StoreState>(() => super.qtdeAtendimentosAtivosState))
          .value;
  Computed<StoreState> _$qtdeAtendimentosIniciarStateComputed;

  @override
  StoreState get qtdeAtendimentosIniciarState =>
      (_$qtdeAtendimentosIniciarStateComputed ??=
              Computed<StoreState>(() => super.qtdeAtendimentosIniciarState))
          .value;
  Computed<StoreState> _$qtdeAtendimentosIniciadosStateComputed;

  @override
  StoreState get qtdeAtendimentosIniciadosState =>
      (_$qtdeAtendimentosIniciadosStateComputed ??=
              Computed<StoreState>(() => super.qtdeAtendimentosIniciadosState))
          .value;
  Computed<StoreState> _$qtdeAtendimentosFinalizarStateComputed;

  @override
  StoreState get qtdeAtendimentosFinalizarState =>
      (_$qtdeAtendimentosFinalizarStateComputed ??=
              Computed<StoreState>(() => super.qtdeAtendimentosFinalizarState))
          .value;
  Computed<StoreState> _$qtdeAtendimentosFinalizadosStateComputed;

  @override
  StoreState get qtdeAtendimentosFinalizadosState =>
      (_$qtdeAtendimentosFinalizadosStateComputed ??= Computed<StoreState>(
              () => super.qtdeAtendimentosFinalizadosState))
          .value;
  Computed<StoreState> _$qtdeAtendimentosArquivadosStateComputed;

  @override
  StoreState get qtdeAtendimentosArquivadosState =>
      (_$qtdeAtendimentosArquivadosStateComputed ??=
              Computed<StoreState>(() => super.qtdeAtendimentosArquivadosState))
          .value;
  Computed<List<AtendimentoServicoModel>> _$listFilteredComputed;

  @override
  List<AtendimentoServicoModel> get listFiltered => (_$listFilteredComputed ??=
          Computed<List<AtendimentoServicoModel>>(() => super.listFiltered))
      .value;
  Computed<List<AtendimentoServicoInfoModel>> _$listFilteredInfoComputed;

  @override
  List<AtendimentoServicoInfoModel> get listFilteredInfo =>
      (_$listFilteredInfoComputed ??=
              Computed<List<AtendimentoServicoInfoModel>>(
                  () => super.listFilteredInfo))
          .value;

  final _$clientesEspeciaisAtom =
      Atom(name: '_AtendimentoServicoControllerBase.clientesEspeciais');

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
      Atom(name: '_AtendimentoServicoControllerBase.clientesComDesvio');

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

  final _$origemProdutoAtendimentoServicoIdAtom = Atom(
      name:
          '_AtendimentoServicoControllerBase.origemProdutoAtendimentoServicoId');

  @override
  int get origemProdutoAtendimentoServicoId {
    _$origemProdutoAtendimentoServicoIdAtom.context
        .enforceReadPolicy(_$origemProdutoAtendimentoServicoIdAtom);
    _$origemProdutoAtendimentoServicoIdAtom.reportObserved();
    return super.origemProdutoAtendimentoServicoId;
  }

  @override
  set origemProdutoAtendimentoServicoId(int value) {
    _$origemProdutoAtendimentoServicoIdAtom.context.conditionallyRunInAction(
        () {
      super.origemProdutoAtendimentoServicoId = value;
      _$origemProdutoAtendimentoServicoIdAtom.reportChanged();
    }, _$origemProdutoAtendimentoServicoIdAtom,
        name: '${_$origemProdutoAtendimentoServicoIdAtom.name}_set');
  }

  final _$origemProdutoTelaAtom =
      Atom(name: '_AtendimentoServicoControllerBase.origemProdutoTela');

  @override
  String get origemProdutoTela {
    _$origemProdutoTelaAtom.context.enforceReadPolicy(_$origemProdutoTelaAtom);
    _$origemProdutoTelaAtom.reportObserved();
    return super.origemProdutoTela;
  }

  @override
  set origemProdutoTela(String value) {
    _$origemProdutoTelaAtom.context.conditionallyRunInAction(() {
      super.origemProdutoTela = value;
      _$origemProdutoTelaAtom.reportChanged();
    }, _$origemProdutoTelaAtom, name: '${_$origemProdutoTelaAtom.name}_set');
  }

  final _$selectedDayAtom =
      Atom(name: '_AtendimentoServicoControllerBase.selectedDay');

  @override
  DateTime get selectedDay {
    _$selectedDayAtom.context.enforceReadPolicy(_$selectedDayAtom);
    _$selectedDayAtom.reportObserved();
    return super.selectedDay;
  }

  @override
  set selectedDay(DateTime value) {
    _$selectedDayAtom.context.conditionallyRunInAction(() {
      super.selectedDay = value;
      _$selectedDayAtom.reportChanged();
    }, _$selectedDayAtom, name: '${_$selectedDayAtom.name}_set');
  }

  final _$eventsAtom = Atom(name: '_AtendimentoServicoControllerBase.events');

  @override
  Map<DateTime, List<dynamic>> get events {
    _$eventsAtom.context.enforceReadPolicy(_$eventsAtom);
    _$eventsAtom.reportObserved();
    return super.events;
  }

  @override
  set events(Map<DateTime, List<dynamic>> value) {
    _$eventsAtom.context.conditionallyRunInAction(() {
      super.events = value;
      _$eventsAtom.reportChanged();
    }, _$eventsAtom, name: '${_$eventsAtom.name}_set');
  }

  final _$holidaysAtom =
      Atom(name: '_AtendimentoServicoControllerBase.holidays');

  @override
  Map<DateTime, List<dynamic>> get holidays {
    _$holidaysAtom.context.enforceReadPolicy(_$holidaysAtom);
    _$holidaysAtom.reportObserved();
    return super.holidays;
  }

  @override
  set holidays(Map<DateTime, List<dynamic>> value) {
    _$holidaysAtom.context.conditionallyRunInAction(() {
      super.holidays = value;
      _$holidaysAtom.reportChanged();
    }, _$holidaysAtom, name: '${_$holidaysAtom.name}_set');
  }

  final _$_servicoFutureAtom =
      Atom(name: '_AtendimentoServicoControllerBase._servicoFuture');

  @override
  ObservableFuture<List<AtendimentoServicoModel>> get _servicoFuture {
    _$_servicoFutureAtom.context.enforceReadPolicy(_$_servicoFutureAtom);
    _$_servicoFutureAtom.reportObserved();
    return super._servicoFuture;
  }

  @override
  set _servicoFuture(ObservableFuture<List<AtendimentoServicoModel>> value) {
    _$_servicoFutureAtom.context.conditionallyRunInAction(() {
      super._servicoFuture = value;
      _$_servicoFutureAtom.reportChanged();
    }, _$_servicoFutureAtom, name: '${_$_servicoFutureAtom.name}_set');
  }

  final _$atendimentosServicoAtom =
      Atom(name: '_AtendimentoServicoControllerBase.atendimentosServico');

  @override
  ObservableList<AtendimentoServicoModel> get atendimentosServico {
    _$atendimentosServicoAtom.context
        .enforceReadPolicy(_$atendimentosServicoAtom);
    _$atendimentosServicoAtom.reportObserved();
    return super.atendimentosServico;
  }

  @override
  set atendimentosServico(ObservableList<AtendimentoServicoModel> value) {
    _$atendimentosServicoAtom.context.conditionallyRunInAction(() {
      super.atendimentosServico = value;
      _$atendimentosServicoAtom.reportChanged();
    }, _$atendimentosServicoAtom,
        name: '${_$atendimentosServicoAtom.name}_set');
  }

  final _$_servicoCalendarFutureAtom =
      Atom(name: '_AtendimentoServicoControllerBase._servicoCalendarFuture');

  @override
  ObservableFuture<List<AtendimentoServicoModel>> get _servicoCalendarFuture {
    _$_servicoCalendarFutureAtom.context
        .enforceReadPolicy(_$_servicoCalendarFutureAtom);
    _$_servicoCalendarFutureAtom.reportObserved();
    return super._servicoCalendarFuture;
  }

  @override
  set _servicoCalendarFuture(
      ObservableFuture<List<AtendimentoServicoModel>> value) {
    _$_servicoCalendarFutureAtom.context.conditionallyRunInAction(() {
      super._servicoCalendarFuture = value;
      _$_servicoCalendarFutureAtom.reportChanged();
    }, _$_servicoCalendarFutureAtom,
        name: '${_$_servicoCalendarFutureAtom.name}_set');
  }

  final _$atendimentosServicoCalendarAtom = Atom(
      name: '_AtendimentoServicoControllerBase.atendimentosServicoCalendar');

  @override
  ObservableList<AtendimentoServicoModel> get atendimentosServicoCalendar {
    _$atendimentosServicoCalendarAtom.context
        .enforceReadPolicy(_$atendimentosServicoCalendarAtom);
    _$atendimentosServicoCalendarAtom.reportObserved();
    return super.atendimentosServicoCalendar;
  }

  @override
  set atendimentosServicoCalendar(
      ObservableList<AtendimentoServicoModel> value) {
    _$atendimentosServicoCalendarAtom.context.conditionallyRunInAction(() {
      super.atendimentosServicoCalendar = value;
      _$atendimentosServicoCalendarAtom.reportChanged();
    }, _$atendimentosServicoCalendarAtom,
        name: '${_$atendimentosServicoCalendarAtom.name}_set');
  }

  final _$filterAtom = Atom(name: '_AtendimentoServicoControllerBase.filter');

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

  final _$filterInfoAtom =
      Atom(name: '_AtendimentoServicoControllerBase.filterInfo');

  @override
  String get filterInfo {
    _$filterInfoAtom.context.enforceReadPolicy(_$filterInfoAtom);
    _$filterInfoAtom.reportObserved();
    return super.filterInfo;
  }

  @override
  set filterInfo(String value) {
    _$filterInfoAtom.context.conditionallyRunInAction(() {
      super.filterInfo = value;
      _$filterInfoAtom.reportChanged();
    }, _$filterInfoAtom, name: '${_$filterInfoAtom.name}_set');
  }

  final _$_tagsFutureAtom =
      Atom(name: '_AtendimentoServicoControllerBase._tagsFuture');

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
      Atom(name: '_AtendimentoServicoControllerBase.tagsModel');

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

  final _$tagsToSaveAtom =
      Atom(name: '_AtendimentoServicoControllerBase.tagsToSave');

  @override
  ObservableList<String> get tagsToSave {
    _$tagsToSaveAtom.context.enforceReadPolicy(_$tagsToSaveAtom);
    _$tagsToSaveAtom.reportObserved();
    return super.tagsToSave;
  }

  @override
  set tagsToSave(ObservableList<String> value) {
    _$tagsToSaveAtom.context.conditionallyRunInAction(() {
      super.tagsToSave = value;
      _$tagsToSaveAtom.reportChanged();
    }, _$tagsToSaveAtom, name: '${_$tagsToSaveAtom.name}_set');
  }

  final _$tagsAtom = Atom(name: '_AtendimentoServicoControllerBase.tags');

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

  final _$clienteEscolhidoIdAtom =
      Atom(name: '_AtendimentoServicoControllerBase.clienteEscolhidoId');

  @override
  int get clienteEscolhidoId {
    _$clienteEscolhidoIdAtom.context
        .enforceReadPolicy(_$clienteEscolhidoIdAtom);
    _$clienteEscolhidoIdAtom.reportObserved();
    return super.clienteEscolhidoId;
  }

  @override
  set clienteEscolhidoId(int value) {
    _$clienteEscolhidoIdAtom.context.conditionallyRunInAction(() {
      super.clienteEscolhidoId = value;
      _$clienteEscolhidoIdAtom.reportChanged();
    }, _$clienteEscolhidoIdAtom, name: '${_$clienteEscolhidoIdAtom.name}_set');
  }

  final _$clienteEscolhidoNomeAtom =
      Atom(name: '_AtendimentoServicoControllerBase.clienteEscolhidoNome');

  @override
  String get clienteEscolhidoNome {
    _$clienteEscolhidoNomeAtom.context
        .enforceReadPolicy(_$clienteEscolhidoNomeAtom);
    _$clienteEscolhidoNomeAtom.reportObserved();
    return super.clienteEscolhidoNome;
  }

  @override
  set clienteEscolhidoNome(String value) {
    _$clienteEscolhidoNomeAtom.context.conditionallyRunInAction(() {
      super.clienteEscolhidoNome = value;
      _$clienteEscolhidoNomeAtom.reportChanged();
    }, _$clienteEscolhidoNomeAtom,
        name: '${_$clienteEscolhidoNomeAtom.name}_set');
  }

  final _$clienteObjetoEscolhidoIdAtom =
      Atom(name: '_AtendimentoServicoControllerBase.clienteObjetoEscolhidoId');

  @override
  int get clienteObjetoEscolhidoId {
    _$clienteObjetoEscolhidoIdAtom.context
        .enforceReadPolicy(_$clienteObjetoEscolhidoIdAtom);
    _$clienteObjetoEscolhidoIdAtom.reportObserved();
    return super.clienteObjetoEscolhidoId;
  }

  @override
  set clienteObjetoEscolhidoId(int value) {
    _$clienteObjetoEscolhidoIdAtom.context.conditionallyRunInAction(() {
      super.clienteObjetoEscolhidoId = value;
      _$clienteObjetoEscolhidoIdAtom.reportChanged();
    }, _$clienteObjetoEscolhidoIdAtom,
        name: '${_$clienteObjetoEscolhidoIdAtom.name}_set');
  }

  final _$clienteObjetoEscolhidoNomeAtom = Atom(
      name: '_AtendimentoServicoControllerBase.clienteObjetoEscolhidoNome');

  @override
  String get clienteObjetoEscolhidoNome {
    _$clienteObjetoEscolhidoNomeAtom.context
        .enforceReadPolicy(_$clienteObjetoEscolhidoNomeAtom);
    _$clienteObjetoEscolhidoNomeAtom.reportObserved();
    return super.clienteObjetoEscolhidoNome;
  }

  @override
  set clienteObjetoEscolhidoNome(String value) {
    _$clienteObjetoEscolhidoNomeAtom.context.conditionallyRunInAction(() {
      super.clienteObjetoEscolhidoNome = value;
      _$clienteObjetoEscolhidoNomeAtom.reportChanged();
    }, _$clienteObjetoEscolhidoNomeAtom,
        name: '${_$clienteObjetoEscolhidoNomeAtom.name}_set');
  }

  final _$descricaoServicoAtom =
      Atom(name: '_AtendimentoServicoControllerBase.descricaoServico');

  @override
  String get descricaoServico {
    _$descricaoServicoAtom.context.enforceReadPolicy(_$descricaoServicoAtom);
    _$descricaoServicoAtom.reportObserved();
    return super.descricaoServico;
  }

  @override
  set descricaoServico(String value) {
    _$descricaoServicoAtom.context.conditionallyRunInAction(() {
      super.descricaoServico = value;
      _$descricaoServicoAtom.reportChanged();
    }, _$descricaoServicoAtom, name: '${_$descricaoServicoAtom.name}_set');
  }

  final _$iniciarDataAtom =
      Atom(name: '_AtendimentoServicoControllerBase.iniciarData');

  @override
  String get iniciarData {
    _$iniciarDataAtom.context.enforceReadPolicy(_$iniciarDataAtom);
    _$iniciarDataAtom.reportObserved();
    return super.iniciarData;
  }

  @override
  set iniciarData(String value) {
    _$iniciarDataAtom.context.conditionallyRunInAction(() {
      super.iniciarData = value;
      _$iniciarDataAtom.reportChanged();
    }, _$iniciarDataAtom, name: '${_$iniciarDataAtom.name}_set');
  }

  final _$finalizarDataAtom =
      Atom(name: '_AtendimentoServicoControllerBase.finalizarData');

  @override
  String get finalizarData {
    _$finalizarDataAtom.context.enforceReadPolicy(_$finalizarDataAtom);
    _$finalizarDataAtom.reportObserved();
    return super.finalizarData;
  }

  @override
  set finalizarData(String value) {
    _$finalizarDataAtom.context.conditionallyRunInAction(() {
      super.finalizarData = value;
      _$finalizarDataAtom.reportChanged();
    }, _$finalizarDataAtom, name: '${_$finalizarDataAtom.name}_set');
  }

  final _$valorAtom = Atom(name: '_AtendimentoServicoControllerBase.valor');

  @override
  String get valor {
    _$valorAtom.context.enforceReadPolicy(_$valorAtom);
    _$valorAtom.reportObserved();
    return super.valor;
  }

  @override
  set valor(String value) {
    _$valorAtom.context.conditionallyRunInAction(() {
      super.valor = value;
      _$valorAtom.reportChanged();
    }, _$valorAtom, name: '${_$valorAtom.name}_set');
  }

  final _$valorToSaveAtom =
      Atom(name: '_AtendimentoServicoControllerBase.valorToSave');

  @override
  double get valorToSave {
    _$valorToSaveAtom.context.enforceReadPolicy(_$valorToSaveAtom);
    _$valorToSaveAtom.reportObserved();
    return super.valorToSave;
  }

  @override
  set valorToSave(double value) {
    _$valorToSaveAtom.context.conditionallyRunInAction(() {
      super.valorToSave = value;
      _$valorToSaveAtom.reportChanged();
    }, _$valorToSaveAtom, name: '${_$valorToSaveAtom.name}_set');
  }

  final _$observacaoAtom =
      Atom(name: '_AtendimentoServicoControllerBase.observacao');

  @override
  String get observacao {
    _$observacaoAtom.context.enforceReadPolicy(_$observacaoAtom);
    _$observacaoAtom.reportObserved();
    return super.observacao;
  }

  @override
  set observacao(String value) {
    _$observacaoAtom.context.conditionallyRunInAction(() {
      super.observacao = value;
      _$observacaoAtom.reportChanged();
    }, _$observacaoAtom, name: '${_$observacaoAtom.name}_set');
  }

  final _$produtosEscolhidosAtom =
      Atom(name: '_AtendimentoServicoControllerBase.produtosEscolhidos');

  @override
  List<ProdutoModel> get produtosEscolhidos {
    _$produtosEscolhidosAtom.context
        .enforceReadPolicy(_$produtosEscolhidosAtom);
    _$produtosEscolhidosAtom.reportObserved();
    return super.produtosEscolhidos;
  }

  @override
  set produtosEscolhidos(List<ProdutoModel> value) {
    _$produtosEscolhidosAtom.context.conditionallyRunInAction(() {
      super.produtosEscolhidos = value;
      _$produtosEscolhidosAtom.reportChanged();
    }, _$produtosEscolhidosAtom, name: '${_$produtosEscolhidosAtom.name}_set');
  }

  final _$_produtosEscolhidosFutureAtom =
      Atom(name: '_AtendimentoServicoControllerBase._produtosEscolhidosFuture');

  @override
  ObservableFuture<List<ProdutoModel>> get _produtosEscolhidosFuture {
    _$_produtosEscolhidosFutureAtom.context
        .enforceReadPolicy(_$_produtosEscolhidosFutureAtom);
    _$_produtosEscolhidosFutureAtom.reportObserved();
    return super._produtosEscolhidosFuture;
  }

  @override
  set _produtosEscolhidosFuture(ObservableFuture<List<ProdutoModel>> value) {
    _$_produtosEscolhidosFutureAtom.context.conditionallyRunInAction(() {
      super._produtosEscolhidosFuture = value;
      _$_produtosEscolhidosFutureAtom.reportChanged();
    }, _$_produtosEscolhidosFutureAtom,
        name: '${_$_produtosEscolhidosFutureAtom.name}_set');
  }

  final _$produtosDoServicoValorTotalAtom = Atom(
      name: '_AtendimentoServicoControllerBase.produtosDoServicoValorTotal');

  @override
  double get produtosDoServicoValorTotal {
    _$produtosDoServicoValorTotalAtom.context
        .enforceReadPolicy(_$produtosDoServicoValorTotalAtom);
    _$produtosDoServicoValorTotalAtom.reportObserved();
    return super.produtosDoServicoValorTotal;
  }

  @override
  set produtosDoServicoValorTotal(double value) {
    _$produtosDoServicoValorTotalAtom.context.conditionallyRunInAction(() {
      super.produtosDoServicoValorTotal = value;
      _$produtosDoServicoValorTotalAtom.reportChanged();
    }, _$produtosDoServicoValorTotalAtom,
        name: '${_$produtosDoServicoValorTotalAtom.name}_set');
  }

  final _$produtosDoServicoAtom =
      Atom(name: '_AtendimentoServicoControllerBase.produtosDoServico');

  @override
  List<AtendimentoServicoItemModel> get produtosDoServico {
    _$produtosDoServicoAtom.context.enforceReadPolicy(_$produtosDoServicoAtom);
    _$produtosDoServicoAtom.reportObserved();
    return super.produtosDoServico;
  }

  @override
  set produtosDoServico(List<AtendimentoServicoItemModel> value) {
    _$produtosDoServicoAtom.context.conditionallyRunInAction(() {
      super.produtosDoServico = value;
      _$produtosDoServicoAtom.reportChanged();
    }, _$produtosDoServicoAtom, name: '${_$produtosDoServicoAtom.name}_set');
  }

  final _$_produtosDoServicoFutureAtom =
      Atom(name: '_AtendimentoServicoControllerBase._produtosDoServicoFuture');

  @override
  ObservableFuture<List<AtendimentoServicoItemModel>>
      get _produtosDoServicoFuture {
    _$_produtosDoServicoFutureAtom.context
        .enforceReadPolicy(_$_produtosDoServicoFutureAtom);
    _$_produtosDoServicoFutureAtom.reportObserved();
    return super._produtosDoServicoFuture;
  }

  @override
  set _produtosDoServicoFuture(
      ObservableFuture<List<AtendimentoServicoItemModel>> value) {
    _$_produtosDoServicoFutureAtom.context.conditionallyRunInAction(() {
      super._produtosDoServicoFuture = value;
      _$_produtosDoServicoFutureAtom.reportChanged();
    }, _$_produtosDoServicoFutureAtom,
        name: '${_$_produtosDoServicoFutureAtom.name}_set');
  }

  final _$faturamentoDoServicoValorTotalAtom = Atom(
      name: '_AtendimentoServicoControllerBase.faturamentoDoServicoValorTotal');

  @override
  double get faturamentoDoServicoValorTotal {
    _$faturamentoDoServicoValorTotalAtom.context
        .enforceReadPolicy(_$faturamentoDoServicoValorTotalAtom);
    _$faturamentoDoServicoValorTotalAtom.reportObserved();
    return super.faturamentoDoServicoValorTotal;
  }

  @override
  set faturamentoDoServicoValorTotal(double value) {
    _$faturamentoDoServicoValorTotalAtom.context.conditionallyRunInAction(() {
      super.faturamentoDoServicoValorTotal = value;
      _$faturamentoDoServicoValorTotalAtom.reportChanged();
    }, _$faturamentoDoServicoValorTotalAtom,
        name: '${_$faturamentoDoServicoValorTotalAtom.name}_set');
  }

  final _$faturamentoDoServicoAtom =
      Atom(name: '_AtendimentoServicoControllerBase.faturamentoDoServico');

  @override
  List<MovimentacaoFaturamentoModel> get faturamentoDoServico {
    _$faturamentoDoServicoAtom.context
        .enforceReadPolicy(_$faturamentoDoServicoAtom);
    _$faturamentoDoServicoAtom.reportObserved();
    return super.faturamentoDoServico;
  }

  @override
  set faturamentoDoServico(List<MovimentacaoFaturamentoModel> value) {
    _$faturamentoDoServicoAtom.context.conditionallyRunInAction(() {
      super.faturamentoDoServico = value;
      _$faturamentoDoServicoAtom.reportChanged();
    }, _$faturamentoDoServicoAtom,
        name: '${_$faturamentoDoServicoAtom.name}_set');
  }

  final _$_faturamentoDoServicoFutureAtom = Atom(
      name: '_AtendimentoServicoControllerBase._faturamentoDoServicoFuture');

  @override
  ObservableFuture<List<MovimentacaoFaturamentoModel>>
      get _faturamentoDoServicoFuture {
    _$_faturamentoDoServicoFutureAtom.context
        .enforceReadPolicy(_$_faturamentoDoServicoFutureAtom);
    _$_faturamentoDoServicoFutureAtom.reportObserved();
    return super._faturamentoDoServicoFuture;
  }

  @override
  set _faturamentoDoServicoFuture(
      ObservableFuture<List<MovimentacaoFaturamentoModel>> value) {
    _$_faturamentoDoServicoFutureAtom.context.conditionallyRunInAction(() {
      super._faturamentoDoServicoFuture = value;
      _$_faturamentoDoServicoFutureAtom.reportChanged();
    }, _$_faturamentoDoServicoFutureAtom,
        name: '${_$_faturamentoDoServicoFutureAtom.name}_set');
  }

  final _$clienteVeiculoAtom =
      Atom(name: '_AtendimentoServicoControllerBase.clienteVeiculo');

  @override
  ClienteVeiculoModel get clienteVeiculo {
    _$clienteVeiculoAtom.context.enforceReadPolicy(_$clienteVeiculoAtom);
    _$clienteVeiculoAtom.reportObserved();
    return super.clienteVeiculo;
  }

  @override
  set clienteVeiculo(ClienteVeiculoModel value) {
    _$clienteVeiculoAtom.context.conditionallyRunInAction(() {
      super.clienteVeiculo = value;
      _$clienteVeiculoAtom.reportChanged();
    }, _$clienteVeiculoAtom, name: '${_$clienteVeiculoAtom.name}_set');
  }

  final _$_clienteVeiculoFutureAtom =
      Atom(name: '_AtendimentoServicoControllerBase._clienteVeiculoFuture');

  @override
  ObservableFuture<ClienteVeiculoModel> get _clienteVeiculoFuture {
    _$_clienteVeiculoFutureAtom.context
        .enforceReadPolicy(_$_clienteVeiculoFutureAtom);
    _$_clienteVeiculoFutureAtom.reportObserved();
    return super._clienteVeiculoFuture;
  }

  @override
  set _clienteVeiculoFuture(ObservableFuture<ClienteVeiculoModel> value) {
    _$_clienteVeiculoFutureAtom.context.conditionallyRunInAction(() {
      super._clienteVeiculoFuture = value;
      _$_clienteVeiculoFutureAtom.reportChanged();
    }, _$_clienteVeiculoFutureAtom,
        name: '${_$_clienteVeiculoFutureAtom.name}_set');
  }

  final _$clientePetAtom =
      Atom(name: '_AtendimentoServicoControllerBase.clientePet');

  @override
  ClientePetModel get clientePet {
    _$clientePetAtom.context.enforceReadPolicy(_$clientePetAtom);
    _$clientePetAtom.reportObserved();
    return super.clientePet;
  }

  @override
  set clientePet(ClientePetModel value) {
    _$clientePetAtom.context.conditionallyRunInAction(() {
      super.clientePet = value;
      _$clientePetAtom.reportChanged();
    }, _$clientePetAtom, name: '${_$clientePetAtom.name}_set');
  }

  final _$_clientePetFutureAtom =
      Atom(name: '_AtendimentoServicoControllerBase._clientePetFuture');

  @override
  ObservableFuture<ClientePetModel> get _clientePetFuture {
    _$_clientePetFutureAtom.context.enforceReadPolicy(_$_clientePetFutureAtom);
    _$_clientePetFutureAtom.reportObserved();
    return super._clientePetFuture;
  }

  @override
  set _clientePetFuture(ObservableFuture<ClientePetModel> value) {
    _$_clientePetFutureAtom.context.conditionallyRunInAction(() {
      super._clientePetFuture = value;
      _$_clientePetFutureAtom.reportChanged();
    }, _$_clientePetFutureAtom, name: '${_$_clientePetFutureAtom.name}_set');
  }

  final _$atendimentoServicoInfoAtom =
      Atom(name: '_AtendimentoServicoControllerBase.atendimentoServicoInfo');

  @override
  List<AtendimentoServicoInfoModel> get atendimentoServicoInfo {
    _$atendimentoServicoInfoAtom.context
        .enforceReadPolicy(_$atendimentoServicoInfoAtom);
    _$atendimentoServicoInfoAtom.reportObserved();
    return super.atendimentoServicoInfo;
  }

  @override
  set atendimentoServicoInfo(List<AtendimentoServicoInfoModel> value) {
    _$atendimentoServicoInfoAtom.context.conditionallyRunInAction(() {
      super.atendimentoServicoInfo = value;
      _$atendimentoServicoInfoAtom.reportChanged();
    }, _$atendimentoServicoInfoAtom,
        name: '${_$atendimentoServicoInfoAtom.name}_set');
  }

  final _$_atendimentoServicoInfoFutureAtom = Atom(
      name: '_AtendimentoServicoControllerBase._atendimentoServicoInfoFuture');

  @override
  ObservableFuture<List<AtendimentoServicoInfoModel>>
      get _atendimentoServicoInfoFuture {
    _$_atendimentoServicoInfoFutureAtom.context
        .enforceReadPolicy(_$_atendimentoServicoInfoFutureAtom);
    _$_atendimentoServicoInfoFutureAtom.reportObserved();
    return super._atendimentoServicoInfoFuture;
  }

  @override
  set _atendimentoServicoInfoFuture(
      ObservableFuture<List<AtendimentoServicoInfoModel>> value) {
    _$_atendimentoServicoInfoFutureAtom.context.conditionallyRunInAction(() {
      super._atendimentoServicoInfoFuture = value;
      _$_atendimentoServicoInfoFutureAtom.reportChanged();
    }, _$_atendimentoServicoInfoFutureAtom,
        name: '${_$_atendimentoServicoInfoFutureAtom.name}_set');
  }

  final _$qtdeParcelasAtom =
      Atom(name: '_AtendimentoServicoControllerBase.qtdeParcelas');

  @override
  int get qtdeParcelas {
    _$qtdeParcelasAtom.context.enforceReadPolicy(_$qtdeParcelasAtom);
    _$qtdeParcelasAtom.reportObserved();
    return super.qtdeParcelas;
  }

  @override
  set qtdeParcelas(int value) {
    _$qtdeParcelasAtom.context.conditionallyRunInAction(() {
      super.qtdeParcelas = value;
      _$qtdeParcelasAtom.reportChanged();
    }, _$qtdeParcelasAtom, name: '${_$qtdeParcelasAtom.name}_set');
  }

  final _$_qtdeAtendimentosAtivosFutureAtom = Atom(
      name: '_AtendimentoServicoControllerBase._qtdeAtendimentosAtivosFuture');

  @override
  ObservableFuture<RespostaModel> get _qtdeAtendimentosAtivosFuture {
    _$_qtdeAtendimentosAtivosFutureAtom.context
        .enforceReadPolicy(_$_qtdeAtendimentosAtivosFutureAtom);
    _$_qtdeAtendimentosAtivosFutureAtom.reportObserved();
    return super._qtdeAtendimentosAtivosFuture;
  }

  @override
  set _qtdeAtendimentosAtivosFuture(ObservableFuture<RespostaModel> value) {
    _$_qtdeAtendimentosAtivosFutureAtom.context.conditionallyRunInAction(() {
      super._qtdeAtendimentosAtivosFuture = value;
      _$_qtdeAtendimentosAtivosFutureAtom.reportChanged();
    }, _$_qtdeAtendimentosAtivosFutureAtom,
        name: '${_$_qtdeAtendimentosAtivosFutureAtom.name}_set');
  }

  final _$qtdeAtendimentosAtivosAtom =
      Atom(name: '_AtendimentoServicoControllerBase.qtdeAtendimentosAtivos');

  @override
  String get qtdeAtendimentosAtivos {
    _$qtdeAtendimentosAtivosAtom.context
        .enforceReadPolicy(_$qtdeAtendimentosAtivosAtom);
    _$qtdeAtendimentosAtivosAtom.reportObserved();
    return super.qtdeAtendimentosAtivos;
  }

  @override
  set qtdeAtendimentosAtivos(String value) {
    _$qtdeAtendimentosAtivosAtom.context.conditionallyRunInAction(() {
      super.qtdeAtendimentosAtivos = value;
      _$qtdeAtendimentosAtivosAtom.reportChanged();
    }, _$qtdeAtendimentosAtivosAtom,
        name: '${_$qtdeAtendimentosAtivosAtom.name}_set');
  }

  final _$_qtdeAtendimentosIniciarFutureAtom = Atom(
      name: '_AtendimentoServicoControllerBase._qtdeAtendimentosIniciarFuture');

  @override
  ObservableFuture<RespostaModel> get _qtdeAtendimentosIniciarFuture {
    _$_qtdeAtendimentosIniciarFutureAtom.context
        .enforceReadPolicy(_$_qtdeAtendimentosIniciarFutureAtom);
    _$_qtdeAtendimentosIniciarFutureAtom.reportObserved();
    return super._qtdeAtendimentosIniciarFuture;
  }

  @override
  set _qtdeAtendimentosIniciarFuture(ObservableFuture<RespostaModel> value) {
    _$_qtdeAtendimentosIniciarFutureAtom.context.conditionallyRunInAction(() {
      super._qtdeAtendimentosIniciarFuture = value;
      _$_qtdeAtendimentosIniciarFutureAtom.reportChanged();
    }, _$_qtdeAtendimentosIniciarFutureAtom,
        name: '${_$_qtdeAtendimentosIniciarFutureAtom.name}_set');
  }

  final _$qtdeAtendimentosIniciarAtom =
      Atom(name: '_AtendimentoServicoControllerBase.qtdeAtendimentosIniciar');

  @override
  String get qtdeAtendimentosIniciar {
    _$qtdeAtendimentosIniciarAtom.context
        .enforceReadPolicy(_$qtdeAtendimentosIniciarAtom);
    _$qtdeAtendimentosIniciarAtom.reportObserved();
    return super.qtdeAtendimentosIniciar;
  }

  @override
  set qtdeAtendimentosIniciar(String value) {
    _$qtdeAtendimentosIniciarAtom.context.conditionallyRunInAction(() {
      super.qtdeAtendimentosIniciar = value;
      _$qtdeAtendimentosIniciarAtom.reportChanged();
    }, _$qtdeAtendimentosIniciarAtom,
        name: '${_$qtdeAtendimentosIniciarAtom.name}_set');
  }

  final _$_qtdeAtendimentosIniciadosFutureAtom = Atom(
      name:
          '_AtendimentoServicoControllerBase._qtdeAtendimentosIniciadosFuture');

  @override
  ObservableFuture<RespostaModel> get _qtdeAtendimentosIniciadosFuture {
    _$_qtdeAtendimentosIniciadosFutureAtom.context
        .enforceReadPolicy(_$_qtdeAtendimentosIniciadosFutureAtom);
    _$_qtdeAtendimentosIniciadosFutureAtom.reportObserved();
    return super._qtdeAtendimentosIniciadosFuture;
  }

  @override
  set _qtdeAtendimentosIniciadosFuture(ObservableFuture<RespostaModel> value) {
    _$_qtdeAtendimentosIniciadosFutureAtom.context.conditionallyRunInAction(() {
      super._qtdeAtendimentosIniciadosFuture = value;
      _$_qtdeAtendimentosIniciadosFutureAtom.reportChanged();
    }, _$_qtdeAtendimentosIniciadosFutureAtom,
        name: '${_$_qtdeAtendimentosIniciadosFutureAtom.name}_set');
  }

  final _$qtdeAtendimentosIniciadosAtom =
      Atom(name: '_AtendimentoServicoControllerBase.qtdeAtendimentosIniciados');

  @override
  String get qtdeAtendimentosIniciados {
    _$qtdeAtendimentosIniciadosAtom.context
        .enforceReadPolicy(_$qtdeAtendimentosIniciadosAtom);
    _$qtdeAtendimentosIniciadosAtom.reportObserved();
    return super.qtdeAtendimentosIniciados;
  }

  @override
  set qtdeAtendimentosIniciados(String value) {
    _$qtdeAtendimentosIniciadosAtom.context.conditionallyRunInAction(() {
      super.qtdeAtendimentosIniciados = value;
      _$qtdeAtendimentosIniciadosAtom.reportChanged();
    }, _$qtdeAtendimentosIniciadosAtom,
        name: '${_$qtdeAtendimentosIniciadosAtom.name}_set');
  }

  final _$_qtdeAtendimentosFinalizarFutureAtom = Atom(
      name:
          '_AtendimentoServicoControllerBase._qtdeAtendimentosFinalizarFuture');

  @override
  ObservableFuture<RespostaModel> get _qtdeAtendimentosFinalizarFuture {
    _$_qtdeAtendimentosFinalizarFutureAtom.context
        .enforceReadPolicy(_$_qtdeAtendimentosFinalizarFutureAtom);
    _$_qtdeAtendimentosFinalizarFutureAtom.reportObserved();
    return super._qtdeAtendimentosFinalizarFuture;
  }

  @override
  set _qtdeAtendimentosFinalizarFuture(ObservableFuture<RespostaModel> value) {
    _$_qtdeAtendimentosFinalizarFutureAtom.context.conditionallyRunInAction(() {
      super._qtdeAtendimentosFinalizarFuture = value;
      _$_qtdeAtendimentosFinalizarFutureAtom.reportChanged();
    }, _$_qtdeAtendimentosFinalizarFutureAtom,
        name: '${_$_qtdeAtendimentosFinalizarFutureAtom.name}_set');
  }

  final _$qtdeAtendimentosFinalizarAtom =
      Atom(name: '_AtendimentoServicoControllerBase.qtdeAtendimentosFinalizar');

  @override
  String get qtdeAtendimentosFinalizar {
    _$qtdeAtendimentosFinalizarAtom.context
        .enforceReadPolicy(_$qtdeAtendimentosFinalizarAtom);
    _$qtdeAtendimentosFinalizarAtom.reportObserved();
    return super.qtdeAtendimentosFinalizar;
  }

  @override
  set qtdeAtendimentosFinalizar(String value) {
    _$qtdeAtendimentosFinalizarAtom.context.conditionallyRunInAction(() {
      super.qtdeAtendimentosFinalizar = value;
      _$qtdeAtendimentosFinalizarAtom.reportChanged();
    }, _$qtdeAtendimentosFinalizarAtom,
        name: '${_$qtdeAtendimentosFinalizarAtom.name}_set');
  }

  final _$_qtdeAtendimentosFinalizadosFutureAtom = Atom(
      name:
          '_AtendimentoServicoControllerBase._qtdeAtendimentosFinalizadosFuture');

  @override
  ObservableFuture<RespostaModel> get _qtdeAtendimentosFinalizadosFuture {
    _$_qtdeAtendimentosFinalizadosFutureAtom.context
        .enforceReadPolicy(_$_qtdeAtendimentosFinalizadosFutureAtom);
    _$_qtdeAtendimentosFinalizadosFutureAtom.reportObserved();
    return super._qtdeAtendimentosFinalizadosFuture;
  }

  @override
  set _qtdeAtendimentosFinalizadosFuture(
      ObservableFuture<RespostaModel> value) {
    _$_qtdeAtendimentosFinalizadosFutureAtom.context.conditionallyRunInAction(
        () {
      super._qtdeAtendimentosFinalizadosFuture = value;
      _$_qtdeAtendimentosFinalizadosFutureAtom.reportChanged();
    }, _$_qtdeAtendimentosFinalizadosFutureAtom,
        name: '${_$_qtdeAtendimentosFinalizadosFutureAtom.name}_set');
  }

  final _$qtdeAtendimentosFinalizadosAtom = Atom(
      name: '_AtendimentoServicoControllerBase.qtdeAtendimentosFinalizados');

  @override
  String get qtdeAtendimentosFinalizados {
    _$qtdeAtendimentosFinalizadosAtom.context
        .enforceReadPolicy(_$qtdeAtendimentosFinalizadosAtom);
    _$qtdeAtendimentosFinalizadosAtom.reportObserved();
    return super.qtdeAtendimentosFinalizados;
  }

  @override
  set qtdeAtendimentosFinalizados(String value) {
    _$qtdeAtendimentosFinalizadosAtom.context.conditionallyRunInAction(() {
      super.qtdeAtendimentosFinalizados = value;
      _$qtdeAtendimentosFinalizadosAtom.reportChanged();
    }, _$qtdeAtendimentosFinalizadosAtom,
        name: '${_$qtdeAtendimentosFinalizadosAtom.name}_set');
  }

  final _$_qtdeAtendimentosArquivadosFutureAtom = Atom(
      name:
          '_AtendimentoServicoControllerBase._qtdeAtendimentosArquivadosFuture');

  @override
  ObservableFuture<RespostaModel> get _qtdeAtendimentosArquivadosFuture {
    _$_qtdeAtendimentosArquivadosFutureAtom.context
        .enforceReadPolicy(_$_qtdeAtendimentosArquivadosFutureAtom);
    _$_qtdeAtendimentosArquivadosFutureAtom.reportObserved();
    return super._qtdeAtendimentosArquivadosFuture;
  }

  @override
  set _qtdeAtendimentosArquivadosFuture(ObservableFuture<RespostaModel> value) {
    _$_qtdeAtendimentosArquivadosFutureAtom.context.conditionallyRunInAction(
        () {
      super._qtdeAtendimentosArquivadosFuture = value;
      _$_qtdeAtendimentosArquivadosFutureAtom.reportChanged();
    }, _$_qtdeAtendimentosArquivadosFutureAtom,
        name: '${_$_qtdeAtendimentosArquivadosFutureAtom.name}_set');
  }

  final _$qtdeAtendimentosArquivadosAtom = Atom(
      name: '_AtendimentoServicoControllerBase.qtdeAtendimentosArquivados');

  @override
  String get qtdeAtendimentosArquivados {
    _$qtdeAtendimentosArquivadosAtom.context
        .enforceReadPolicy(_$qtdeAtendimentosArquivadosAtom);
    _$qtdeAtendimentosArquivadosAtom.reportObserved();
    return super.qtdeAtendimentosArquivados;
  }

  @override
  set qtdeAtendimentosArquivados(String value) {
    _$qtdeAtendimentosArquivadosAtom.context.conditionallyRunInAction(() {
      super.qtdeAtendimentosArquivados = value;
      _$qtdeAtendimentosArquivadosAtom.reportChanged();
    }, _$qtdeAtendimentosArquivadosAtom,
        name: '${_$qtdeAtendimentosArquivadosAtom.name}_set');
  }

  final _$sistemaRefAtom =
      Atom(name: '_AtendimentoServicoControllerBase.sistemaRef');

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
      Atom(name: '_AtendimentoServicoControllerBase.errorMessage');

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

  final _$removerProdutoDoServicoSendoCriadoAsyncAction =
      AsyncAction('removerProdutoDoServicoSendoCriado');

  @override
  Future<void> removerProdutoDoServicoSendoCriado(
      AtendimentoServicoItemModel item) {
    return _$removerProdutoDoServicoSendoCriadoAsyncAction
        .run(() => super.removerProdutoDoServicoSendoCriado(item));
  }

  final _$gravarObservacaoProdutoNoAtendimentoAsyncAction =
      AsyncAction('gravarObservacaoProdutoNoAtendimento');

  @override
  Future<void> gravarObservacaoProdutoNoAtendimento(String observacao,
      int produtoId, int atendimentoServicoId, int itemAtendimentoServicoId) {
    return _$gravarObservacaoProdutoNoAtendimentoAsyncAction.run(() => super
        .gravarObservacaoProdutoNoAtendimento(observacao, produtoId,
            atendimentoServicoId, itemAtendimentoServicoId));
  }

  final _$removerProdutoDoServicoAposCriadoAsyncAction =
      AsyncAction('removerProdutoDoServicoAposCriado');

  @override
  Future<void> removerProdutoDoServicoAposCriado(
      AtendimentoServicoItemModel item) {
    return _$removerProdutoDoServicoAposCriadoAsyncAction
        .run(() => super.removerProdutoDoServicoAposCriado(item));
  }

  final _$consultarProdutoDoServicoAsyncAction =
      AsyncAction('consultarProdutoDoServico');

  @override
  Future<void> consultarProdutoDoServico() {
    return _$consultarProdutoDoServicoAsyncAction
        .run(() => super.consultarProdutoDoServico());
  }

  final _$obterTagsAsyncAction = AsyncAction('obterTags');

  @override
  Future<void> obterTags() {
    return _$obterTagsAsyncAction.run(() => super.obterTags());
  }

  final _$obterUltimosServicosDaEmpresaParaTelaAsyncAction =
      AsyncAction('obterUltimosServicosDaEmpresaParaTela');

  @override
  Future<void> obterUltimosServicosDaEmpresaParaTela() {
    return _$obterUltimosServicosDaEmpresaParaTelaAsyncAction
        .run(() => super.obterUltimosServicosDaEmpresaParaTela());
  }

  final _$obterQtdeServicosAsyncAction = AsyncAction('obterQtdeServicos');

  @override
  Future<void> obterQtdeServicos(String ref) {
    return _$obterQtdeServicosAsyncAction
        .run(() => super.obterQtdeServicos(ref));
  }

  final _$obterServicosAsyncAction = AsyncAction('obterServicos');

  @override
  Future<void> obterServicos(String ref, String opc, String quando) {
    return _$obterServicosAsyncAction
        .run(() => super.obterServicos(ref, opc, quando));
  }

  final _$_AtendimentoServicoControllerBaseActionController =
      ActionController(name: '_AtendimentoServicoControllerBase');

  @override
  dynamic setFilter(String value) {
    final _$actionInfo =
        _$_AtendimentoServicoControllerBaseActionController.startAction();
    try {
      return super.setFilter(value);
    } finally {
      _$_AtendimentoServicoControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFilterInfo(String value) {
    final _$actionInfo =
        _$_AtendimentoServicoControllerBaseActionController.startAction();
    try {
      return super.setFilterInfo(value);
    } finally {
      _$_AtendimentoServicoControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeObservacao(String observacaoValue) {
    final _$actionInfo =
        _$_AtendimentoServicoControllerBaseActionController.startAction();
    try {
      return super.changeObservacao(observacaoValue);
    } finally {
      _$_AtendimentoServicoControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeDescricaoServico(String descricaoServicoValue) {
    final _$actionInfo =
        _$_AtendimentoServicoControllerBaseActionController.startAction();
    try {
      return super.changeDescricaoServico(descricaoServicoValue);
    } finally {
      _$_AtendimentoServicoControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeQtdeParcelas(int qtdeParcelas) {
    final _$actionInfo =
        _$_AtendimentoServicoControllerBaseActionController.startAction();
    try {
      return super.changeQtdeParcelas(qtdeParcelas);
    } finally {
      _$_AtendimentoServicoControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'clientesEspeciais: ${clientesEspeciais.toString()},clientesComDesvio: ${clientesComDesvio.toString()},origemProdutoAtendimentoServicoId: ${origemProdutoAtendimentoServicoId.toString()},origemProdutoTela: ${origemProdutoTela.toString()},selectedDay: ${selectedDay.toString()},events: ${events.toString()},holidays: ${holidays.toString()},atendimentosServico: ${atendimentosServico.toString()},atendimentosServicoCalendar: ${atendimentosServicoCalendar.toString()},filter: ${filter.toString()},filterInfo: ${filterInfo.toString()},tagsModel: ${tagsModel.toString()},tagsToSave: ${tagsToSave.toString()},tags: ${tags.toString()},clienteEscolhidoId: ${clienteEscolhidoId.toString()},clienteEscolhidoNome: ${clienteEscolhidoNome.toString()},clienteObjetoEscolhidoId: ${clienteObjetoEscolhidoId.toString()},clienteObjetoEscolhidoNome: ${clienteObjetoEscolhidoNome.toString()},descricaoServico: ${descricaoServico.toString()},iniciarData: ${iniciarData.toString()},finalizarData: ${finalizarData.toString()},valor: ${valor.toString()},valorToSave: ${valorToSave.toString()},observacao: ${observacao.toString()},produtosEscolhidos: ${produtosEscolhidos.toString()},produtosDoServicoValorTotal: ${produtosDoServicoValorTotal.toString()},produtosDoServico: ${produtosDoServico.toString()},faturamentoDoServicoValorTotal: ${faturamentoDoServicoValorTotal.toString()},faturamentoDoServico: ${faturamentoDoServico.toString()},clienteVeiculo: ${clienteVeiculo.toString()},clientePet: ${clientePet.toString()},atendimentoServicoInfo: ${atendimentoServicoInfo.toString()},qtdeParcelas: ${qtdeParcelas.toString()},qtdeAtendimentosAtivos: ${qtdeAtendimentosAtivos.toString()},qtdeAtendimentosIniciar: ${qtdeAtendimentosIniciar.toString()},qtdeAtendimentosIniciados: ${qtdeAtendimentosIniciados.toString()},qtdeAtendimentosFinalizar: ${qtdeAtendimentosFinalizar.toString()},qtdeAtendimentosFinalizados: ${qtdeAtendimentosFinalizados.toString()},qtdeAtendimentosArquivados: ${qtdeAtendimentosArquivados.toString()},sistemaRef: ${sistemaRef.toString()},errorMessage: ${errorMessage.toString()},servicoState: ${servicoState.toString()},servicoCalendarState: ${servicoCalendarState.toString()},tagsState: ${tagsState.toString()},produtosEscolhidosState: ${produtosEscolhidosState.toString()},produtosDoServicoState: ${produtosDoServicoState.toString()},faturamentoDoServicoState: ${faturamentoDoServicoState.toString()},clienteVeiculoState: ${clienteVeiculoState.toString()},clientePetState: ${clientePetState.toString()},atendimentoServicoInfoState: ${atendimentoServicoInfoState.toString()},qtdeAtendimentosAtivosState: ${qtdeAtendimentosAtivosState.toString()},qtdeAtendimentosIniciarState: ${qtdeAtendimentosIniciarState.toString()},qtdeAtendimentosIniciadosState: ${qtdeAtendimentosIniciadosState.toString()},qtdeAtendimentosFinalizarState: ${qtdeAtendimentosFinalizarState.toString()},qtdeAtendimentosFinalizadosState: ${qtdeAtendimentosFinalizadosState.toString()},qtdeAtendimentosArquivadosState: ${qtdeAtendimentosArquivadosState.toString()},listFiltered: ${listFiltered.toString()},listFilteredInfo: ${listFilteredInfo.toString()}';
    return '{$string}';
  }
}
