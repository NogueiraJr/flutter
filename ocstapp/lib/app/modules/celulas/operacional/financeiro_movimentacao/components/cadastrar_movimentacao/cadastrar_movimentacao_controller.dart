import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:OCSTApp/app/core/store_state.dart';
import 'package:OCSTApp/app/models/categoria_model.dart';
import 'package:OCSTApp/app/repositories/categorias_repository.dart';
import 'package:OCSTApp/app/repositories/movimentacoes_repository.dart';
import 'package:OCSTApp/app/utils/store_utils.dart';

part 'cadastrar_movimentacao_controller.g.dart';

class CadastrarMovimentacaoController = _CadastrarMovimentacaoControllerBase
    with _$CadastrarMovimentacaoController;

abstract class _CadastrarMovimentacaoControllerBase with Store {
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
    this.valor = valor;
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
  prepareForm() {
    changeCategoria(null);
    changeDescricao('');
    moneyController.text = '0.00';
    categoriaValid = true;
  }

  Future<void> salvarMovimento() async {
    try {
      if (formKey.currentState.validate()) {
        if (categoria == null) {
          categoriaValid = false;
        } else {
          _salvarMovimentacaoFuture = ObservableFuture(
            _movimentacoesRepository.salvarMovimentacao(
              'ins',
              null,
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
}
