import 'package:OCSTApp/app/core/store_state.dart';
import 'package:OCSTApp/app/repositories/atendimento_servico_repository.dart';
import 'package:OCSTApp/app/repositories/tag_repository.dart';
import 'package:OCSTApp/app/repositories/usuario_repository.dart';
import 'package:OCSTApp/app/utils/snackbar_utils.dart';
import 'package:OCSTApp/app/utils/store_utils.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'cadastro_controller.g.dart';

class AtendimentoServicoInfoCadastroController = _AtendimentoServicoInfoCadastroControllerBase
    with _$AtendimentoServicoInfoCadastroController;

abstract class _AtendimentoServicoInfoCadastroControllerBase with Store {
  GlobalKey<FormState> globalKeyCad = GlobalKey<FormState>();
  final AtendimentoServicoRepository repository;

  _AtendimentoServicoInfoCadastroControllerBase(this.repository);

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

  Future<bool> gravar() async {
    if (!globalKeyCad.currentState.validate()) return false;
    errorMessage = '';
    try {
      _cadFuture = ObservableFuture(repository.gravarAtendimentoServicoInfo(
        'ins',
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
