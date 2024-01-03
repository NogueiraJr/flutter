import 'package:OCSTApp/app/core/store_state.dart';
import 'package:OCSTApp/app/repositories/tag_repository.dart';
import 'package:OCSTApp/app/repositories/usuario_repository.dart';
import 'package:OCSTApp/app/utils/snackbar_utils.dart';
import 'package:OCSTApp/app/utils/store_utils.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'tag_cadastro_controller.g.dart';

class TagCadastroController = _TagCadastroControllerBase
    with _$TagCadastroController;

abstract class _TagCadastroControllerBase with Store {
  GlobalKey<FormState> globalKeyCad = GlobalKey<FormState>();
  final TagRepository tagRepository;
  final UsuarioRepository usuarioRepository;

  _TagCadastroControllerBase(this.tagRepository, this.usuarioRepository);

  @observable
  String nome;
  @observable
  String descricao;
  @observable
  int usuarioId;

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

  Future<void> gravarTag() async {
    if (globalKeyCad.currentState.validate()) {
      errorMessage = '';
      try {
        final login = await usuarioRepository.getLogin();
        final usuario = await usuarioRepository.consultarUsuarioLogado(login);
        errorMessage = await tagRepository.tagJaExiste(0, nome, usuario.id);
        if (errorMessage.length > 0) return;
        _cadastrarFuture = ObservableFuture(tagRepository.gravarTag(
            'ins', '', nome, descricao, usuario.id, null));
        return await _cadastrarFuture;
      } catch (e) {
        print('Erro: $e');
        errorMessage = '$e';
      }
    }
  }
}
