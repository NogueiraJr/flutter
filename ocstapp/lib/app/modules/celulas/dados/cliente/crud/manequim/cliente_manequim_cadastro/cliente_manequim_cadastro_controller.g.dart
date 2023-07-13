// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cliente_manequim_cadastro_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClienteManequimCadastroController
    on _ClienteManequimCadastroControllerBase, Store {
  Computed<StoreState> _$stateComputed;

  @override
  StoreState get state =>
      (_$stateComputed ??= Computed<StoreState>(() => super.state)).value;

  final _$idAtom = Atom(name: '_ClienteManequimCadastroControllerBase.id');

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

  final _$clienteIdAtom =
      Atom(name: '_ClienteManequimCadastroControllerBase.clienteId');

  @override
  int get clienteId {
    _$clienteIdAtom.context.enforceReadPolicy(_$clienteIdAtom);
    _$clienteIdAtom.reportObserved();
    return super.clienteId;
  }

  @override
  set clienteId(int value) {
    _$clienteIdAtom.context.conditionallyRunInAction(() {
      super.clienteId = value;
      _$clienteIdAtom.reportChanged();
    }, _$clienteIdAtom, name: '${_$clienteIdAtom.name}_set');
  }

  final _$bustoAtom =
      Atom(name: '_ClienteManequimCadastroControllerBase.busto');

  @override
  String get busto {
    _$bustoAtom.context.enforceReadPolicy(_$bustoAtom);
    _$bustoAtom.reportObserved();
    return super.busto;
  }

  @override
  set busto(String value) {
    _$bustoAtom.context.conditionallyRunInAction(() {
      super.busto = value;
      _$bustoAtom.reportChanged();
    }, _$bustoAtom, name: '${_$bustoAtom.name}_set');
  }

  final _$cinturaAtom =
      Atom(name: '_ClienteManequimCadastroControllerBase.cintura');

  @override
  String get cintura {
    _$cinturaAtom.context.enforceReadPolicy(_$cinturaAtom);
    _$cinturaAtom.reportObserved();
    return super.cintura;
  }

  @override
  set cintura(String value) {
    _$cinturaAtom.context.conditionallyRunInAction(() {
      super.cintura = value;
      _$cinturaAtom.reportChanged();
    }, _$cinturaAtom, name: '${_$cinturaAtom.name}_set');
  }

  final _$quadrilAtom =
      Atom(name: '_ClienteManequimCadastroControllerBase.quadril');

  @override
  String get quadril {
    _$quadrilAtom.context.enforceReadPolicy(_$quadrilAtom);
    _$quadrilAtom.reportObserved();
    return super.quadril;
  }

  @override
  set quadril(String value) {
    _$quadrilAtom.context.conditionallyRunInAction(() {
      super.quadril = value;
      _$quadrilAtom.reportChanged();
    }, _$quadrilAtom, name: '${_$quadrilAtom.name}_set');
  }

  final _$observacaoAtom =
      Atom(name: '_ClienteManequimCadastroControllerBase.observacao');

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

  final _$errorMessageAtom =
      Atom(name: '_ClienteManequimCadastroControllerBase.errorMessage');

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
      Atom(name: '_ClienteManequimCadastroControllerBase._cadFuture');

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

  final _$_ClienteManequimCadastroControllerBaseActionController =
      ActionController(name: '_ClienteManequimCadastroControllerBase');

  @override
  dynamic changeBusto(String bustoValue) {
    final _$actionInfo =
        _$_ClienteManequimCadastroControllerBaseActionController.startAction();
    try {
      return super.changeBusto(bustoValue);
    } finally {
      _$_ClienteManequimCadastroControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCintura(String cinturaValue) {
    final _$actionInfo =
        _$_ClienteManequimCadastroControllerBaseActionController.startAction();
    try {
      return super.changeCintura(cinturaValue);
    } finally {
      _$_ClienteManequimCadastroControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeQuadril(String quadrilValue) {
    final _$actionInfo =
        _$_ClienteManequimCadastroControllerBaseActionController.startAction();
    try {
      return super.changeQuadril(quadrilValue);
    } finally {
      _$_ClienteManequimCadastroControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeObservacao(String observacaoValue) {
    final _$actionInfo =
        _$_ClienteManequimCadastroControllerBaseActionController.startAction();
    try {
      return super.changeObservacao(observacaoValue);
    } finally {
      _$_ClienteManequimCadastroControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'id: ${id.toString()},clienteId: ${clienteId.toString()},busto: ${busto.toString()},cintura: ${cintura.toString()},quadril: ${quadril.toString()},observacao: ${observacao.toString()},errorMessage: ${errorMessage.toString()},state: ${state.toString()}';
    return '{$string}';
  }
}
