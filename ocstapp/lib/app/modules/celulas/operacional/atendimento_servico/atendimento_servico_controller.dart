import 'package:OCSTApp/app/components/app_text_form_field.dart';
import 'package:OCSTApp/app/core/store_state.dart';
import 'package:OCSTApp/app/models/atendimento_servico_info_model.dart';
import 'package:OCSTApp/app/models/atendimento_servico_item_model.dart';
import 'package:OCSTApp/app/models/cliente_pet_model.dart';
import 'package:OCSTApp/app/models/cliente_veiculo_model.dart';
import 'package:OCSTApp/app/models/movimentacao_faturamento_model.dart';
import 'package:OCSTApp/app/models/produto_model.dart';
import 'package:OCSTApp/app/models/atendimento_servico_model.dart';
import 'package:OCSTApp/app/models/resposta_model.dart';
import 'package:OCSTApp/app/modules/celulas/operacional/atendimento_servico/operacoes/faturar/faturar_controller.dart';
import 'package:OCSTApp/app/modules/celulas/operacional/atendimento_servico/operacoes/faturar/faturar_widget.dart';
import 'package:OCSTApp/app/modules/principal/principal_controller.dart';
import 'package:OCSTApp/app/repositories/atendimento_servico_repository.dart';
import 'package:OCSTApp/app/repositories/tag_repository.dart';
import 'package:OCSTApp/app/repositories/usuario_repository.dart';
import 'package:OCSTApp/app/utils/snackbar_utils.dart';
import 'package:OCSTApp/app/utils/store_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

part 'atendimento_servico_controller.g.dart';

class AtendimentoServicoController = _AtendimentoServicoControllerBase
    with _$AtendimentoServicoController;

abstract class _AtendimentoServicoControllerBase with Store {
  @observable
  int clientesEspeciais;

  @observable
  int clientesComDesvio;

  @observable
  int origemProdutoAtendimentoServicoId;

  @observable
  String origemProdutoTela;

  @observable
  DateTime selectedDay;

  @observable
  Map<DateTime, List> events = {};
  @observable
  Map<DateTime, List> holidays = {};

  //
  @observable
  ObservableFuture<List<AtendimentoServicoModel>> _servicoFuture;

  @computed
  StoreState get servicoState => StoreUtils.statusCheck(_servicoFuture);

  @observable
  ObservableList<AtendimentoServicoModel> atendimentosServico;

  //Calendar
  @observable
  ObservableFuture<List<AtendimentoServicoModel>> _servicoCalendarFuture;

  @computed
  StoreState get servicoCalendarState =>
      StoreUtils.statusCheck(_servicoCalendarFuture);

  @observable
  ObservableList<AtendimentoServicoModel> atendimentosServicoCalendar;

  @observable
  String filter = '';

  @action
  setFilter(String value) => filter = value;

  @observable
  String filterInfo = '';

  @action
  setFilterInfo(String value) => filterInfo = value;

  @observable
  ObservableFuture<List<String>> _tagsFuture;

  @computed
  StoreState get tagsState => StoreUtils.statusCheck(_tagsFuture);

  @observable
  ObservableList<String> tagsModel;

  @observable
  ObservableList<String> tagsToSave;

  @observable
  String tags;

  @observable
  int clienteEscolhidoId = 0;
  @observable
  String clienteEscolhidoNome = "Atender quem?";

  @observable
  int clienteObjetoEscolhidoId = 0;
  @observable
  String clienteObjetoEscolhidoNome = "";

  @observable
  String descricaoServico;

  final DateFormat formatter = DateFormat('dd/MM/yyyy HH:mm');

  @observable
  String iniciarData = "Iniciar quando?";
  DateTime iniciarDatabase;

  @observable
  String finalizarData = "Finalizar quando?";
  DateTime finalizarDatabase;

  @observable
  // double valor;
  String valor;
  @observable
  double valorToSave;

  @observable
  String observacao;

  @observable
  List<ProdutoModel> produtosEscolhidos;

  @observable
  ObservableFuture<List<ProdutoModel>> _produtosEscolhidosFuture;

  @computed
  StoreState get produtosEscolhidosState =>
      StoreUtils.statusCheck(_produtosEscolhidosFuture);

  @observable
  double produtosDoServicoValorTotal;

