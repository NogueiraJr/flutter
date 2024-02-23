import 'package:OCSTApp/app/core/store_state.dart';
import 'package:OCSTApp/app/modules/celulas/dados/cliente/complementos/pets/cliente_pet_dialog.dart';
import 'package:OCSTApp/app/modules/celulas/dados/cliente/complementos/veiculos/cliente_veiculo_dialog.dart';
import 'package:OCSTApp/app/modules/celulas/operacional/atendimento_servico/atendimento_servico_controller.dart';
import 'package:OCSTApp/app/modules/principal/principal_controller.dart';
import 'package:OCSTApp/app/repositories/atendimento_servico_repository.dart';
import 'package:OCSTApp/app/repositories/usuario_repository.dart';
import 'package:OCSTApp/app/utils/store_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'cadastro_controller.g.dart';

class AtendimentoServicoCadastroController = _AtendimentoServicoCadastroControllerBase
    with _$AtendimentoServicoCadastroController;

abstract class _AtendimentoServicoCadastroControllerBase with Store {
  GlobalKey<FormState> globalKeyCad = GlobalKey<FormState>();
  final AtendimentoServicoRepository atendimentoServicoRepository;
  final UsuarioRepository usuarioRepository;

  _AtendimentoServicoCadastroControllerBase(
      this.atendimentoServicoRepository, this.usuarioRepository);

  @observable
  Image imageAtendimento;

  @observable
  ObservableFuture _sistemaRef;

  @computed
  StoreState get stateSistemaRef => StoreUtils.statusCheck(_sistemaRef);

  // @observable
  // String celular;
  // @observable
  // String email;
  // @observable
  // int usuarioId;
  // @observable
  // String tags;

  // @action
  // changeNome(String nomeValue) => nome = nomeValue;
  // @action
  // changeCelular(String celularValue) => celular = celularValue;
  // @action
  // changeEmail(String emailValue) => email = emailValue;

  @observable
  String errorMessage;

  @observable
  ObservableFuture _cadastrarFuture;

  @computed
  StoreState get state => StoreUtils.statusCheck(_cadastrarFuture);

  var controllerMaskCelular =
      new MaskedTextController(mask: '(00) 0 0000-0000');

  void escolherCliente() {
    final controller = GetIt.I.get<AtendimentoServicoController>();
    controller.clienteObjetoEscolhidoId = 0;
    fixarNomeBotaoObjeto();
    Get.toNamed('/escolher_cliente');
  }

  void fixarNomeBotaoObjeto() {
    final controller = GetIt.I.get<AtendimentoServicoController>();
    final controllerPrincipal = GetIt.I.get<PrincipalController>();
    switch (controllerPrincipal.sistemaRef) {
      case 'refOficinaCarros':
        controller.clienteObjetoEscolhidoNome = 'Escolha o Veículo';
        break;
      case 'refPetShop':
        controller.clienteObjetoEscolhidoNome = 'Escolha o Pet';
        break;
      case 'refClinicaVeterinaria':
        controller.clienteObjetoEscolhidoNome = 'Escolha o Pet';
        break;
      default:
    }
  }

  escolherObjetoAtendimento(int clienteId, BuildContext context) {
    final controller = GetIt.I.get<AtendimentoServicoController>();
    final controllerPrincipal = GetIt.I.get<PrincipalController>();
    //Zera escolha do objeto, para caso o usuário saia sem escolher.
    controller.clienteObjetoEscolhidoId = 0;
    fixarNomeBotaoObjeto();
    switch (controllerPrincipal.sistemaRef) {
      case 'refOficinaCarros':
        // controller.clienteObjetoEscolhidoNome = 'Escolha o Veículo';
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) =>
                ClienteVeiculoDialog(clienteId: clienteId),
            fullscreenDialog: true,
          ),
        );
        break;
      case 'refPetShop':
        // controller.clienteObjetoEscolhidoNome = 'Escolha o Pet';
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) =>
                ClientePetDialog(clienteId: clienteId),
            fullscreenDialog: true,
          ),
        );
        break;
      case 'refClinicaVeterinaria':
        // controller.clienteObjetoEscolhidoNome = 'Escolha o Pet';
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) =>
                ClientePetDialog(clienteId: clienteId),
            fullscreenDialog: true,
          ),
        );
        break;
      default:
    }
  }

  void escolherProdutos() {
    Get.toNamed('/escolher_produto');
  }

  // tagsListParaTagString(List tagsParam) {
  //   tags = "";
  //   for (var tag in tagsParam) {
  //     if (tags.length > 0) tags += "|";
  //     tags += tag.title;
  //   }
  // }

  void getImageAtendimento() async {
    final prefx = 'assets/images/opr-atendimento-servico-';
    final usuarioRepository = new UsuarioRepository();
    _sistemaRef = ObservableFuture(
            usuarioRepository.obterDadosDoSistemaEscolhidoPeloUsuario(
                await usuarioRepository.getLogin()))
        .then((ref) => ref.sistemaRef);
    final sistemaRef = await _sistemaRef;
    if (sistemaRef == 'refOficinaCarros') {
      imageAtendimento = Image.asset('${prefx}oficina-carros-iniciar.png');
    } else if (sistemaRef == 'refCabeleireiro') {
      imageAtendimento = Image.asset('${prefx}cabeleireiro-iniciar.png');
    } else if (sistemaRef == 'refDentista') {
      imageAtendimento = Image.asset('${prefx}dentista-iniciar.png');
    } else if (sistemaRef == 'refPetShop') {
      imageAtendimento = Image.asset('${prefx}petshop-iniciar.png');
    } else if (sistemaRef == 'refClinicaEstetica') {
      imageAtendimento = Image.asset('${prefx}clinica-estetica-iniciar.png');
    } else if (sistemaRef == 'refEstudioFotografico') {
      imageAtendimento = Image.asset('${prefx}estudio-fotografico-iniciar.png');
    } else if (sistemaRef == 'refLocacaoCarros') {
      imageAtendimento = Image.asset('${prefx}locacao-veiculo-iniciar.png');
    } else if (sistemaRef == 'refClinicaVeterinaria') {
      imageAtendimento = Image.asset('${prefx}veterinario-iniciar.png');
    }
  }
}
