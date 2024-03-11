// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AtendimentoServicoInfoCadastroController
    on _AtendimentoServicoInfoCadastroControllerBase, Store {
  Computed<StoreState> _$tagsStateComputed;

  @override
  StoreState get tagsState =>
      (_$tagsStateComputed ??= Computed<StoreState>(() => super.tagsState))
          .value;
  Computed<StoreState> _$stateComputed;

  @override
  StoreState get state =>
      (_$stateComputed ??= Computed<StoreState>(() => super.state)).value;

  final _$idAtom =
      Atom(name: '_AtendimentoServicoInfoCadastroControllerBase.id');

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

  final _$atendimentoServicoIdAtom = Atom(
      name:
          '_AtendimentoServicoInfoCadastroControllerBase.atendimentoServicoId');

  @override
  int get atendimentoServicoId {
    _$atendimentoServicoIdAtom.context
        .enforceReadPolicy(_$atendimentoServicoIdAtom);
    _$atendimentoServicoIdAtom.reportObserved();
    return super.atendimentoServicoId;
  }

  @override
  set atendimentoServicoId(int value) {
    _$atendimentoServicoIdAtom.context.conditionallyRunInAction(() {
      super.atendimentoServicoId = value;
      _$atendimentoServicoIdAtom.reportChanged();
    }, _$atendimentoServicoIdAtom,
        name: '${_$atendimentoServicoIdAtom.name}_set');
  }

  final _$descricaoAtom =
      Atom(name: '_AtendimentoServicoInfoCadastroControllerBase.descricao');

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

  final _$tagsAtom =
      Atom(name: '_AtendimentoServicoInfoCadastroControllerBase.tags');

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

  final _$observacaoAtom =
      Atom(name: '_AtendimentoServicoInfoCadastroControllerBase.observacao');

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

  final _$_tagsFutureAtom =
      Atom(name: '_AtendimentoServicoInfoCadastroControllerBase._tagsFuture');

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
      Atom(name: '_AtendimentoServicoInfoCadastroControllerBase.tagsModel');

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
      Atom(name: '_AtendimentoServicoInfoCadastroControllerBase.tagsToSave');

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

  final _$errorMessageAtom =
      Atom(name: '_AtendimentoServicoInfoCadastroControllerBase.errorMessage');

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

  final _$_cadFutureAtom =
      Atom(name: '_AtendimentoServicoInfoCadastroControllerBase._cadFuture');

  @override
  ObservableFuture<bool> get _cadFuture {
    _$_cadFutureAtom.context.enforceReadPolicy(_$_cadFutureAtom);
    _$_cadFutureAtom.reportObserved();
    return super._cadFuture;
  }

  @override
  set _cadFuture(ObservableFuture<bool> value) {
    _$_cadFutureAtom.context.conditionallyRunInAction(() {
      super._cadFuture = value;
      _$_cadFutureAtom.reportChanged();
    }, _$_cadFutureAtom, name: '${_$_cadFutureAtom.name}_set');
  }

  final _$obterTagsAsyncAction = AsyncAction('obterTags');

  @override
  Future<void> obterTags() {
    return _$obterTagsAsyncAction.run(() => super.obterTags());
  }

  final _$_AtendimentoServicoInfoCadastroControllerBaseActionController =
      ActionController(name: '_AtendimentoServicoInfoCadastroControllerBase');

  @override
  dynamic changeDescricao(String descricaoValue) {
    final _$actionInfo =
        _$_AtendimentoServicoInfoCadastroControllerBaseActionController
            .startAction();
    try {
      return super.changeDescricao(descricaoValue);
    } finally {
      _$_AtendimentoServicoInfoCadastroControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeTags(String tagsValue) {
    final _$actionInfo =
        _$_AtendimentoServicoInfoCadastroControllerBaseActionController
            .startAction();
    try {
      return super.changeTags(tagsValue);
    } finally {
      _$_AtendimentoServicoInfoCadastroControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeObservacao(String observacaoValue) {
    final _$actionInfo =
        _$_AtendimentoServicoInfoCadastroControllerBaseActionController
            .startAction();
    try {
      return super.changeObservacao(observacaoValue);
    } finally {
      _$_AtendimentoServicoInfoCadastroControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'id: ${id.toString()},atendimentoServicoId: ${atendimentoServicoId.toString()},descricao: ${descricao.toString()},tags: ${tags.toString()},observacao: ${observacao.toString()},tagsModel: ${tagsModel.toString()},tagsToSave: ${tagsToSave.toString()},errorMessage: ${errorMessage.toString()},tagsState: ${tagsState.toString()},state: ${state.toString()}';
    return '{$string}';
  }
}