  @observable
  List<AtendimentoServicoItemModel> produtosDoServico;

  @observable
  ObservableFuture<List<AtendimentoServicoItemModel>> _produtosDoServicoFuture;

  @computed
  StoreState get produtosDoServicoState =>
      StoreUtils.statusCheck(_produtosDoServicoFuture);

  //
  //
  //
  @observable
  double faturamentoDoServicoValorTotal;

  @observable
  List<MovimentacaoFaturamentoModel> faturamentoDoServico;

  @observable
  ObservableFuture<List<MovimentacaoFaturamentoModel>>
      _faturamentoDoServicoFuture;

  @computed
  StoreState get faturamentoDoServicoState =>
      StoreUtils.statusCheck(_faturamentoDoServicoFuture);
  //
  //
  //

  @observable
  ClienteVeiculoModel clienteVeiculo;

  @observable
  ObservableFuture<ClienteVeiculoModel> _clienteVeiculoFuture;

  @computed
  StoreState get clienteVeiculoState =>
      StoreUtils.statusCheck(_clienteVeiculoFuture);

  @observable
  ClientePetModel clientePet;

  @observable
  ObservableFuture<ClientePetModel> _clientePetFuture;

  @computed
  StoreState get clientePetState => StoreUtils.statusCheck(_clientePetFuture);

  @observable
  List<AtendimentoServicoInfoModel> atendimentoServicoInfo;

  @observable
  ObservableFuture<List<AtendimentoServicoInfoModel>>
      _atendimentoServicoInfoFuture;

  @computed
  StoreState get atendimentoServicoInfoState =>
      StoreUtils.statusCheck(_atendimentoServicoInfoFuture);

  var controllerMaskValor = new MoneyMaskedTextController(
      decimalSeparator: ',', thousandSeparator: '.');

  @action
  changeObservacao(String observacaoValue) => observacao = observacaoValue;
  // @action
  // changeValor(double valorValue) => valorToSave = valorValue;
  // changeValor(String valorValue) => valor = valorValue;

  @action
  changeDescricaoServico(String descricaoServicoValue) =>
      descricaoServico = descricaoServicoValue;

  @observable
  int qtdeParcelas;

  @action
  changeQtdeParcelas(int qtdeParcelas) {
    this.qtdeParcelas = qtdeParcelas;
  }

  @action
  Future<void> removerProdutoDoServicoSendoCriado(
      AtendimentoServicoItemModel item) async {
    produtosEscolhidos
        .removeWhere((w) => w.id == item.itemAtendimentoServicoId);
    await obterValorProdutosEscolhidos();
    _produtosEscolhidosFuture =
        ObservableFuture(retornaProdutosEscolhidos(produtosEscolhidos));
  }

  @action
  Future<void> gravarObservacaoProdutoNoAtendimento(
      String observacao,
      int produtoId,
      int atendimentoServicoId,
      int itemAtendimentoServicoId) async {
    final servicoRepository = new AtendimentoServicoRepository();
    await servicoRepository.gravarObservacaoProdutoNoAtendimento(
        observacao, produtoId, atendimentoServicoId, itemAtendimentoServicoId);
  }

  @action
  Future<void> removerProdutoDoServicoAposCriado(
      AtendimentoServicoItemModel item) async {
    final servicoRepository = new AtendimentoServicoRepository();
    await servicoRepository
        .apagarAtendimentoServicoProduto(item.itemAtendimentoServicoId);
    await servicoRepository.gravarAtendimentoServicoInfo(
        'ins',
        'Produto removido',
        '',
        '${item.produtoNome} / ${item.produtoDescricao}',
        item.atendimentoServicoId,
        null);
    await obterValorProdutosEscolhidos();
    _produtosEscolhidosFuture =
        ObservableFuture(retornaProdutosEscolhidos(produtosEscolhidos));
  }

  @observable
  ObservableFuture<RespostaModel> _qtdeAtendimentosAtivosFuture;

  @computed
  StoreState get qtdeAtendimentosAtivosState =>
      StoreUtils.statusCheck(_qtdeAtendimentosAtivosFuture);

  @observable
  String qtdeAtendimentosAtivos;

  @observable
  ObservableFuture<RespostaModel> _qtdeAtendimentosIniciarFuture;

