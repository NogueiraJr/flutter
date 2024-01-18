// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TagController on _TagControllerBase, Store {
  Computed<StoreState> _$tagsStateComputed;

  @override
  StoreState get tagsState =>
      (_$tagsStateComputed ??= Computed<StoreState>(() => super.tagsState))
          .value;
  Computed<List<TagModel>> _$listFilteredComputed;

  @override
  List<TagModel> get listFiltered => (_$listFilteredComputed ??=
          Computed<List<TagModel>>(() => super.listFiltered))
      .value;

  final _$_tagsFutureAtom = Atom(name: '_TagControllerBase._tagsFuture');

  @override
  ObservableFuture<List<TagModel>> get _tagsFuture {
    _$_tagsFutureAtom.context.enforceReadPolicy(_$_tagsFutureAtom);
    _$_tagsFutureAtom.reportObserved();
    return super._tagsFuture;
  }

  @override
  set _tagsFuture(ObservableFuture<List<TagModel>> value) {
    _$_tagsFutureAtom.context.conditionallyRunInAction(() {
      super._tagsFuture = value;
      _$_tagsFutureAtom.reportChanged();
    }, _$_tagsFutureAtom, name: '${_$_tagsFutureAtom.name}_set');
  }

  final _$tagsAtom = Atom(name: '_TagControllerBase.tags');

  @override
  ObservableList<TagModel> get tags {
    _$tagsAtom.context.enforceReadPolicy(_$tagsAtom);
    _$tagsAtom.reportObserved();
    return super.tags;
  }

  @override
  set tags(ObservableList<TagModel> value) {
    _$tagsAtom.context.conditionallyRunInAction(() {
      super.tags = value;
      _$tagsAtom.reportChanged();
    }, _$tagsAtom, name: '${_$tagsAtom.name}_set');
  }

  final _$filterAtom = Atom(name: '_TagControllerBase.filter');

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

  final _$sistemaRefAtom = Atom(name: '_TagControllerBase.sistemaRef');

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

  final _$errorMessageAtom = Atom(name: '_TagControllerBase.errorMessage');

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

  final _$obterPrimeirosTagsParaTelaAsyncAction =
      AsyncAction('obterPrimeirosTagsParaTela');

  @override
  Future<void> obterPrimeirosTagsParaTela() {
    return _$obterPrimeirosTagsParaTelaAsyncAction
        .run(() => super.obterPrimeirosTagsParaTela());
  }

  final _$obterSistemaUsuarioLogadoAsyncAction =
      AsyncAction('obterSistemaUsuarioLogado');

  @override
  Future<void> obterSistemaUsuarioLogado() {
    return _$obterSistemaUsuarioLogadoAsyncAction
        .run(() => super.obterSistemaUsuarioLogado());
  }

  final _$_TagControllerBaseActionController =
      ActionController(name: '_TagControllerBase');

  @override
  dynamic setFilter(String value) {
    final _$actionInfo = _$_TagControllerBaseActionController.startAction();
    try {
      return super.setFilter(value);
    } finally {
      _$_TagControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'tags: ${tags.toString()},filter: ${filter.toString()},sistemaRef: ${sistemaRef.toString()},errorMessage: ${errorMessage.toString()},tagsState: ${tagsState.toString()},listFiltered: ${listFiltered.toString()}';
    return '{$string}';
  }
}
