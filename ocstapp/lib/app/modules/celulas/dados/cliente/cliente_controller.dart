import 'package:OCSTApp/app/core/store_state.dart';
import 'package:OCSTApp/app/models/cliente_endereco_model.dart';
import 'package:OCSTApp/app/models/cliente_manequim_model.dart';
import 'package:OCSTApp/app/models/cliente_model.dart';
import 'package:OCSTApp/app/models/cliente_pet_model.dart';
import 'package:OCSTApp/app/models/cliente_veiculo_model.dart';
import 'package:OCSTApp/app/models/locacao_roupa_item_model.dart';
import 'package:OCSTApp/app/repositories/cliente_repository.dart';
import 'package:OCSTApp/app/repositories/locacoes_roupas_repository.dart';
import 'package:OCSTApp/app/repositories/tag_repository.dart';
import 'package:OCSTApp/app/repositories/usuario_repository.dart';
import 'package:OCSTApp/app/utils/store_utils.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:mobx/mobx.dart';

part 'cliente_controller.g.dart';

class ClienteController = _ClienteControllerBase with _$ClienteController;

abstract class _ClienteControllerBase with Store {
  _ClienteControllerBase();

  @observable
  int clientesEspeciais;

  @observable
  int clientesComDesvio;

  //
  @observable
  ObservableFuture<List<ClienteModel>> _clientesFuture;

  @computed
  StoreState get clientesState => StoreUtils.statusCheck(_clientesFuture);

  @observable
  ObservableList<ClienteModel> clientes;

  @observable
  String filter = '';

  @action
  setFilter(String value) => filter = value;

  @observable
  ObservableFuture<List<String>> _tagsFuture;

  @computed
  StoreState get tagsState => StoreUtils.statusCheck(_tagsFuture);

  @observable
  ObservableList<String> tagsModel;

  @observable
  ObservableList<String> tags;

  @observable
  List<ClienteManequimModel> manequinsCliente;

  @observable
  ObservableFuture<List<ClienteManequimModel>> _manequinsClienteFuture;

  @computed
  StoreState get manequinsClienteState =>
      StoreUtils.statusCheck(_manequinsClienteFuture);

  @observable
  List<ClienteVeiculoModel> veiculosCliente;

  @computed
  StoreState get veiculosClienteState =>
      StoreUtils.statusCheck(_veiculosClienteFuture);

  @observable
  ObservableFuture<List<ClienteVeiculoModel>> _veiculosClienteFuture;

  @observable
  List<ClientePetModel> petsCliente;

  @computed
  StoreState get petsClienteState => StoreUtils.statusCheck(_petsClienteFuture);

  @observable
  ObservableFuture<List<ClientePetModel>> _petsClienteFuture;

  @observable
  List<ClienteEnderecoModel> enderecosCliente;

  @computed
  StoreState get enderecosClienteState =>
      StoreUtils.statusCheck(_enderecosClienteFuture);

  @observable
  ObservableFuture<List<ClienteEnderecoModel>> _enderecosClienteFuture;

  @computed
  List<ClienteModel> get listFiltered {
    if (filter.isEmpty) {
      return clientes;
    } else {
      return (clientes.where((w) => w.nome.contains(filter)).toList() +
              clientes.where((w) => w.celular.contains(filter)).toList() +
              clientes.where((w) => w.email.contains(filter)).toList() +
              clientes.where((w) => w.tags.contains(filter)).toList() +
              clientes.where((w) => w.usuarioNome.contains(filter)).toList())
          .toSet()
          .toList();
    }
  }

  @observable
  String sistemaRef;

  @observable
  String errorMessage;

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

  @action
  Future<void> obterPrimeirosClientesParaTela() async {
    try {
      final usuarioRepository = new UsuarioRepository();
      final clienteRepository = new ClienteRepository();
      final usuarioLogado = usuarioRepository.getLogin();
      _clientesFuture = ObservableFuture(
          clienteRepository.obterPrimeirosClientesParaTela(usuarioLogado));
      List<ClienteModel> clientesResultado = await _clientesFuture;
      clientes = clientesResultado.asObservable();
      clientesEspeciais = 3;
      clientesComDesvio = 1;
    } catch (e) {
      errorMessage = 'Erro ao buscar os dados dos clientes';
      print(e);
    }
  }

  @action
  Future<void> obterSistemaUsuarioLogado() async {
    final usuarioRepository = new UsuarioRepository();
    sistemaRef = await usuarioRepository
        .obterDadosDoSistemaEscolhidoPeloUsuario(
            await usuarioRepository.getLogin())
        .then((res) => res.sistemaRef);
  }

  List tagStringParaTagsList(String tags) {
    var listSplit = tags != null ? tags.split('|') : new List();
    var listRet = new List<Item>();
    for (var item in listSplit) {
      if (item != "") listRet.add(Item(title: item));
    }
    return listRet;
  }

  Future<void> consultarManequinsCliente(int clienteId) async {
    final clienteRepository = new ClienteRepository();
    _manequinsClienteFuture = ObservableFuture(
        clienteRepository.consultarManequinsCliente(clienteId));
    List<ClienteManequimModel> resultado = await _manequinsClienteFuture;
    manequinsCliente = resultado.asObservable();
  }

  Future<void> consultarVariosVeiculosCliente(int clienteId) async {
    final clienteRepository = new ClienteRepository();
    _veiculosClienteFuture = ObservableFuture(
        clienteRepository.consultarVariosVeiculosCliente(clienteId));
    List<ClienteVeiculoModel> resultado = await _veiculosClienteFuture;
    veiculosCliente = resultado.asObservable();
  }

  Future<void> consultarVariosPetsCliente(int clienteId) async {
    final clienteRepository = new ClienteRepository();
    _petsClienteFuture = ObservableFuture(
        clienteRepository.consultarVariosPetsCliente(clienteId));
    List<ClientePetModel> resultado = await _petsClienteFuture;
    petsCliente = resultado.asObservable();
  }

  Future<void> consultarVariosEnderecosCliente(int clienteId) async {
    final clienteRepository = new ClienteRepository();
    _enderecosClienteFuture = ObservableFuture(
        clienteRepository.consultarVariosEnderecosCliente(clienteId));
    List<ClienteEnderecoModel> resultado = await _enderecosClienteFuture;
    enderecosCliente = resultado.asObservable();
  }
}