  @computed
  StoreState get qtdeAtendimentosIniciarState =>
      StoreUtils.statusCheck(_qtdeAtendimentosIniciarFuture);

  @observable
  String qtdeAtendimentosIniciar;

  @observable
  ObservableFuture<RespostaModel> _qtdeAtendimentosIniciadosFuture;

  @computed
  StoreState get qtdeAtendimentosIniciadosState =>
      StoreUtils.statusCheck(_qtdeAtendimentosIniciadosFuture);

  @observable
  String qtdeAtendimentosIniciados;

  @observable
  ObservableFuture<RespostaModel> _qtdeAtendimentosFinalizarFuture;

  @computed
  StoreState get qtdeAtendimentosFinalizarState =>
      StoreUtils.statusCheck(_qtdeAtendimentosFinalizarFuture);

  @observable
  String qtdeAtendimentosFinalizar;

  @observable
  ObservableFuture<RespostaModel> _qtdeAtendimentosFinalizadosFuture;

  @computed
  StoreState get qtdeAtendimentosFinalizadosState =>
      StoreUtils.statusCheck(_qtdeAtendimentosFinalizadosFuture);

  @observable
  String qtdeAtendimentosFinalizados;

  @observable
  ObservableFuture<RespostaModel> _qtdeAtendimentosArquivadosFuture;

  @computed
  StoreState get qtdeAtendimentosArquivadosState =>
      StoreUtils.statusCheck(_qtdeAtendimentosArquivadosFuture);

  @observable
  String qtdeAtendimentosArquivados;

  Future<void> obterValorProdutosEscolhidos() async {
    double valorCalc = 0;
    final nF = new NumberFormat("#,###,##0.00", "pt_BR");
    for (var produto in produtosEscolhidos) {
      valorCalc += produto.preco;
    }
    // valor = valorCalc.toString();
    controllerMaskValor.value =
        new TextEditingValue(text: nF.format(valorCalc));
  }

  // void atualizarValor() {
  //   // if (valorToSave < valor && observacao.trim().length == 0) {
  //   //   observacao = "Desconto aplicado.";
  //   // }
  //   valor = valorToSave;
  // }

  bool confereInicialOK() {
    var objeto = 'o objeto';
    final controllerPrincipal = GetIt.I.get<PrincipalController>();
    switch (controllerPrincipal.sistemaRef) {
      case 'refOficinaCarros':
        objeto = 'o Veículo';
        break;
      case 'refPetShop':
        objeto = 'o Pet';
        break;
      default:
    }
    if (clienteEscolhidoId == 0) {
      SnackBarUtils.showSnackBar(
          'Atender quem?', 'Escolha o Cliente a ser atendido.');
      return false;
    } else if (clienteObjetoEscolhidoId == 0 &&
        clienteObjetoEscolhidoNome.length > 0) {
      SnackBarUtils.showSnackBar(
          'Faltou $objeto!', 'Escolha $objeto a ser atendido.');
      return false;
    } else if (descricaoServico == null) {
      SnackBarUtils.showSnackBar(
          'Qual Descrição?', 'Informe a Descrição do atendimento.');
      return false;
    } else if (descricaoServico.trim().length == 0) {
      SnackBarUtils.showSnackBar('Então...',
          'Você realmente precisa informar a Descrição do atendimento.');
      return false;
    } else if (iniciarDatabase == null) {
      SnackBarUtils.showSnackBar('Quando o atendimento inicia?',
          'Informe a previsão de quando o atendimento vai iniciar.');
      return false;
      // } else if (iniciarDatabase.isBefore(DateTime.now())) {
      //   SnackBarUtils.showSnackBar('Iniciar no Passado?',
      //       'O início do atendimento deve ser no futuro, certo?');
      //   return false;
    } else if (finalizarDatabase == null) {
      SnackBarUtils.showSnackBar('Quando o atendimento deve finalizar?',
          'Informe a precisão de quando o atendimento vai finalizar.');
      return false;
      // } else if (finalizarDatabase.isBefore(DateTime.now())) {
      //   SnackBarUtils.showSnackBar(
      //       'Finalizar no Passado?', 'A Finalização deve ser no futuro, certo?');
      //   return false;
    } else if (finalizarDatabase.isBefore(iniciarDatabase)) {
      SnackBarUtils.showSnackBar('Finalizar antes de iniciar?',
          'Informe a previsão de início antes da previsão de término do atendimento.');
      return false;
    } else if (produtosEscolhidos.length == 0) {
      SnackBarUtils.showSnackBar(
          'Quais Produtos?', 'Escolha ao menos um Produto para a atendimento.');
      return false;
    } else if (controllerMaskValor.numberValue < 0.00) {
      SnackBarUtils.showSnackBar('Custo negativo?',
          'Gratuito pode, mas não pode cobrar um valor negativo pelo atendimento.');
      return false;
    }

    return true;
  }

