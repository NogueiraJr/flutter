import 'package:OCSTApp/app/core/store_state.dart';
import 'package:OCSTApp/app/repositories/fornecedor_repository.dart';
import 'package:OCSTApp/app/utils/store_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:mobx/mobx.dart';

part 'fornecedor_editar_controller.g.dart';

class FornecedorEditarController = _FornecedorEditarControllerBase
    with _$FornecedorEditarController;

abstract class _FornecedorEditarControllerBase with Store {
  GlobalKey<FormState> globalKeyAlt = GlobalKey<FormState>();
  final FornecedorRepository fornecedorRepository;

  _FornecedorEditarControllerBase(this.fornecedorRepository);

  @observable
  int id;
  @observable
  int usuarioId;

  @observable
  String nome;
  @observable
  String telefone;
  @observable
  String email;
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
  ObservableFuture _editarFuture;

  @computed
  StoreState get state => StoreUtils.statusCheck(_editarFuture);

  var controllerMaskTelefone =
      new MaskedTextController(mask: '(00) 0 0000-0000');

  Future<void> gravarFornecedor() async {
    if (globalKeyAlt.currentState.validate()) {
      errorMessage = '';
      try {
        //final login = await usuarioRepository.getLogin();
        //final usuario = await usuarioRepository.consultarUsuarioLogado(login);
        _editarFuture = ObservableFuture(fornecedorRepository.gravarFornecedor(
            'upd',
            nome,
            controllerMaskTelefone.text,
            email,
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
