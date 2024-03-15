import 'package:OCSTApp/app/models/movimentacao_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:mobx/mobx.dart';
import 'package:OCSTApp/app/core/store_state.dart';
import 'package:OCSTApp/app/models/categoria_model.dart';
import 'package:OCSTApp/app/repositories/categorias_repository.dart';
import 'package:OCSTApp/app/repositories/movimentacoes_repository.dart';
import 'package:OCSTApp/app/utils/store_utils.dart';

part 'editar_movimentacao_controller.g.dart';

class EditarMovimentacaoController = _EditarMovimentacaoControllerBase
    with _$EditarMovimentacaoController;

abstract class _EditarMovimentacaoControllerBase with Store {
  final formKey = GlobalKey<FormState>();
  final moneyController =
      MoneyMaskedTextController(decimalSeparator: ',', thousandSeparator: '.');
  CategoriasRepository _categoriaRepository =
      Modular.get<CategoriasRepository>();
  MovimentacoesRepository _movimentacoesRepository =
      Modular.get<MovimentacoesRepository>();

  @observable
  DateTime dataInclusao = DateTime.now();

  @observable
  String errorMessage;
  @observable
  String tipoSelecionado;
  @observable
  List<CategoriaModel> categorias;
  @observable
  bool categoriaValid = true;
  @observable
  CategoriaModel categoria;
  @observable
  String descricao;
  @observable
  double valor;

  @action
  void changeCategoria(CategoriaModel categoriaModel) {
    categoria = categoriaModel;
  }

  @action
  void changeDescricao(String descricao) {
    this.descricao = descricao;
  }

  @action
  void changeValor(double valor) {
    valor = valor;
  }

  @action
  void setDataInclusao(DateTime data, TimeOfDay hora) {
    data = new DateTime(
      data.year,
      data.month,
      data.day,
      hora.hour,
      hora.minute,
    );
    dataInclusao = data;
  }

  @observable
  String filter = '';

  @action
  setFilter(String value) => filter = value;

  @observable
  String filterInfo = '';

  @action
  setFilterInfo(String value) => filterInfo = value;

  @observable
  ObservableFuture<List<CategoriaModel>> _categoriasFuture;

  @computed
  StoreState get categoriasStatus => StoreUtils.statusCheck(_categoriasFuture);

  @action
  Future<void> buscarCategorias(String tipo) async {
    try {
      tipoSelecionado = tipo;
      _categoriasFuture =
          ObservableFuture(_categoriaRepository.getCategorias(tipo));
      List<CategoriaModel> categoriasModel = await _categoriasFuture;
      this.categorias = categoriasModel;
    } catch (e) {
      errorMessage = 'Erro ao buscar categorias';
      print(e);
    }
  }

  @observable
  ObservableFuture _salvarMovimentacaoFuture;

  @computed
  StoreState get salvarMovimentacaoStatus =>
      StoreUtils.statusCheck(_salvarMovimentacaoFuture);

  @action
  prepareForm(MovimentacaoModel item) {
    changeCategoria(item.categoria);
    changeDescricao(item.descricao);
    dataInclusao = item.dataMovimentacao;
    moneyController.text = item.valor.toString();
    categoriaValid = true;
  }

  Future<void> salvarMovimento(int id) async {
    try {
      if (formKey.currentState.validate()) {
        if (categoria == null) {
          categoriaValid = false;
        } else {
          _salvarMovimentacaoFuture = ObservableFuture(
            _movimentacoesRepository.salvarMovimentacao(
              'upd',
              id,
              categoria.id,
              dataInclusao,
              descricao,
              moneyController.numberValue,
            ),
          );
          await _salvarMovimentacaoFuture;
        }
      } else {
        if (categoria == null) {
          categoriaValid = false;
        }
      }
    } catch (e) {
      print(e);
    }
  }

  List tagStringParaTagsList(String tags) {
    var listSplit = tags != null ? tags.split('|') : new List();
    var listRet = new List<Item>();
    for (var item in listSplit) {
      if (item != "") listRet.add(Item(title: item));
    }
    return listRet;
  }
}