  Future<void> criarAtendimento(String operacao) async {
    try {
      if (!confereInicialOK()) return;
      final usuarioRepository = new UsuarioRepository();
      final servicoRepository = new AtendimentoServicoRepository();
      final login = await usuarioRepository.getLogin();
      final usuario = await usuarioRepository.consultarUsuarioLogado(login);

      Map<String, dynamic> _produtosEscolhidos = new Map();
      _produtosEscolhidos['produtosEscolhidos'] =
          produtosEscolhidos.map((produto) {
        Map<String, dynamic> item = new Map<String, dynamic>();
        item["produtoId"] = produto.id;
        item["descricao"] = produto.nome;
        item["qtde"] = 1;
        item["observacao"] = ''; //produto.descricao;
        return item;
      }).toList();
      ObservableFuture(servicoRepository.criarAtendimento(
          operacao,
          descricaoServico,
          iniciarDatabase,
          finalizarDatabase,
          controllerMaskValor.numberValue,
          observacao,
          tags,
          'S',
          usuario.id,
          clienteEscolhidoId,
          clienteObjetoEscolhidoId,
          _produtosEscolhidos,
          null));
      SnackBarUtils.showSnackBar('Pronto!', 'Atendimento criado com sucesso!');
      Get.back();
    } catch (e) {
      errorMessage = 'Erro ao gravar o Serviço';
      print(e);
    }
  }

  Future<List<ProdutoModel>> retornaProdutosEscolhidos(
      List<ProdutoModel> removido) async {
    return removido;
  }

  @action
  Future<void> consultarProdutoDoServico() async {
    _produtosEscolhidosFuture =
        ObservableFuture(retornaProdutosEscolhidos(produtosEscolhidos));
  }

  Future<void> consultarProdutosDoServico(int atendimentoServicoId) async {
    final servicoRepository = new AtendimentoServicoRepository();
    _produtosDoServicoFuture = ObservableFuture(
        servicoRepository.consultarProdutosDoServico(atendimentoServicoId));
    List<AtendimentoServicoItemModel> produtosResultado =
        await _produtosDoServicoFuture;
    produtosDoServico = produtosResultado.asObservable();
    // Totaliza o valor de todos os produtos para exibir na tela do resumo
    produtosDoServicoValorTotal = 0.0;
    for (var item in produtosDoServico) {
      produtosDoServicoValorTotal += item.produtoPreco;
    }
    //
  }

  Future<void> consultarFaturamentoDoServico(int atendimentoServicoId) async {
    final servicoRepository = new AtendimentoServicoRepository();
    _faturamentoDoServicoFuture = ObservableFuture(servicoRepository
        .consultarFaturamentoDoServico('atendimento', atendimentoServicoId));
    List<MovimentacaoFaturamentoModel> faturamentoResultado =
        await _faturamentoDoServicoFuture;
    faturamentoDoServico = faturamentoResultado.asObservable();
    // Totaliza o valor de todas as parcelas para exibir na tela do resumo
    faturamentoDoServicoValorTotal = 0.0;
    for (var item in faturamentoDoServico) {
      faturamentoDoServicoValorTotal += item.valor;
    }
    //
  }

  Future<void> consultarClienteVeiculo(int id) async {
    final servicoRepository = new AtendimentoServicoRepository();
    _clienteVeiculoFuture =
        ObservableFuture(servicoRepository.consultarClienteVeiculo(id));
    ClienteVeiculoModel resultado = await _clienteVeiculoFuture;
    clienteVeiculo = resultado;
  }

