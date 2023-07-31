// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cliente_pet_editar_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClientePetEditarController on _ClientePetEditarControllerBase, Store {
  Computed<StoreState> _$stateComputed;

  @override
  StoreState get state =>
      (_$stateComputed ??= Computed<StoreState>(() => super.state)).value;

  final _$idAtom = Atom(name: '_ClientePetEditarControllerBase.id');

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
      Atom(name: '_ClientePetEditarControllerBase.clienteId');

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

  final _$nomeAtom = Atom(name: '_ClientePetEditarControllerBase.nome');

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

  final _$racaAtom = Atom(name: '_ClientePetEditarControllerBase.raca');

  @override
  String get raca {
    _$racaAtom.context.enforceReadPolicy(_$racaAtom);
    _$racaAtom.reportObserved();
    return super.raca;
  }

  @override
  set raca(String value) {
    _$racaAtom.context.conditionallyRunInAction(() {
      super.raca = value;
      _$racaAtom.reportChanged();
    }, _$racaAtom, name: '${_$racaAtom.name}_set');
  }

  final _$anoNascimentoAtom =
      Atom(name: '_ClientePetEditarControllerBase.anoNascimento');

  @override
  String get anoNascimento {
    _$anoNascimentoAtom.context.enforceReadPolicy(_$anoNascimentoAtom);
    _$anoNascimentoAtom.reportObserved();
    return super.anoNascimento;
  }

  @override
  set anoNascimento(String value) {
    _$anoNascimentoAtom.context.conditionallyRunInAction(() {
      super.anoNascimento = value;
      _$anoNascimentoAtom.reportChanged();
    }, _$anoNascimentoAtom, name: '${_$anoNascimentoAtom.name}_set');
  }

  final _$mesNascimentoAtom =
      Atom(name: '_ClientePetEditarControllerBase.mesNascimento');

  @override
  String get mesNascimento {
    _$mesNascimentoAtom.context.enforceReadPolicy(_$mesNascimentoAtom);
    _$mesNascimentoAtom.reportObserved();
    return super.mesNascimento;
  }

  @override
  set mesNascimento(String value) {
    _$mesNascimentoAtom.context.conditionallyRunInAction(() {
      super.mesNascimento = value;
      _$mesNascimentoAtom.reportChanged();
    }, _$mesNascimentoAtom, name: '${_$mesNascimentoAtom.name}_set');
  }

  final _$corAtom = Atom(name: '_ClientePetEditarControllerBase.cor');

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

  final _$observacaoAtom =
      Atom(name: '_ClientePetEditarControllerBase.observacao');

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
      Atom(name: '_ClientePetEditarControllerBase.errorMessage');

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
      Atom(name: '_ClientePetEditarControllerBase._editarFuture');

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

  final _$_ClientePetEditarControllerBaseActionController =
      ActionController(name: '_ClientePetEditarControllerBase');

  @override
  dynamic changeNome(String nomeValue) {
    final _$actionInfo =
        _$_ClientePetEditarControllerBaseActionController.startAction();
    try {
      return super.changeNome(nomeValue);
    } finally {
      _$_ClientePetEditarControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeRaca(String racaValue) {
    final _$actionInfo =
        _$_ClientePetEditarControllerBaseActionController.startAction();
    try {
      return super.changeRaca(racaValue);
    } finally {
      _$_ClientePetEditarControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeAnoNascimento(String anoNascimentoValue) {
    final _$actionInfo =
        _$_ClientePetEditarControllerBaseActionController.startAction();
    try {
      return super.changeAnoNascimento(anoNascimentoValue);
    } finally {
      _$_ClientePetEditarControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeMesNascimento(String mesNascimentoValue) {
    final _$actionInfo =
        _$_ClientePetEditarControllerBaseActionController.startAction();
    try {
      return super.changeMesNascimento(mesNascimentoValue);
    } finally {
      _$_ClientePetEditarControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCor(String corValue) {
    final _$actionInfo =
        _$_ClientePetEditarControllerBaseActionController.startAction();
    try {
      return super.changeCor(corValue);
    } finally {
      _$_ClientePetEditarControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeObservacao(String observacaoValue) {
    final _$actionInfo =
        _$_ClientePetEditarControllerBaseActionController.startAction();
    try {
      return super.changeObservacao(observacaoValue);
    } finally {
      _$_ClientePetEditarControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'id: ${id.toString()},clienteId: ${clienteId.toString()},nome: ${nome.toString()},raca: ${raca.toString()},anoNascimento: ${anoNascimento.toString()},mesNascimento: ${mesNascimento.toString()},cor: ${cor.toString()},observacao: ${observacao.toString()},errorMessage: ${errorMessage.toString()},state: ${state.toString()}';
    return '{$string}';
  }
}
