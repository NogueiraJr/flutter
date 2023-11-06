import 'package:OCSTApp/app/core/store_state.dart';
import 'package:OCSTApp/app/repositories/produto_repository.dart';
import 'package:OCSTApp/app/repositories/tag_repository.dart';
import 'package:OCSTApp/app/repositories/usuario_repository.dart';
import 'package:OCSTApp/app/utils/store_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:mobx/mobx.dart';

part 'produto_editar_controller.g.dart';

class ProdutoEditarController = _ProdutoEditarControllerBase
    with _$ProdutoEditarController;

abstract class _ProdutoEditarControllerBase with Store {
  GlobalKey<FormState> globalKeyAlt = GlobalKey<FormState>();
  final ProdutoRepository produtoRepository;

  _ProdutoEditarControllerBase(this.produtoRepository);

  @observable
  int id;
  @observable
  int usuarioId;

  @observable
  String codigo;
  @observable
  String nome;
  @observable
  String descricao;
  @observable
  double custo;
  @observable
  double preco;
  @observable
  String tags;

  @action
  changeCodigo(String codigoValue) => codigo = codigoValue;
  @action
  changeNome(String nomeValue) => nome = nomeValue;
  @action
  changeDescricao(String descricaoValue) => descricao = descricaoValue;

  @observable
  String errorMessage;

  @observable
  ObservableFuture _editarFuture;

  @computed
  StoreState get state => StoreUtils.statusCheck(_editarFuture);

  var controllerMaskCusto = new MoneyMaskedTextController(
      decimalSeparator: ',', thousandSeparator: '.');

  var controllerMaskPreco = new MoneyMaskedTextController(
      decimalSeparator: ',', thousandSeparator: '.');

  // @observable
  // ObservableFuture _tagsFuture;

  // @computed
  // StoreState get tagsState => StoreUtils.statusCheck(_tagsFuture);

  // @observable
  // ObservableList<String> tags;

  Future<void> gravarProduto() async {
    if (globalKeyAlt.currentState.validate()) {
      errorMessage = '';
      try {
        //final login = await usuarioRepository.getLogin();
        //final usuario = await usuarioRepository.consultarUsuarioLogado(login);
        _editarFuture = ObservableFuture(produtoRepository.gravarProduto(
            'upd',
            codigo,
            nome,
            descricao,
            controllerMaskCusto.numberValue,
            controllerMaskPreco.numberValue,
            tags,
            usuarioId,
            id));
        await _editarFuture.asObservable();
      } catch (e) {
        print(e);
        errorMessage = '$e';
      }
    }
  }

  tagsListParaTagString(List tagsParam) {
    this.tags = "";
    for (var tag in tagsParam) {
      if (tags.length > 0) tags += "|";
      tags += tag.title;
    }
  }

  List tagStringParaTagsList() {
    var listSplit = tags != null ? tags.split('|') : new List();
    var listRet = new List<Item>();
    for (var item in listSplit) {
      if (item != "") listRet.add(Item(title: item));
    }
    return listRet;
  }
}
