// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'colaborador_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ColaboradorController on _ColaboradorControllerBase, Store {
  Computed<StoreState> _$menusStateComputed;

  @override
  StoreState get menusState =>
      (_$menusStateComputed ??= Computed<StoreState>(() => super.menusState))
          .value;

  final _$loginAtom = Atom(name: '_ColaboradorControllerBase.login');

  @override
  String get login {
    _$loginAtom.context.enforceReadPolicy(_$loginAtom);
    _$loginAtom.reportObserved();
    return super.login;
  }

  @override
  set login(String value) {
    _$loginAtom.context.conditionallyRunInAction(() {
      super.login = value;
      _$loginAtom.reportChanged();
    }, _$loginAtom, name: '${_$loginAtom.name}_set');
  }

  final _$candidatoLiderAtom =
      Atom(name: '_ColaboradorControllerBase.candidatoLider');

  @override
  UsuarioConsultaModel get candidatoLider {
    _$candidatoLiderAtom.context.enforceReadPolicy(_$candidatoLiderAtom);
    _$candidatoLiderAtom.reportObserved();
    return super.candidatoLider;
  }

  @override
  set candidatoLider(UsuarioConsultaModel value) {
    _$candidatoLiderAtom.context.conditionallyRunInAction(() {
      super.candidatoLider = value;
      _$candidatoLiderAtom.reportChanged();
    }, _$candidatoLiderAtom, name: '${_$candidatoLiderAtom.name}_set');
  }

  final _$errorMessageAtom =
      Atom(name: '_ColaboradorControllerBase.errorMessage');

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

  final _$_usuariosFutureAtom =
      Atom(name: '_ColaboradorControllerBase._usuariosFuture');

  @override
  ObservableFuture<List<UsuarioConsultaModel>> get _usuariosFuture {
    _$_usuariosFutureAtom.context.enforceReadPolicy(_$_usuariosFutureAtom);
    _$_usuariosFutureAtom.reportObserved();
    return super._usuariosFuture;
  }

  @override
  set _usuariosFuture(ObservableFuture<List<UsuarioConsultaModel>> value) {
    _$_usuariosFutureAtom.context.conditionallyRunInAction(() {
      super._usuariosFuture = value;
      _$_usuariosFutureAtom.reportChanged();
    }, _$_usuariosFutureAtom, name: '${_$_usuariosFutureAtom.name}_set');
  }

  final _$_usuariosLideradosFutureAtom =
      Atom(name: '_ColaboradorControllerBase._usuariosLideradosFuture');

  @override
  ObservableFuture<List<UsuarioConsultaModel>> get _usuariosLideradosFuture {
    _$_usuariosLideradosFutureAtom.context
        .enforceReadPolicy(_$_usuariosLideradosFutureAtom);
    _$_usuariosLideradosFutureAtom.reportObserved();
    return super._usuariosLideradosFuture;
  }

  @override
  set _usuariosLideradosFuture(
      ObservableFuture<List<UsuarioConsultaModel>> value) {
    _$_usuariosLideradosFutureAtom.context.conditionallyRunInAction(() {
      super._usuariosLideradosFuture = value;
      _$_usuariosLideradosFutureAtom.reportChanged();
    }, _$_usuariosLideradosFutureAtom,
        name: '${_$_usuariosLideradosFutureAtom.name}_set');
  }

  final _$_colaboradorAnteriorAtom =
      Atom(name: '_ColaboradorControllerBase._colaboradorAnterior');

  @override
  ObservableFuture<UsuarioConsultaModel> get _colaboradorAnterior {
    _$_colaboradorAnteriorAtom.context
        .enforceReadPolicy(_$_colaboradorAnteriorAtom);
    _$_colaboradorAnteriorAtom.reportObserved();
    return super._colaboradorAnterior;
  }

  @override
  set _colaboradorAnterior(ObservableFuture<UsuarioConsultaModel> value) {
    _$_colaboradorAnteriorAtom.context.conditionallyRunInAction(() {
      super._colaboradorAnterior = value;
      _$_colaboradorAnteriorAtom.reportChanged();
    }, _$_colaboradorAnteriorAtom,
        name: '${_$_colaboradorAnteriorAtom.name}_set');
  }

  final _$usuarioAnteriorAtom =
      Atom(name: '_ColaboradorControllerBase.usuarioAnterior');

  @override
  UsuarioConsultaModel get usuarioAnterior {
    _$usuarioAnteriorAtom.context.enforceReadPolicy(_$usuarioAnteriorAtom);
    _$usuarioAnteriorAtom.reportObserved();
    return super.usuarioAnterior;
  }

  @override
  set usuarioAnterior(UsuarioConsultaModel value) {
    _$usuarioAnteriorAtom.context.conditionallyRunInAction(() {
      super.usuarioAnterior = value;
      _$usuarioAnteriorAtom.reportChanged();
    }, _$usuarioAnteriorAtom, name: '${_$usuarioAnteriorAtom.name}_set');
  }

  final _$usuariosAtom = Atom(name: '_ColaboradorControllerBase.usuarios');

  @override
  ObservableList<UsuarioConsultaModel> get usuarios {
    _$usuariosAtom.context.enforceReadPolicy(_$usuariosAtom);
    _$usuariosAtom.reportObserved();
    return super.usuarios;
  }

  @override
  set usuarios(ObservableList<UsuarioConsultaModel> value) {
    _$usuariosAtom.context.conditionallyRunInAction(() {
      super.usuarios = value;
      _$usuariosAtom.reportChanged();
    }, _$usuariosAtom, name: '${_$usuariosAtom.name}_set');
  }

  final _$usuariosLideradosAtom =
      Atom(name: '_ColaboradorControllerBase.usuariosLiderados');

  @override
  ObservableList<UsuarioConsultaModel> get usuariosLiderados {
    _$usuariosLideradosAtom.context.enforceReadPolicy(_$usuariosLideradosAtom);
    _$usuariosLideradosAtom.reportObserved();
    return super.usuariosLiderados;
  }

  @override
  set usuariosLiderados(ObservableList<UsuarioConsultaModel> value) {
    _$usuariosLideradosAtom.context.conditionallyRunInAction(() {
      super.usuariosLiderados = value;
      _$usuariosLideradosAtom.reportChanged();
    }, _$usuariosLideradosAtom, name: '${_$usuariosLideradosAtom.name}_set');
  }

  final _$obterUsuarioRaizAsyncAction = AsyncAction('obterUsuarioRaiz');

  @override
  Future<void> obterUsuarioRaiz() {
    return _$obterUsuarioRaizAsyncAction.run(() => super.obterUsuarioRaiz());
  }

  final _$obterDadosUsuarioAsyncAction = AsyncAction('obterDadosUsuario');

  @override
  Future<void> obterDadosUsuario() {
    return _$obterDadosUsuarioAsyncAction.run(() => super.obterDadosUsuario());
  }

  final _$obterDadosAsyncAction = AsyncAction('obterDados');

  @override
  Future<void> obterDados() {
    return _$obterDadosAsyncAction.run(() => super.obterDados());
  }

  final _$obterDadosParaListaEquipeAsyncAction =
      AsyncAction('obterDadosParaListaEquipe');

  @override
  Future<void> obterDadosParaListaEquipe() {
    return _$obterDadosParaListaEquipeAsyncAction
        .run(() => super.obterDadosParaListaEquipe());
  }

  final _$obterLideradosAsyncAction = AsyncAction('obterLiderados');

  @override
  Future<bool> obterLiderados(int id) {
    return _$obterLideradosAsyncAction.run(() => super.obterLiderados(id));
  }

  final _$removeUltimoLoginParamAsyncAction =
      AsyncAction('removeUltimoLoginParam');

  @override
  Future<bool> removeUltimoLoginParam() {
    return _$removeUltimoLoginParamAsyncAction
        .run(() => super.removeUltimoLoginParam());
  }

  final _$defineProprietarioComoLoginParamAsyncAction =
      AsyncAction('defineProprietarioComoLoginParam');

  @override
  Future<bool> defineProprietarioComoLoginParam() {
    return _$defineProprietarioComoLoginParamAsyncAction
        .run(() => super.defineProprietarioComoLoginParam());
  }

  final _$voltarAoInicioAsyncAction = AsyncAction('voltarAoInicio');

  @override
  Future<void> voltarAoInicio() {
    return _$voltarAoInicioAsyncAction.run(() => super.voltarAoInicio());
  }

  @override
  String toString() {
    final string =
        'login: ${login.toString()},candidatoLider: ${candidatoLider.toString()},errorMessage: ${errorMessage.toString()},usuarioAnterior: ${usuarioAnterior.toString()},usuarios: ${usuarios.toString()},usuariosLiderados: ${usuariosLiderados.toString()},menusState: ${menusState.toString()}';
    return '{$string}';
  }
}
