import 'package:OCSTApp/app/core/store_state.dart';
import 'package:OCSTApp/app/repositories/fornecedor_repository.dart';
import 'package:OCSTApp/app/repositories/usuario_repository.dart';
import 'package:OCSTApp/app/utils/store_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:mobx/mobx.dart';

part 'fornecedor_cadastro_controller.g.dart';

class FornecedorCadastroController = _FornecedorCadastroControllerBase
    with _$FornecedorCadastroController;

abstract class _FornecedorCadastroControllerBase with Store {
  GlobalKey<FormState> globalKeyCad = GlobalKey<FormState>();
  final FornecedorRepository fornecedorRepository;
  final UsuarioRepository usuarioRepository;

  _FornecedorCadastroControllerBase(
      this.fornecedorRepository, this.usuarioRepository);

  @observable
  String nome;
  @observable
  String telefone;
  @observable
  String email;
  @observable
  int usuarioId;
  @observable
  String tags;

  @action
  changeNome(String nomeValue) => nome = nomeValue;
  @action
  changeTelefone(String telefoneValue) => telefone = telefoneValue;
  @action
  changeEmail(String emailValue) => email = emailValue;

  @observable
  String errorMessage;

  @observable
  ObservableFuture _cadastrarFuture;

  @computed
  StoreState get state => StoreUtils.statusCheck(_cadastrarFuture);

  var controllerMaskTelefone =
      new MaskedTextController(mask: '(00) 0 0000-0000');

  Future<void> gravarFornecedor() async {
    if (globalKeyCad.currentState.validate()) {
      errorMessage = '';
      try {
        final login = await usuarioRepository.getLogin();
        final usuario = await usuarioRepository.consultarUsuarioLogado(login);
        _cadastrarFuture =
            ObservableFuture(fornecedorRepository.gravarFornecedor(
          'ins',
          nome,
          controllerMaskTelefone.text,
          email,
          tags,
          usuario.id,
          null,
        ));
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
}
