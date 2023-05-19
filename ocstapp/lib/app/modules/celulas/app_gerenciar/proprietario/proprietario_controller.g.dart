// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proprietario_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProprietarioController on _ProprietarioControllerBase, Store {
  Computed<StoreState> _$stateComputed;

  @override
  StoreState get state =>
      (_$stateComputed ??= Computed<StoreState>(() => super.state)).value;
  Computed<StoreState> _$menusStateComputed;

  @override
  StoreState get menusState =>
      (_$menusStateComputed ??= Computed<StoreState>(() => super.menusState))
          .value;
  Computed<StoreState> _$equipeStateComputed;

  @override
  StoreState get equipeState =>
      (_$equipeStateComputed ??= Computed<StoreState>(() => super.equipeState))
          .value;

  final _$usuarioAtom = Atom(name: '_ProprietarioControllerBase.usuario');

  @override
  UsuarioConsultaModel get usuario {
    _$usuarioAtom.context.enforceReadPolicy(_$usuarioAtom);
    _$usuarioAtom.reportObserved();
    return super.usuario;
  }

  @override
  set usuario(UsuarioConsultaModel value) {
    _$usuarioAtom.context.conditionallyRunInAction(() {
      super.usuario = value;
      _$usuarioAtom.reportChanged();
    }, _$usuarioAtom, name: '${_$usuarioAtom.name}_set');
  }

  final _$_usuarioFutureAtom =
      Atom(name: '_ProprietarioControllerBase._usuarioFuture');

  @override
  ObservableFuture<UsuarioConsultaModel> get _usuarioFuture {
    _$_usuarioFutureAtom.context.enforceReadPolicy(_$_usuarioFutureAtom);
    _$_usuarioFutureAtom.reportObserved();
    return super._usuarioFuture;
  }

  @override
  set _usuarioFuture(ObservableFuture<UsuarioConsultaModel> value) {
    _$_usuarioFutureAtom.context.conditionallyRunInAction(() {
      super._usuarioFuture = value;
      _$_usuarioFutureAtom.reportChanged();
    }, _$_usuarioFutureAtom, name: '${_$_usuarioFutureAtom.name}_set');
  }

  final _$_acessosUsuarioFutureAtom =
      Atom(name: '_ProprietarioControllerBase._acessosUsuarioFuture');

  @override
  ObservableFuture<List<MenuModel>> get _acessosUsuarioFuture {
    _$_acessosUsuarioFutureAtom.context
        .enforceReadPolicy(_$_acessosUsuarioFutureAtom);
    _$_acessosUsuarioFutureAtom.reportObserved();
    return super._acessosUsuarioFuture;
  }

  @override
  set _acessosUsuarioFuture(ObservableFuture<List<MenuModel>> value) {
    _$_acessosUsuarioFutureAtom.context.conditionallyRunInAction(() {
      super._acessosUsuarioFuture = value;
      _$_acessosUsuarioFutureAtom.reportChanged();
    }, _$_acessosUsuarioFutureAtom,
        name: '${_$_acessosUsuarioFutureAtom.name}_set');
  }

  final _$acessosAtom = Atom(name: '_ProprietarioControllerBase.acessos');

  @override
  ObservableList<MenuModel> get acessos {
    _$acessosAtom.context.enforceReadPolicy(_$acessosAtom);
    _$acessosAtom.reportObserved();
    return super.acessos;
  }

  @override
  set acessos(ObservableList<MenuModel> value) {
    _$acessosAtom.context.conditionallyRunInAction(() {
      super.acessos = value;
      _$acessosAtom.reportChanged();
    }, _$acessosAtom, name: '${_$acessosAtom.name}_set');
  }

  final _$_usuariosEquipeFutureAtom =
      Atom(name: '_ProprietarioControllerBase._usuariosEquipeFuture');

  @override
  ObservableFuture<List<UsuarioConsultaModel>> get _usuariosEquipeFuture {
    _$_usuariosEquipeFutureAtom.context
        .enforceReadPolicy(_$_usuariosEquipeFutureAtom);
    _$_usuariosEquipeFutureAtom.reportObserved();
    return super._usuariosEquipeFuture;
  }

  @override
  set _usuariosEquipeFuture(
      ObservableFuture<List<UsuarioConsultaModel>> value) {
    _$_usuariosEquipeFutureAtom.context.conditionallyRunInAction(() {
      super._usuariosEquipeFuture = value;
      _$_usuariosEquipeFutureAtom.reportChanged();
    }, _$_usuariosEquipeFutureAtom,
        name: '${_$_usuariosEquipeFutureAtom.name}_set');
  }

  final _$usuariosEquipeAtom =
      Atom(name: '_ProprietarioControllerBase.usuariosEquipe');

  @override
  ObservableList<UsuarioConsultaModel> get usuariosEquipe {
    _$usuariosEquipeAtom.context.enforceReadPolicy(_$usuariosEquipeAtom);
    _$usuariosEquipeAtom.reportObserved();
    return super.usuariosEquipe;
  }

  @override
  set usuariosEquipe(ObservableList<UsuarioConsultaModel> value) {
    _$usuariosEquipeAtom.context.conditionallyRunInAction(() {
      super.usuariosEquipe = value;
      _$usuariosEquipeAtom.reportChanged();
    }, _$usuariosEquipeAtom, name: '${_$usuariosEquipeAtom.name}_set');
  }

  final _$errorMessageAtom =
      Atom(name: '_ProprietarioControllerBase.errorMessage');

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

  final _$obterUsuarioAsyncAction = AsyncAction('obterUsuario');

  @override
  Future<void> obterUsuario() {
    return _$obterUsuarioAsyncAction.run(() => super.obterUsuario());
  }

  final _$obterAcessosUsuarioAsyncAction = AsyncAction('obterAcessosUsuario');

  @override
  Future<void> obterAcessosUsuario() {
    return _$obterAcessosUsuarioAsyncAction
        .run(() => super.obterAcessosUsuario());
  }

  final _$obterEquipeUsuarioAsyncAction = AsyncAction('obterEquipeUsuario');

  @override
  Future<void> obterEquipeUsuario() {
    return _$obterEquipeUsuarioAsyncAction
        .run(() => super.obterEquipeUsuario());
  }

  @override
  String toString() {
    final string =
        'usuario: ${usuario.toString()},acessos: ${acessos.toString()},usuariosEquipe: ${usuariosEquipe.toString()},errorMessage: ${errorMessage.toString()},state: ${state.toString()},menusState: ${menusState.toString()},equipeState: ${equipeState.toString()}';
    return '{$string}';
  }
}
