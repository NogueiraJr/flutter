import 'package:OCSTApp/app/core/store_state.dart';
import 'package:OCSTApp/app/repositories/tag_repository.dart';
import 'package:OCSTApp/app/repositories/usuario_repository.dart';
import 'package:OCSTApp/app/utils/store_utils.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'tag_editar_controller.g.dart';

class TagEditarController = _TagEditarControllerBase with _$TagEditarController;

abstract class _TagEditarControllerBase with Store {
  GlobalKey<FormState> globalKeyAlt = GlobalKey<FormState>();
  final TagRepository tagRepository;
  final UsuarioRepository usuarioRepository;

  _TagEditarControllerBase(this.tagRepository, this.usuarioRepository);

  @observable
  int id;
  @observable
  int usuarioId;

  @observable
  String nome;
  @observable
  String descricao;

  @action
  changeNome(String nomeValue) => nome = nomeValue;
  @action
  changeDescricao(String emailValue) => descricao = emailValue;

  @observable
  String errorMessage;

  @observable
  ObservableFuture _editarFuture;

  @computed
  StoreState get state => StoreUtils.statusCheck(_editarFuture);

  Future<void> gravarTag(String nomeAntigo) async {
    if (globalKeyAlt.currentState.validate()) {
      errorMessage = '';
      try {
        final login = await usuarioRepository.getLogin();
        final usuario = await usuarioRepository.consultarUsuarioLogado(login);
        errorMessage = await tagRepository.tagJaExiste(id, nome, usuario.id);
        if (errorMessage.length > 0) return;
        _editarFuture = ObservableFuture(tagRepository.gravarTag(
            'upd', nomeAntigo, nome, descricao, usuarioId, id));
        await _editarFuture.asObservable();
      } catch (e) {
        print(e);
        errorMessage = '$e';
      }
    }
  }
}
