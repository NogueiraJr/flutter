// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'editar_movimentacao_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EditarMovimentacaoController
    on _EditarMovimentacaoControllerBase, Store {
  Computed<StoreState> _$categoriasStatusComputed;

  @override
  StoreState get categoriasStatus => (_$categoriasStatusComputed ??=
          Computed<StoreState>(() => super.categoriasStatus))
      .value;
  Computed<StoreState> _$salvarMovimentacaoStatusComputed;

  @override
  StoreState get salvarMovimentacaoStatus =>
      (_$salvarMovimentacaoStatusComputed ??=
              Computed<StoreState>(() => super.salvarMovimentacaoStatus))
          .value;

  final _$dataInclusaoAtom =
      Atom(name: '_EditarMovimentacaoControllerBase.dataInclusao');

  @override
  DateTime get dataInclusao {
    _$dataInclusaoAtom.context.enforceReadPolicy(_$dataInclusaoAtom);
    _$dataInclusaoAtom.reportObserved();
    return super.dataInclusao;
  }

  @override
  set dataInclusao(DateTime value) {
    _$dataInclusaoAtom.context.conditionallyRunInAction(() {
      super.dataInclusao = value;
      _$dataInclusaoAtom.reportChanged();
    }, _$dataInclusaoAtom, name: '${_$dataInclusaoAtom.name}_set');
  }

  final _$errorMessageAtom =
      Atom(name: '_EditarMovimentacaoControllerBase.errorMessage');

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

  final _$tipoSelecionadoAtom =
      Atom(name: '_EditarMovimentacaoControllerBase.tipoSelecionado');

  @override
  String get tipoSelecionado {
    _$tipoSelecionadoAtom.context.enforceReadPolicy(_$tipoSelecionadoAtom);
    _$tipoSelecionadoAtom.reportObserved();
    return super.tipoSelecionado;
  }

  @override
  set tipoSelecionado(String value) {
    _$tipoSelecionadoAtom.context.conditionallyRunInAction(() {
      super.tipoSelecionado = value;
      _$tipoSelecionadoAtom.reportChanged();
    }, _$tipoSelecionadoAtom, name: '${_$tipoSelecionadoAtom.name}_set');
  }

  final _$categoriasAtom =
      Atom(name: '_EditarMovimentacaoControllerBase.categorias');

  @override
  List<CategoriaModel> get categorias {
    _$categoriasAtom.context.enforceReadPolicy(_$categoriasAtom);
    _$categoriasAtom.reportObserved();
    return super.categorias;
  }

  @override
  set categorias(List<CategoriaModel> value) {
    _$categoriasAtom.context.conditionallyRunInAction(() {
      super.categorias = value;
      _$categoriasAtom.reportChanged();
    }, _$categoriasAtom, name: '${_$categoriasAtom.name}_set');
  }

  final _$categoriaValidAtom =
      Atom(name: '_EditarMovimentacaoControllerBase.categoriaValid');

  @override
  bool get categoriaValid {
    _$categoriaValidAtom.context.enforceReadPolicy(_$categoriaValidAtom);
    _$categoriaValidAtom.reportObserved();
    return super.categoriaValid;
  }

  @override
  set categoriaValid(bool value) {
    _$categoriaValidAtom.context.conditionallyRunInAction(() {
      super.categoriaValid = value;
      _$categoriaValidAtom.reportChanged();
    }, _$categoriaValidAtom, name: '${_$categoriaValidAtom.name}_set');
  }

  final _$categoriaAtom =
      Atom(name: '_EditarMovimentacaoControllerBase.categoria');

  @override
  CategoriaModel get categoria {
    _$categoriaAtom.context.enforceReadPolicy(_$categoriaAtom);
    _$categoriaAtom.reportObserved();
    return super.categoria;
  }

  @override
  set categoria(CategoriaModel value) {
    _$categoriaAtom.context.conditionallyRunInAction(() {
      super.categoria = value;
      _$categoriaAtom.reportChanged();
    }, _$categoriaAtom, name: '${_$categoriaAtom.name}_set');
  }

  final _$descricaoAtom =
      Atom(name: '_EditarMovimentacaoControllerBase.descricao');

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

  final _$valorAtom = Atom(name: '_EditarMovimentacaoControllerBase.valor');

  @override
  double get valor {
    _$valorAtom.context.enforceReadPolicy(_$valorAtom);
    _$valorAtom.reportObserved();
    return super.valor;
  }

  @override
  set valor(double value) {
    _$valorAtom.context.conditionallyRunInAction(() {
      super.valor = value;
      _$valorAtom.reportChanged();
    }, _$valorAtom, name: '${_$valorAtom.name}_set');
  }

  final _$filterAtom = Atom(name: '_EditarMovimentacaoControllerBase.filter');

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
      Atom(name: '_EditarMovimentacaoControllerBase.filterInfo');

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

  final _$_categoriasFutureAtom =
      Atom(name: '_EditarMovimentacaoControllerBase._categoriasFuture');

  @override
  ObservableFuture<List<CategoriaModel>> get _categoriasFuture {
    _$_categoriasFutureAtom.context.enforceReadPolicy(_$_categoriasFutureAtom);
    _$_categoriasFutureAtom.reportObserved();
    return super._categoriasFuture;
  }

  @override
  set _categoriasFuture(ObservableFuture<List<CategoriaModel>> value) {
    _$_categoriasFutureAtom.context.conditionallyRunInAction(() {
      super._categoriasFuture = value;
      _$_categoriasFutureAtom.reportChanged();
    }, _$_categoriasFutureAtom, name: '${_$_categoriasFutureAtom.name}_set');
  }

  final _$_salvarMovimentacaoFutureAtom =
      Atom(name: '_EditarMovimentacaoControllerBase._salvarMovimentacaoFuture');

  @override
  ObservableFuture<dynamic> get _salvarMovimentacaoFuture {
    _$_salvarMovimentacaoFutureAtom.context
        .enforceReadPolicy(_$_salvarMovimentacaoFutureAtom);
    _$_salvarMovimentacaoFutureAtom.reportObserved();
    return super._salvarMovimentacaoFuture;
  }

  @override
  set _salvarMovimentacaoFuture(ObservableFuture<dynamic> value) {
    _$_salvarMovimentacaoFutureAtom.context.conditionallyRunInAction(() {
      super._salvarMovimentacaoFuture = value;
      _$_salvarMovimentacaoFutureAtom.reportChanged();
    }, _$_salvarMovimentacaoFutureAtom,
        name: '${_$_salvarMovimentacaoFutureAtom.name}_set');
  }

  final _$buscarCategoriasAsyncAction = AsyncAction('buscarCategorias');

  @override
  Future<void> buscarCategorias(String tipo) {
    return _$buscarCategoriasAsyncAction
        .run(() => super.buscarCategorias(tipo));
  }

  final _$_EditarMovimentacaoControllerBaseActionController =
      ActionController(name: '_EditarMovimentacaoControllerBase');

  @override
  void changeCategoria(CategoriaModel categoriaModel) {
    final _$actionInfo =
        _$_EditarMovimentacaoControllerBaseActionController.startAction();
    try {
      return super.changeCategoria(categoriaModel);
    } finally {
      _$_EditarMovimentacaoControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeDescricao(String descricao) {
    final _$actionInfo =
        _$_EditarMovimentacaoControllerBaseActionController.startAction();
    try {
      return super.changeDescricao(descricao);
    } finally {
      _$_EditarMovimentacaoControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeValor(double valor) {
    final _$actionInfo =
        _$_EditarMovimentacaoControllerBaseActionController.startAction();
    try {
      return super.changeValor(valor);
    } finally {
      _$_EditarMovimentacaoControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setDataInclusao(DateTime data, TimeOfDay hora) {
    final _$actionInfo =
        _$_EditarMovimentacaoControllerBaseActionController.startAction();
    try {
      return super.setDataInclusao(data, hora);
    } finally {
      _$_EditarMovimentacaoControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFilter(String value) {
    final _$actionInfo =
        _$_EditarMovimentacaoControllerBaseActionController.startAction();
    try {
      return super.setFilter(value);
    } finally {
      _$_EditarMovimentacaoControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFilterInfo(String value) {
    final _$actionInfo =
        _$_EditarMovimentacaoControllerBaseActionController.startAction();
    try {
      return super.setFilterInfo(value);
    } finally {
      _$_EditarMovimentacaoControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic prepareForm(MovimentacaoModel item) {
    final _$actionInfo =
        _$_EditarMovimentacaoControllerBaseActionController.startAction();
    try {
      return super.prepareForm(item);
    } finally {
      _$_EditarMovimentacaoControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'dataInclusao: ${dataInclusao.toString()},errorMessage: ${errorMessage.toString()},tipoSelecionado: ${tipoSelecionado.toString()},categorias: ${categorias.toString()},categoriaValid: ${categoriaValid.toString()},categoria: ${categoria.toString()},descricao: ${descricao.toString()},valor: ${valor.toString()},filter: ${filter.toString()},filterInfo: ${filterInfo.toString()},categoriasStatus: ${categoriasStatus.toString()},salvarMovimentacaoStatus: ${salvarMovimentacaoStatus.toString()}';
    return '{$string}';
  }
}
