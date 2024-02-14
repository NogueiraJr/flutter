import 'package:OCSTApp/app/core/store_state.dart';
import 'package:OCSTApp/app/repositories/atendimento_servico_repository.dart';
import 'package:OCSTApp/app/repositories/tag_repository.dart';
import 'package:OCSTApp/app/repositories/usuario_repository.dart';
import 'package:OCSTApp/app/utils/snackbar_utils.dart';
import 'package:OCSTApp/app/utils/store_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:mobx/mobx.dart';

part 'editar_controller.g.dart';

class AtendimentoServicoInfoEditarController = _AtendimentoServicoInfoEditarControllerBase
    with _$AtendimentoServicoInfoEditarController;

abstract class _AtendimentoServicoInfoEditarControllerBase with Store {
  GlobalKey<FormState> globalKeyCad = GlobalKey<FormState>();
  final AtendimentoServicoRepository repository;

  _AtendimentoServicoInfoEditarControllerBase(this.repository);

  @observable
  int id;

  @observable
  int atendimentoServicoId;

  @observable
  String descricao;
  @observable
  String tags;
  @observable
  String observacao;

  @action
  changeDescricao(String descricaoValue) => descricao = descricaoValue;
  @action
  changeTags(String tagsValue) => tags = tagsValue;
  @action
  changeObservacao(String observacaoValue) => observacao = observacaoValue;

  @observable
  ObservableFuture<List<String>> _tagsFuture;

  @computed
  StoreState get tagsState => StoreUtils.statusCheck(_tagsFuture);

  @observable
  ObservableList<String> tagsModel;

  @observable
  ObservableList<String> tagsToSave;

  @observable
  String errorMessage;

  @observable
  ObservableFuture<bool> _cadFuture;

  @computed
  StoreState get state => StoreUtils.statusCheck(_cadFuture);

  @action
  Future<void> obterTags() async {
    try {
      final usuarioRepository = new UsuarioRepository();
      final tagRepository = new TagRepository();
      final usuarioLogado = await usuarioRepository.getLogin();
      final usuario =
          await usuarioRepository.consultarUsuarioLogado(usuarioLogado);

      _tagsFuture = ObservableFuture(tagRepository.obterTags(usuario.id));
      List<String> tagsResultado = await _tagsFuture;
      tagsModel = tagsResultado.asObservable();
    } catch (e) {
      errorMessage = 'Erro ao buscar as Etiquetas';
      print(e);
    }
  }

  tagsListParaTagString(List tagsParam) {
    tags = "";
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

  Future<bool> gravar() async {
    if (!globalKeyCad.currentState.validate()) return false;
    errorMessage = '';
    try {
      _cadFuture = ObservableFuture(repository.gravarAtendimentoServicoInfo(
        'upd',
        descricao,
        tags,
        observacao,
        atendimentoServicoId,
        id,
      ));
      await _cadFuture.asObservable();
      if (await _cadFuture) {
        SnackBarUtils.showSnackBar('Sucesso!', 'Atuação gravada com sucesso!');
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      errorMessage = '$e';
      return false;
    }
  }
}
