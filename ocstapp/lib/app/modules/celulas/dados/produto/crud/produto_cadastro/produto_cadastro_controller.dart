import 'dart:math';

import 'package:OCSTApp/app/core/store_state.dart';
import 'package:OCSTApp/app/repositories/produto_repository.dart';
import 'package:OCSTApp/app/repositories/usuario_repository.dart';
import 'package:OCSTApp/app/utils/store_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

part 'produto_cadastro_controller.g.dart';

class ProdutoCadastroController = _ProdutoCadastroControllerBase
    with _$ProdutoCadastroController;

abstract class _ProdutoCadastroControllerBase with Store {
  GlobalKey<FormState> globalKeyCad = GlobalKey<FormState>();
  final ProdutoRepository produtoRepository;
  final UsuarioRepository usuarioRepository;

  _ProdutoCadastroControllerBase(
      this.produtoRepository, this.usuarioRepository);

  @observable
  String codigo;
  @observable
  String nome;
  @observable
  String descricao;
  @observable
  String custo;
  @observable
  String preco;
  @observable
  String tags;

  @observable
  int usuarioId;

  @action
  changeCodigo(String codigoValue) => codigo = codigoValue;
  @action
  changeNome(String nomeValue) => nome = nomeValue;
  @action
  changeDescricao(String descricaoValue) => descricao = descricaoValue;

  @observable
  String errorMessage;

  @observable
  ObservableFuture _cadastrarFuture;

  @computed
  StoreState get state => StoreUtils.statusCheck(_cadastrarFuture);

  var controllerMaskCusto = new MoneyMaskedTextController(
      decimalSeparator: ',', thousandSeparator: '.');

  var controllerMaskPreco = new MoneyMaskedTextController(
      decimalSeparator: ',', thousandSeparator: '.');

  Future<void> gravarProduto() async {
    if (globalKeyCad.currentState.validate()) {
      errorMessage = '';
      try {
        final login = await usuarioRepository.getLogin();
        final usuario = await usuarioRepository.consultarUsuarioLogado(login);
        _cadastrarFuture = ObservableFuture(produtoRepository.gravarProduto(
            'ins',
            codigo,
            nome,
            descricao,
            controllerMaskCusto.numberValue,
            controllerMaskPreco.numberValue,
            tags,
            usuario.id,
            null));
        return await _cadastrarFuture;
      } catch (e) {
        print('Erro: $e');
        errorMessage = '$e';
      }
    }
  }

  tagsListParaTagString(List tagsParam) {
    tags = "";
    for (var tag in tagsParam) {
      if (tags.length > 0) tags += "|";
      tags += tag.title;
    }
  }

  String obterCodigoAleatorioProduto() {
    var nF = NumberFormat("00000000");
    var rng = new Random();
    var r = nF.format(rng.nextInt(99999999));
    changeCodigo(r);
    return r;
  }
}
