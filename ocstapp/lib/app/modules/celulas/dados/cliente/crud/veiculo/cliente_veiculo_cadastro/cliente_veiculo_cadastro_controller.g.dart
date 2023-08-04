// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cliente_veiculo_cadastro_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClienteVeiculoCadastroController
    on _ClienteVeiculoCadastroControllerBase, Store {
  Computed<StoreState> _$stateComputed;

  @override
  StoreState get state =>
      (_$stateComputed ??= Computed<StoreState>(() => super.state)).value;

  final _$idAtom = Atom(name: '_ClienteVeiculoCadastroControllerBase.id');

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
      Atom(name: '_ClienteVeiculoCadastroControllerBase.clienteId');

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

  final _$marcaAtom = Atom(name: '_ClienteVeiculoCadastroControllerBase.marca');

  @override
  String get marca {
    _$marcaAtom.context.enforceReadPolicy(_$marcaAtom);
    _$marcaAtom.reportObserved();
    return super.marca;
  }

  @override
  set marca(String value) {
    _$marcaAtom.context.conditionallyRunInAction(() {
      super.marca = value;
      _$marcaAtom.reportChanged();
    }, _$marcaAtom, name: '${_$marcaAtom.name}_set');
  }

  final _$modeloAtom =
      Atom(name: '_ClienteVeiculoCadastroControllerBase.modelo');

  @override
  String get modelo {
    _$modeloAtom.context.enforceReadPolicy(_$modeloAtom);
    _$modeloAtom.reportObserved();
    return super.modelo;
  }

  @override
  set modelo(String value) {
    _$modeloAtom.context.conditionallyRunInAction(() {
      super.modelo = value;
      _$modeloAtom.reportChanged();
    }, _$modeloAtom, name: '${_$modeloAtom.name}_set');
  }

  final _$anoAtom = Atom(name: '_ClienteVeiculoCadastroControllerBase.ano');

  @override
  String get ano {
    _$anoAtom.context.enforceReadPolicy(_$anoAtom);
    _$anoAtom.reportObserved();
    return super.ano;
  }

  @override
  set ano(String value) {
    _$anoAtom.context.conditionallyRunInAction(() {
      super.ano = value;
      _$anoAtom.reportChanged();
    }, _$anoAtom, name: '${_$anoAtom.name}_set');
  }

  final _$corAtom = Atom(name: '_ClienteVeiculoCadastroControllerBase.cor');

  @override
  String get cor {
    _$corAtom.context.enforceReadPolicy(_$corAtom);
    _$corAtom.reportObserved();
    return super.cor;
  }

  @override
  set cor(String value) {
    _$corAtom.context.conditionallyRunInAction(() {
      super.cor = value;
      _$corAtom.reportChanged();
    }, _$corAtom, name: '${_$corAtom.name}_set');
  }

  final _$placaAtom = Atom(name: '_ClienteVeiculoCadastroControllerBase.placa');

  @override
  String get placa {
    _$placaAtom.context.enforceReadPolicy(_$placaAtom);
    _$placaAtom.reportObserved();
    return super.placa;
  }

  @override
  set placa(String value) {
    _$placaAtom.context.conditionallyRunInAction(() {
      super.placa = value;
      _$placaAtom.reportChanged();
    }, _$placaAtom, name: '${_$placaAtom.name}_set');
  }

  final _$observacaoAtom =
      Atom(name: '_ClienteVeiculoCadastroControllerBase.observacao');

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
      Atom(name: '_ClienteVeiculoCadastroControllerBase.errorMessage');

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
      Atom(name: '_ClienteVeiculoCadastroControllerBase._cadFuture');

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

  final _$_ClienteVeiculoCadastroControllerBaseActionController =
      ActionController(name: '_ClienteVeiculoCadastroControllerBase');

  @override
  dynamic changeMarca(String marcaValue) {
    final _$actionInfo =
        _$_ClienteVeiculoCadastroControllerBaseActionController.startAction();
    try {
      return super.changeMarca(marcaValue);
    } finally {
      _$_ClienteVeiculoCadastroControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeModelo(String modeloValue) {
    final _$actionInfo =
        _$_ClienteVeiculoCadastroControllerBaseActionController.startAction();
    try {
      return super.changeModelo(modeloValue);
    } finally {
      _$_ClienteVeiculoCadastroControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeAno(String anoValue) {
    final _$actionInfo =
        _$_ClienteVeiculoCadastroControllerBaseActionController.startAction();
    try {
      return super.changeAno(anoValue);
    } finally {
      _$_ClienteVeiculoCadastroControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCor(String corValue) {
    final _$actionInfo =
        _$_ClienteVeiculoCadastroControllerBaseActionController.startAction();
    try {
      return super.changeCor(corValue);
    } finally {
      _$_ClienteVeiculoCadastroControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePlaca(String placaValue) {
    final _$actionInfo =
        _$_ClienteVeiculoCadastroControllerBaseActionController.startAction();
    try {
      return super.changePlaca(placaValue);
    } finally {
      _$_ClienteVeiculoCadastroControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeObservacao(String observacaoValue) {
    final _$actionInfo =
        _$_ClienteVeiculoCadastroControllerBaseActionController.startAction();
    try {
      return super.changeObservacao(observacaoValue);
    } finally {
      _$_ClienteVeiculoCadastroControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'id: ${id.toString()},clienteId: ${clienteId.toString()},marca: ${marca.toString()},modelo: ${modelo.toString()},ano: ${ano.toString()},cor: ${cor.toString()},placa: ${placa.toString()},observacao: ${observacao.toString()},errorMessage: ${errorMessage.toString()},state: ${state.toString()}';
    return '{$string}';
  }
}