  Future<void> consultarClientePet(int id) async {
    final servicoRepository = new AtendimentoServicoRepository();
    _clientePetFuture =
        ObservableFuture(servicoRepository.consultarClientePet(id));
    ClientePetModel resultado = await _clientePetFuture;
    clientePet = resultado;
  }

  Future<void> consultarAtendimentoServicoInfo(int atendimentoServicoId) async {
    final servicoRepository = new AtendimentoServicoRepository();
    _atendimentoServicoInfoFuture = ObservableFuture(servicoRepository
        .consultarAtendimentoServicoInfo(atendimentoServicoId));
    List<AtendimentoServicoInfoModel> resultado =
        await _atendimentoServicoInfoFuture;
    atendimentoServicoInfo = resultado;
  }

  void setIniciar(DateTime data, TimeOfDay hora) {
    data = new DateTime(
      data.year,
      data.month,
      data.day,
      hora.hour,
      hora.minute,
    );
    iniciarData = "Iniciar: " +
        formatter.format(data) +
        DateFormat("\nEEEE", "pt_BR").format(data);
    iniciarDatabase = data;
  }

  void setFinalizar(DateTime data, TimeOfDay hora) {
    data = new DateTime(
      data.year,
      data.month,
      data.day,
      hora.hour,
      hora.minute,
    );
    finalizarData = "Finalizar: " +
        formatter.format(data) +
        DateFormat("\nEEEE", "pt_BR").format(data);
    finalizarDatabase = data;
  }

  Future<void> inicio(
      AtendimentoServicoModel item, DateTime data, TimeOfDay hora) async {
    data = new DateTime(
      data.year,
      data.month,
      data.day,
      hora.hour,
      hora.minute,
    );
    final servicoRepository = new AtendimentoServicoRepository();
    final usuarioRepository = new UsuarioRepository();
    final login = await usuarioRepository.getLogin();
    final usuario = await usuarioRepository.consultarUsuarioLogado(login);
    await servicoRepository.inicio(usuario.id, item.id, data);
    var dataFormatada = new DateFormat("dd/MM/yyyy HH:mm").format(data);
    servicoRepository.gravarAtendimentoServicoInfo(
        'ins',
        'Início do Atendimento Alterado',
        '',
        '${item.iniciar} | $dataFormatada',
        item.id,
        null);
  }

  Future<void> iniciar(
      AtendimentoServicoModel item, DateTime data, TimeOfDay hora) async {
    data = new DateTime(
      data.year,
      data.month,
      data.day,
      hora.hour,
      hora.minute,
    );
    final servicoRepository = new AtendimentoServicoRepository();
    final usuarioRepository = new UsuarioRepository();
    final login = await usuarioRepository.getLogin();
    final usuario = await usuarioRepository.consultarUsuarioLogado(login);
    await servicoRepository.iniciar(usuario.id, item.id, data);
    var dataFormatada = new DateFormat("dd/MM/yyyy HH:mm").format(data);
    servicoRepository.gravarAtendimentoServicoInfo(
        'ins',
        'Início do Atendimento',
        '',
        '${item.iniciar} | $dataFormatada',
        item.id,
        null);
  }

  Future<void> finalizar(
      AtendimentoServicoModel item, DateTime data, TimeOfDay hora) async {
    data = new DateTime(
      data.year,
      data.month,
      data.day,
      hora.hour,
      hora.minute,
    );
    final servicoRepository = new AtendimentoServicoRepository();
    final usuarioRepository = new UsuarioRepository();
    final login = await usuarioRepository.getLogin();
    final usuario = await usuarioRepository.consultarUsuarioLogado(login);
    servicoRepository.finalizar(usuario.id, item.id, data);
    var dataFormatada = new DateFormat("dd/MM/yyyy HH:mm").format(data);
    servicoRepository.gravarAtendimentoServicoInfo(
        'ins',
        'Final do Atendimento',
        '',
        '${item.finalizar} | $dataFormatada',
        item.id,
        null);
  }

  Future<void> arquivar(int item) async {
    final servicoRepository = new AtendimentoServicoRepository();
    final usuarioRepository = new UsuarioRepository();
    final login = await usuarioRepository.getLogin();
    final usuario = await usuarioRepository.consultarUsuarioLogado(login);
    servicoRepository.arquivar(usuario.id, item);
  }

