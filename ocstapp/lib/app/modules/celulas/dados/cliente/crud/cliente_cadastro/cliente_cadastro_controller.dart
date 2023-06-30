import 'package:OCSTApp/app/core/store_state.dart';
import 'package:OCSTApp/app/repositories/cliente_repository.dart';
import 'package:OCSTApp/app/repositories/usuario_repository.dart';
import 'package:OCSTApp/app/utils/store_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:mobx/mobx.dart';

part 'cliente_cadastro_controller.g.dart';

class ClienteCadastroController = _ClienteCadastroControllerBase
    with _$ClienteCadastroController;

abstract class _ClienteCadastroControllerBase with Store {
  GlobalKey<FormState> globalKeyCad = GlobalKey<FormState>();
  final ClienteRepository clienteRepository;
  final UsuarioRepository usuarioRepository;

  _ClienteCadastroControllerBase(
      this.clienteRepository, this.usuarioRepository);

  @observable
  String nome;
  @observable
  String celular;
  @observable
  String email;
  @observable
  int usuarioId;
  @observable
  String tags;

  @action
  changeNome(String nomeValue) => nome = nomeValue;
  @action
  changeCelular(String celularValue) => celular = celularValue;
  @action
  changeEmail(String emailValue) => email = emailValue;

  @observable
  String errorMessage;

  @observable
  ObservableFuture _cadastrarFuture;

  @computed
  StoreState get state => StoreUtils.statusCheck(_cadastrarFuture);

  var controllerMaskCelular =
      new MaskedTextController(mask: '(00) 0 0000-0000');

  Future<void> gravarCliente() async {
    if (globalKeyCad.currentState.validate()) {
      errorMessage = '';
      try {
        final login = await usuarioRepository.getLogin();
        final usuario = await usuarioRepository.consultarUsuarioLogado(login);
        _cadastrarFuture = ObservableFuture(clienteRepository.gravarCliente(
            'ins',
            nome,
            controllerMaskCelular.text,
            email,
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
}
