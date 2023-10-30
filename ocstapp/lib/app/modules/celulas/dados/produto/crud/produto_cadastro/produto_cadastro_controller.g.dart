// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produto_cadastro_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProdutoCadastroController on _ProdutoCadastroControllerBase, Store {
  Computed<StoreState> _$stateComputed;

  @override
  StoreState get state =>
      (_$stateComputed ??= Computed<StoreState>(() => super.state)).value;

  final _$codigoAtom = Atom(name: '_ProdutoCadastroControllerBase.codigo');

  @override
  String get codigo {
    _$codigoAtom.context.enforceReadPolicy(_$codigoAtom);
    _$codigoAtom.reportObserved();
    return super.codigo;
  }

  @override
  set codigo(String value) {
    _$codigoAtom.context.conditionallyRunInAction(() {
      super.codigo = value;
      _$codigoAtom.reportChanged();
    }, _$codigoAtom, name: '${_$codigoAtom.name}_set');
  }

  final _$nomeAtom = Atom(name: '_ProdutoCadastroControllerBase.nome');

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

  final _$descricaoAtom =
      Atom(name: '_ProdutoCadastroControllerBase.descricao');

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

  final _$custoAtom = Atom(name: '_ProdutoCadastroControllerBase.custo');

  @override
  String get custo {
    _$custoAtom.context.enforceReadPolicy(_$custoAtom);
    _$custoAtom.reportObserved();
    return super.custo;
  }

  @override
  set custo(String value) {
    _$custoAtom.context.conditionallyRunInAction(() {
      super.custo = value;
      _$custoAtom.reportChanged();
    }, _$custoAtom, name: '${_$custoAtom.name}_set');
  }

  final _$precoAtom = Atom(name: '_ProdutoCadastroControllerBase.preco');

  @override
  String get preco {
    _$precoAtom.context.enforceReadPolicy(_$precoAtom);
    _$precoAtom.reportObserved();
    return super.preco;
  }

  @override
  set preco(String value) {
    _$precoAtom.context.conditionallyRunInAction(() {
      super.preco = value;
      _$precoAtom.reportChanged();
    }, _$precoAtom, name: '${_$precoAtom.name}_set');
  }

  final _$tagsAtom = Atom(name: '_ProdutoCadastroControllerBase.tags');

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

  final _$usuarioIdAtom =
      Atom(name: '_ProdutoCadastroControllerBase.usuarioId');

  @override
  int get usuarioId {
    _$usuarioIdAtom.context.enforceReadPolicy(_$usuarioIdAtom);
    _$usuarioIdAtom.reportObserved();
    return super.usuarioId;
  }

  @override
  set usuarioId(int value) {
    _$usuarioIdAtom.context.conditionallyRunInAction(() {
      super.usuarioId = value;
      _$usuarioIdAtom.reportChanged();
    }, _$usuarioIdAtom, name: '${_$usuarioIdAtom.name}_set');
  }

  final _$errorMessageAtom =
      Atom(name: '_ProdutoCadastroControllerBase.errorMessage');

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
      Atom(name: '_ProdutoCadastroControllerBase._cadastrarFuture');

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

  final _$_ProdutoCadastroControllerBaseActionController =
      ActionController(name: '_ProdutoCadastroControllerBase');

  @override
  dynamic changeCodigo(String codigoValue) {
    final _$actionInfo =
        _$_ProdutoCadastroControllerBaseActionController.startAction();
    try {
      return super.changeCodigo(codigoValue);
    } finally {
      _$_ProdutoCadastroControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeNome(String nomeValue) {
    final _$actionInfo =
        _$_ProdutoCadastroControllerBaseActionController.startAction();
    try {
      return super.changeNome(nomeValue);
    } finally {
      _$_ProdutoCadastroControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeDescricao(String descricaoValue) {
    final _$actionInfo =
        _$_ProdutoCadastroControllerBaseActionController.startAction();
    try {
      return super.changeDescricao(descricaoValue);
    } finally {
      _$_ProdutoCadastroControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'codigo: ${codigo.toString()},nome: ${nome.toString()},descricao: ${descricao.toString()},custo: ${custo.toString()},preco: ${preco.toString()},tags: ${tags.toString()},usuarioId: ${usuarioId.toString()},errorMessage: ${errorMessage.toString()},state: ${state.toString()}';
    return '{$string}';
  }
}
