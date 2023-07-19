// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cliente_manequim_editar_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClienteManequimEditarController
    on _ClienteManequimEditarControllerBase, Store {
  Computed<StoreState> _$stateComputed;

  @override
  StoreState get state =>
      (_$stateComputed ??= Computed<StoreState>(() => super.state)).value;

  final _$idAtom = Atom(name: '_ClienteManequimEditarControllerBase.id');

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
      Atom(name: '_ClienteManequimEditarControllerBase.clienteId');

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

  final _$bustoAtom = Atom(name: '_ClienteManequimEditarControllerBase.busto');

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
      Atom(name: '_ClienteManequimEditarControllerBase.cintura');

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
      Atom(name: '_ClienteManequimEditarControllerBase.quadril');

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
      Atom(name: '_ClienteManequimEditarControllerBase.observacao');

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
      Atom(name: '_ClienteManequimEditarControllerBase.errorMessage');

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
      Atom(name: '_ClienteManequimEditarControllerBase._editarFuture');

  @override
  ObservableFuture<bool> get _editarFuture {
    _$_editarFutureAtom.context.enforceReadPolicy(_$_editarFutureAtom);
    _$_editarFutureAtom.reportObserved();
    return super._editarFuture;
  }

  @override
  set _editarFuture(ObservableFuture<bool> value) {
    _$_editarFutureAtom.context.conditionallyRunInAction(() {
      super._editarFuture = value;
      _$_editarFutureAtom.reportChanged();
    }, _$_editarFutureAtom, name: '${_$_editarFutureAtom.name}_set');
  }

  final _$_ClienteManequimEditarControllerBaseActionController =
      ActionController(name: '_ClienteManequimEditarControllerBase');

  @override
  dynamic changeBusto(String bustoValue) {
    final _$actionInfo =
        _$_ClienteManequimEditarControllerBaseActionController.startAction();
    try {
      return super.changeBusto(bustoValue);
    } finally {
      _$_ClienteManequimEditarControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCintura(String cinturaValue) {
    final _$actionInfo =
        _$_ClienteManequimEditarControllerBaseActionController.startAction();
    try {
      return super.changeCintura(cinturaValue);
    } finally {
      _$_ClienteManequimEditarControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeQuadril(String quadrilValue) {
    final _$actionInfo =
        _$_ClienteManequimEditarControllerBaseActionController.startAction();
    try {
      return super.changeQuadril(quadrilValue);
    } finally {
      _$_ClienteManequimEditarControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeObservacao(String observacaoValue) {
    final _$actionInfo =
        _$_ClienteManequimEditarControllerBaseActionController.startAction();
    try {
      return super.changeObservacao(observacaoValue);
    } finally {
      _$_ClienteManequimEditarControllerBaseActionController
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
