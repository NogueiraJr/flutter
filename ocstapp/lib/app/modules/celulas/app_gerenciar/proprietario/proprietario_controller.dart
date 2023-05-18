import 'package:OCSTApp/app/core/store_state.dart';
import 'package:OCSTApp/app/models/menu_model.dart';
import 'package:OCSTApp/app/models/usuario_consulta_model.dart';
import 'package:OCSTApp/app/repositories/usuario_repository.dart';
import 'package:OCSTApp/app/utils/store_utils.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'proprietario_controller.g.dart';

class ProprietarioController = _ProprietarioControllerBase
    with _$ProprietarioController;

abstract class _ProprietarioControllerBase with Store {
  GlobalKey<FormState> globalKeyAlt = GlobalKey<FormState>();
  final UsuarioRepository usuarioRepository;
  _ProprietarioControllerBase(this.usuarioRepository);

  //USUÁRIO
  @observable
  UsuarioConsultaModel usuario;

  @observable
  ObservableFuture<UsuarioConsultaModel> _usuarioFuture;

  @computed
  StoreState get state => StoreUtils.statusCheck(_usuarioFuture);

  //ACESSOS
  @observable
  ObservableFuture<List<MenuModel>> _acessosUsuarioFuture;

  @observable
  ObservableList<MenuModel> acessos;

  @computed
  StoreState get menusState => StoreUtils.statusCheck(_acessosUsuarioFuture);

  //EQUIPE
  @observable
  ObservableFuture<List<UsuarioConsultaModel>> _usuariosEquipeFuture;

  @observable
  ObservableList<UsuarioConsultaModel> usuariosEquipe;

  @computed
  StoreState get equipeState => StoreUtils.statusCheck(_usuariosEquipeFuture);

  //ERROS
  @observable
  String errorMessage;

  @action
  Future<void> obterUsuario() async {
    try {
      _usuarioFuture = ObservableFuture(usuarioRepository
          .consultarUsuarioLogado(await usuarioRepository.getLogin()));
      usuario = await _usuarioFuture;
    } catch (e) {
      print(e);
      errorMessage = '$e';
    }
  }

  @action
  Future<void> obterAcessosUsuario() async {
    try {
      _acessosUsuarioFuture = ObservableFuture(usuarioRepository
          .obterAcessosUsuario(await usuarioRepository.getLogin()));
      List<MenuModel> acessosUsuariosResultado = await _acessosUsuarioFuture;
      acessos = acessosUsuariosResultado.asObservable();
    } catch (e) {
      errorMessage = 'Erro ao buscar os acessos do usuario';
      print(e);
    }
  }

  @action
  Future<void> obterEquipeUsuario() async {
    try {
      _usuariosEquipeFuture = ObservableFuture(usuarioRepository
          .obterEquipeDoUsuario(await usuarioRepository.getLogin()));
      List<UsuarioConsultaModel> equipeUsuarioResultado =
          await _usuariosEquipeFuture;
      usuariosEquipe = equipeUsuarioResultado.asObservable();
    } catch (e) {
      errorMessage = 'Erro ao buscar a Equipe do Usuário';
      print(e);
    }
  }
}
