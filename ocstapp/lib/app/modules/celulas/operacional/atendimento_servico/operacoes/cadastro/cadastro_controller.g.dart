// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AtendimentoServicoCadastroController
    on _AtendimentoServicoCadastroControllerBase, Store {
  Computed<StoreState> _$stateSistemaRefComputed;

  @override
  StoreState get stateSistemaRef => (_$stateSistemaRefComputed ??=
          Computed<StoreState>(() => super.stateSistemaRef))
      .value;
  Computed<StoreState> _$stateComputed;

  @override
  StoreState get state =>
      (_$stateComputed ??= Computed<StoreState>(() => super.state)).value;

  final _$imageAtendimentoAtom =
      Atom(name: '_AtendimentoServicoCadastroControllerBase.imageAtendimento');

  @override
  Image get imageAtendimento {
    _$imageAtendimentoAtom.context.enforceReadPolicy(_$imageAtendimentoAtom);
    _$imageAtendimentoAtom.reportObserved();
    return super.imageAtendimento;
  }

  @override
  set imageAtendimento(Image value) {
    _$imageAtendimentoAtom.context.conditionallyRunInAction(() {
      super.imageAtendimento = value;
      _$imageAtendimentoAtom.reportChanged();
    }, _$imageAtendimentoAtom, name: '${_$imageAtendimentoAtom.name}_set');
  }

  final _$_sistemaRefAtom =
      Atom(name: '_AtendimentoServicoCadastroControllerBase._sistemaRef');

  @override
  ObservableFuture<dynamic> get _sistemaRef {
    _$_sistemaRefAtom.context.enforceReadPolicy(_$_sistemaRefAtom);
    _$_sistemaRefAtom.reportObserved();
    return super._sistemaRef;
  }

  @override
  set _sistemaRef(ObservableFuture<dynamic> value) {
    _$_sistemaRefAtom.context.conditionallyRunInAction(() {
      super._sistemaRef = value;
      _$_sistemaRefAtom.reportChanged();
    }, _$_sistemaRefAtom, name: '${_$_sistemaRefAtom.name}_set');
  }

  final _$errorMessageAtom =
      Atom(name: '_AtendimentoServicoCadastroControllerBase.errorMessage');

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

  final _$_cadastrarFutureAtom =
      Atom(name: '_AtendimentoServicoCadastroControllerBase._cadastrarFuture');

  @override
  ObservableFuture<dynamic> get _cadastrarFuture {
    _$_cadastrarFutureAtom.context.enforceReadPolicy(_$_cadastrarFutureAtom);
    _$_cadastrarFutureAtom.reportObserved();
    return super._cadastrarFuture;
  }

  @override
  set _cadastrarFuture(ObservableFuture<dynamic> value) {
    _$_cadastrarFutureAtom.context.conditionallyRunInAction(() {
      super._cadastrarFuture = value;
      _$_cadastrarFutureAtom.reportChanged();
    }, _$_cadastrarFutureAtom, name: '${_$_cadastrarFutureAtom.name}_set');
  }

  @override
  String toString() {
    final string =
        'imageAtendimento: ${imageAtendimento.toString()},errorMessage: ${errorMessage.toString()},stateSistemaRef: ${stateSistemaRef.toString()},state: ${state.toString()}';
    return '{$string}';
  }
}
