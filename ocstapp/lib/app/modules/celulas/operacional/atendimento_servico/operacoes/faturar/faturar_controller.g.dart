// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faturar_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FaturarAtendimentoController
    on _FaturarAtendimentoControllerBase, Store {
  Computed<StoreState> _$categoriasStatusComputed;

  @override
  StoreState get categoriasStatus => (_$categoriasStatusComputed ??=
          Computed<StoreState>(() => super.categoriasStatus))
      .value;
  Computed<StoreState> _$faturarStatusComputed;

  @override
  StoreState get faturarStatus => (_$faturarStatusComputed ??=
          Computed<StoreState>(() => super.faturarStatus))
      .value;

  final _$qtdeParcelasAtom =
      Atom(name: '_FaturarAtendimentoControllerBase.qtdeParcelas');

  @override
  String get qtdeParcelas {
    _$qtdeParcelasAtom.context.enforceReadPolicy(_$qtdeParcelasAtom);
    _$qtdeParcelasAtom.reportObserved();
    return super.qtdeParcelas;
  }

  @override
  set qtdeParcelas(String value) {
    _$qtdeParcelasAtom.context.conditionallyRunInAction(() {
      super.qtdeParcelas = value;
      _$qtdeParcelasAtom.reportChanged();
    }, _$qtdeParcelasAtom, name: '${_$qtdeParcelasAtom.name}_set');
  }

  final _$idAtendimentoServicoAtom =
      Atom(name: '_FaturarAtendimentoControllerBase.idAtendimentoServico');

  @override
  int get idAtendimentoServico {
    _$idAtendimentoServicoAtom.context
        .enforceReadPolicy(_$idAtendimentoServicoAtom);
    _$idAtendimentoServicoAtom.reportObserved();
    return super.idAtendimentoServico;
  }

  @override
  set idAtendimentoServico(int value) {
    _$idAtendimentoServicoAtom.context.conditionallyRunInAction(() {
      super.idAtendimentoServico = value;
      _$idAtendimentoServicoAtom.reportChanged();
    }, _$idAtendimentoServicoAtom,
        name: '${_$idAtendimentoServicoAtom.name}_set');
  }

  final _$idCategoriaAtom =
      Atom(name: '_FaturarAtendimentoControllerBase.idCategoria');

  @override
  int get idCategoria {
    _$idCategoriaAtom.context.enforceReadPolicy(_$idCategoriaAtom);
    _$idCategoriaAtom.reportObserved();
    return super.idCategoria;
  }

  @override
  set idCategoria(int value) {
    _$idCategoriaAtom.context.conditionallyRunInAction(() {
      super.idCategoria = value;
      _$idCategoriaAtom.reportChanged();
    }, _$idCategoriaAtom, name: '${_$idCategoriaAtom.name}_set');
  }

  final _$dataInicialAtom =
      Atom(name: '_FaturarAtendimentoControllerBase.dataInicial');

  @override
  DateTime get dataInicial {
    _$dataInicialAtom.context.enforceReadPolicy(_$dataInicialAtom);
    _$dataInicialAtom.reportObserved();
    return super.dataInicial;
  }

  @override
  set dataInicial(DateTime value) {
    _$dataInicialAtom.context.conditionallyRunInAction(() {
      super.dataInicial = value;
      _$dataInicialAtom.reportChanged();
    }, _$dataInicialAtom, name: '${_$dataInicialAtom.name}_set');
  }

  final _$errorMessageAtom =
      Atom(name: '_FaturarAtendimentoControllerBase.errorMessage');

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

  final _$descricaoAtom =
      Atom(name: '_FaturarAtendimentoControllerBase.descricao');

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

  final _$valorAtom = Atom(name: '_FaturarAtendimentoControllerBase.valor');

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

  final _$tagsAtom = Atom(name: '_FaturarAtendimentoControllerBase.tags');

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

  final _$_categoriasFutureAtom =
      Atom(name: '_FaturarAtendimentoControllerBase._categoriasFuture');

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

  final _$_faturarFutureAtom =
      Atom(name: '_FaturarAtendimentoControllerBase._faturarFuture');

  @override
  ObservableFuture<dynamic> get _faturarFuture {
    _$_faturarFutureAtom.context.enforceReadPolicy(_$_faturarFutureAtom);
    _$_faturarFutureAtom.reportObserved();
    return super._faturarFuture;
  }

  @override
  set _faturarFuture(ObservableFuture<dynamic> value) {
    _$_faturarFutureAtom.context.conditionallyRunInAction(() {
      super._faturarFuture = value;
      _$_faturarFutureAtom.reportChanged();
    }, _$_faturarFutureAtom, name: '${_$_faturarFutureAtom.name}_set');
  }

  final _$_FaturarAtendimentoControllerBaseActionController =
      ActionController(name: '_FaturarAtendimentoControllerBase');

  @override
  void changeQtdeParcelas(String qtdeParcelas) {
    final _$actionInfo =
        _$_FaturarAtendimentoControllerBaseActionController.startAction();
    try {
      return super.changeQtdeParcelas(qtdeParcelas);
    } finally {
      _$_FaturarAtendimentoControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeDescricao(String descricao) {
    final _$actionInfo =
        _$_FaturarAtendimentoControllerBaseActionController.startAction();
    try {
      return super.changeDescricao(descricao);
    } finally {
      _$_FaturarAtendimentoControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeValor(double valor) {
    final _$actionInfo =
        _$_FaturarAtendimentoControllerBaseActionController.startAction();
    try {
      return super.changeValor(valor);
    } finally {
      _$_FaturarAtendimentoControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setDataInclusao(DateTime data, TimeOfDay hora) {
    final _$actionInfo =
        _$_FaturarAtendimentoControllerBaseActionController.startAction();
    try {
      return super.setDataInclusao(data, hora);
    } finally {
      _$_FaturarAtendimentoControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'qtdeParcelas: ${qtdeParcelas.toString()},idAtendimentoServico: ${idAtendimentoServico.toString()},idCategoria: ${idCategoria.toString()},dataInicial: ${dataInicial.toString()},errorMessage: ${errorMessage.toString()},descricao: ${descricao.toString()},valor: ${valor.toString()},tags: ${tags.toString()},categoriasStatus: ${categoriasStatus.toString()},faturarStatus: ${faturarStatus.toString()}';
    return '{$string}';
  }
}