  Future<void> cancelar(int item) async {
    final servicoRepository = new AtendimentoServicoRepository();
    servicoRepository.cancelar(item);
  }

  Future<void> faturar(AtendimentoServicoModel item) async {
    final controller = Modular.get<FaturarAtendimentoController>();
    Get.dialog(AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      title: Text('Faturar Atendimento'),
      content: FaturarAtendimentoWidget(item: item),
      actions: <Widget>[
        FlatButton(
          onPressed: () => Get.back(result: false),
          child: const Text("CANCELAR"),
        ),
        FlatButton(
          onPressed: () => controller.faturar(item),
          child: const Text("FATURAR"),
        ),
      ],
    ));
  }

  @computed
  List<AtendimentoServicoModel> get listFiltered {
    if (filter.isEmpty) {
      return atendimentosServico;
    } else {
      return (atendimentosServico
                  .where((w) => w.descricao.contains(filter))
                  .toList() +
              atendimentosServico
                  .where((w) => w.observacao.contains(filter))
                  .toList() +
              atendimentosServico
                  .where((w) => w.tags.contains(filter))
                  .toList() +
              atendimentosServico
                  .where((w) => w.clienteNome.contains(filter))
                  .toList() +
              atendimentosServico
                  .where((w) => w.usuarioPessoa.contains(filter))
                  .toList())
          .toSet()
          .toList();
    }
  }

  @computed
  List<AtendimentoServicoInfoModel> get listFilteredInfo {
    if (filterInfo.isEmpty) {
      return atendimentoServicoInfo;
    } else {
      return (atendimentoServicoInfo
                  .where((w) => w.descricao.contains(filterInfo))
                  .toList() +
              atendimentoServicoInfo
                  .where((w) => w.observacao.contains(filterInfo))
                  .toList() +
              atendimentoServicoInfo
                  .where((w) => w.tags.contains(filterInfo))
                  .toList() +
              atendimentoServicoInfo
                  .where((w) => w.usuarioPessoa.contains(filterInfo))
                  .toList())
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
  Future<void> obterUltimosServicosDaEmpresaParaTela() async {
    try {
      final usuarioRepository = new UsuarioRepository();
      final servicoRepository = new AtendimentoServicoRepository();
      final usuarioLogado = usuarioRepository.getLogin();
      _servicoFuture = ObservableFuture(
          servicoRepository.obterUltimosServicosDaEmpresaParaTela(
              usuarioLogado, null, 'string', ''));
      List<AtendimentoServicoModel> servicoResultado = await _servicoFuture;
      atendimentosServico = servicoResultado.asObservable();
      await obterQtdeServicos('ativos');
      await obterQtdeServicos('iniciar');
      await obterQtdeServicos('iniciados');
      await obterQtdeServicos('finalizar');
      await obterQtdeServicos('finalizados');
      await obterQtdeServicos('arquivados');
    } catch (e) {
      errorMessage = 'Erro ao buscar os Atendimentos';
      print(e);
    }
  }

  Future<void> montaDadosParaAgenda() async {
    events = {};
    holidays = {};

    Map<DateTime, List> _event = {};
    Map<DateTime, List> _holiday = {};

    Map<String, int> _atendimentosServico = {};

    for (var item in atendimentosServico
        .where((w) => w.iniciado != null)
        .where((w) => w.finalizado == null)
        .where((w) => w.ativo == 'S')) {
      final key = item.iniciado.split(' ')[0];
      if (!_atendimentosServico.containsKey(key)) {
        _atendimentosServico.addAll({key: 1});
      } else {
        var value =
            _atendimentosServico.entries.where((w) => w.key == key).first.value;
        var _value = value + 1;
        _atendimentosServico.update(key, (_) => _value);
      }
    }
    for (var item in _atendimentosServico.keys) {
      final qtde =
          _atendimentosServico.entries.where((w) => w.key == item).first.value;
      var quando = DateFormat('dd/MM/yyyy').parse(item);
      if (!events.containsKey(quando)) {
        _event = {
          quando: [qtde.toString()]
        };
        if (qtde > 0) events.addAll(_event);
      }
    }

    _atendimentosServico = {};

    for (var item in atendimentosServico
        .where((w) => w.finalizado != null)
        .where((w) => w.ativo == 'S')) {
      final key = item.finalizado.split(' ')[0];
      if (!_atendimentosServico.containsKey(key)) {
        _atendimentosServico.addAll({key: 1});
      } else {
        var value =
            _atendimentosServico.entries.where((w) => w.key == key).first.value;
        var _value = value + 1;
        _atendimentosServico.update(key, (_) => _value);
      }
    }
    for (var item in _atendimentosServico.keys) {
      final qtde =
          _atendimentosServico.entries.where((w) => w.key == item).first.value;
      var quando = DateFormat('dd/MM/yyyy').parse(item);
      if (!holidays.containsKey(quando)) {
        _holiday = {
          quando: [qtde.toString()]
        };
        if (qtde > 0) holidays.addAll(_holiday);
      }
    }

    // for (var item in atendimentosServico.where((w) => w.iniciado != null)) {
    //   final qtde = atendimentosServico
    //       .where((w) => w.ativo == 'S')
    //       .where((w) => w.iniciado == item.iniciado.split(' ')[0])
    //       .length;
    //   var quando = DateFormat('dd/MM/yyyy').parse(item.iniciado);
    //   if (!events.containsKey(quando)) {
    //     // var qtde = atendimentosServico
    //     //     .where((w) => w.iniciado == item.iniciado)
    //     //     .where((w) => w.ativo == 'S')
    //     //     .toList()
    //     //     .length;
    //     _event = {
    //       quando: [qtde.toString()]
    //     };
    //     if (qtde > 0) events.addAll(_event);
    //   }
    // }

    // Map<DateTime, List> _holiday = {};
    // for (var item in atendimentosServico.where((w) => w.finalizado != null)) {
    //   var quando = DateFormat('dd/MM/yyyy').parse(item.finalizado);
    //   if (!holidays.containsKey(quando)) {
    //     var qtde = atendimentosServico
    //         .where((w) => w.finalizado == item.finalizado)
    //         .where((w) => w.ativo == 'S')
    //         .toList()
    //         .length;
    //     _holiday = {
    //       quando: [qtde.toString()]
    //     };
    //     if (qtde > 0) holidays.addAll(_holiday);
    //   }
    // }
  }

  // @action
  // Future<void> obterSistemaUsuarioLogado() async {
  //   final controllerPrincipal = GetIt.I.get<PrincipalController>();
  //   return controllerPrincipal.sistemaRef;
  //   //new UsuarioRepository();
  //   // sistemaRef = await usuarioRepository
  //   //     .obterDadosDoSistemaEscolhidoPeloUsuario(
  //   //         await usuarioRepository.getLogin())
  //   //     .then((res) => res.sistemaRef);
  // }

  List tagStringParaTagsList(String tags) {
    var listSplit = tags != null ? tags.split('|') : new List();
    var listRet = new List<Item>();
    for (var item in listSplit) {
      if (item != "") listRet.add(Item(title: item));
    }
    return listRet;
  }

  tagsListParaTagString(List tagsParam) {
    tags = "";
    for (var tag in tagsParam) {
      if (tags.length > 0) tags += "|";
      tags += tag.title;
    }
  }

  @action
  Future<void> obterQtdeServicos(String ref) async {
    try {
      final servicoRepository = new AtendimentoServicoRepository();
      switch (ref) {
        case 'ativos':
          _qtdeAtendimentosAtivosFuture =
              ObservableFuture(servicoRepository.obterQtdeServicos(ref));
          RespostaModel servicoResultado = await _qtdeAtendimentosAtivosFuture;
          qtdeAtendimentosAtivos = servicoResultado.resposta;
          break;
        case 'iniciar':
          _qtdeAtendimentosIniciarFuture =
              ObservableFuture(servicoRepository.obterQtdeServicos(ref));
          RespostaModel servicoResultado = await _qtdeAtendimentosIniciarFuture;
          qtdeAtendimentosIniciar = servicoResultado.resposta;
          break;
        case 'iniciados':
          _qtdeAtendimentosIniciadosFuture =
              ObservableFuture(servicoRepository.obterQtdeServicos(ref));
          RespostaModel servicoResultado =
              await _qtdeAtendimentosIniciadosFuture;
          qtdeAtendimentosIniciados = servicoResultado.resposta;
          break;
        case 'finalizar':
          _qtdeAtendimentosFinalizarFuture =
              ObservableFuture(servicoRepository.obterQtdeServicos(ref));
          RespostaModel servicoResultado =
              await _qtdeAtendimentosFinalizarFuture;
          qtdeAtendimentosFinalizar = servicoResultado.resposta;
          break;
        case 'finalizados':
          _qtdeAtendimentosFinalizadosFuture =
              ObservableFuture(servicoRepository.obterQtdeServicos(ref));
          RespostaModel servicoResultado =
              await _qtdeAtendimentosFinalizadosFuture;
          qtdeAtendimentosFinalizados = servicoResultado.resposta;
          break;
        case 'arquivados':
          _qtdeAtendimentosArquivadosFuture =
              ObservableFuture(servicoRepository.obterQtdeServicos(ref));
          RespostaModel servicoResultado =
              await _qtdeAtendimentosArquivadosFuture;
          qtdeAtendimentosArquivados = servicoResultado.resposta;
          break;
        default:
      }
    } catch (e) {
      errorMessage = 'Erro ao buscar Qtdes dos Serviços';
      print(e);
    }
  }

  @action
  Future<void> obterServicos(String ref, String opc, String quando) async {
    try {
      switch (opc) {
        case 'string':
          setFilter('');
          final usuarioRepository = new UsuarioRepository();
          final servicoRepository = new AtendimentoServicoRepository();
          final usuarioLogado = usuarioRepository.getLogin();
          _servicoFuture = ObservableFuture(
              servicoRepository.obterUltimosServicosDaEmpresaParaTela(
                  usuarioLogado, ref, opc, quando));
          List<AtendimentoServicoModel> servicoResultado = await _servicoFuture;
          atendimentosServico = servicoResultado.asObservable();

          break;
        case 'date':
          final usuarioRepository = new UsuarioRepository();
          final servicoRepository = new AtendimentoServicoRepository();
          final usuarioLogado = usuarioRepository.getLogin();
          _servicoCalendarFuture = ObservableFuture(
              servicoRepository.obterUltimosServicosDaEmpresaParaTela(
                  usuarioLogado, ref, opc, quando));
          List<AtendimentoServicoModel> servicoResultado =
              await _servicoCalendarFuture;
          atendimentosServicoCalendar = servicoResultado.asObservable();
          // for (var item in atendimentosServicoCalendar) {
          //   if (item.iniciado == null) {
          //     atendimentosServicoCalendar
          //         .where((w) => w.id == item.id)
          //         .map((f) => f.horario = item.iniciar.split(' ')[0]);
          //   } else if (item.iniciado != null && item.finalizado == null) {
          //     atendimentosServicoCalendar
          //         .where((w) => w.id == item.id)
          //         .map((f) => f.horario = item.iniciado.split(' ')[0]);
          //   } else if (item.finalizado != null && item.ativo == 'S') {
          //     atendimentosServicoCalendar
          //         .where((w) => w.id == item.id)
          //         .map((f) => f.horario = item.finalizado.split(' ')[0]);
          //   }
          // }
          break;
        default:
      }
    } catch (e) {
      errorMessage = 'Erro ao buscar os Atendimentos';
      print(e);
    }
  }

  void escolherProdutos() {
    Get.toNamed('/escolher_produto');
  }

  Future<void> inserirProdutoNoServico(
      ProdutoModel item, int atendimentoServicoId) async {
    final servicoRepository = new AtendimentoServicoRepository();
    await servicoRepository.inserirProdutoNoServico(item, atendimentoServicoId);
    await servicoRepository.gravarAtendimentoServicoInfo(
        'ins',
        'Produto adicionado',
        '',
        '${item.nome} / ${item.descricao}',
        atendimentoServicoId,
        null);
  }

  definirNomeBotaoObjeto() {
    final controllerPrincipal = GetIt.I.get<PrincipalController>();
    switch (controllerPrincipal.sistemaRef) {
      case 'refOficinaCarros':
        clienteObjetoEscolhidoNome = 'Escolha o Veículo';
        break;
      case 'refPetShop':
        clienteObjetoEscolhidoNome = 'Escolha o Pet';
        break;
      case 'refClinicaVeterinaria':
        clienteObjetoEscolhidoNome = 'Escolha o Pet';
        break;
      default:
    }
  }
}
