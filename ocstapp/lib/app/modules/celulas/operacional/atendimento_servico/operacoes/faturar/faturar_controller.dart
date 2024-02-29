import 'package:OCSTApp/app/models/atendimento_servico_model.dart';
import 'package:OCSTApp/app/modules/celulas/operacional/atendimento_servico/info/atendimento_servico_info_dialog.dart';
import 'package:OCSTApp/app/modules/celulas/operacional/atendimento_servico/operacoes/cadastro/cadastro_page.dart';
import 'package:OCSTApp/app/repositories/atendimento_servico_repository.dart';
import 'package:OCSTApp/app/repositories/usuario_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:OCSTApp/app/core/store_state.dart';
import 'package:OCSTApp/app/models/categoria_model.dart';
import 'package:OCSTApp/app/repositories/categorias_repository.dart';
import 'package:OCSTApp/app/repositories/movimentacoes_repository.dart';
import 'package:OCSTApp/app/utils/store_utils.dart';

part 'faturar_controller.g.dart';

class FaturarAtendimentoController = _FaturarAtendimentoControllerBase
    with _$FaturarAtendimentoController;

abstract class _FaturarAtendimentoControllerBase with Store {
  final formKey = GlobalKey<FormState>();
  final moneyController =
      MoneyMaskedTextController(decimalSeparator: ',', thousandSeparator: '.');

  @observable
  String qtdeParcelas;

  @action
  void changeQtdeParcelas(String qtdeParcelas) {
    this.qtdeParcelas = qtdeParcelas;
  }

  @action
  void changeDescricao(String descricao) {
    this.descricao = descricao;
  }

  @observable
  int idAtendimentoServico;
  @observable
  int idCategoria;

  @observable
  DateTime dataInicial = DateTime.now();

  @observable
  String errorMessage;
  @observable
  String descricao;
  @observable
  double valor;
  @observable
  String tags;

  @action
  void changeValor(double valor) {
    this.valor = valor;
  }

  @action
  void setDataInclusao(DateTime data, TimeOfDay hora) {
    data = new DateTime(
      data.year,
      data.month,
      data.day,
      hora.hour,
      hora.minute,
    );
    dataInicial = data;
  }

  @observable
  ObservableFuture<List<CategoriaModel>> _categoriasFuture;

  @computed
  StoreState get categoriasStatus => StoreUtils.statusCheck(_categoriasFuture);

  // @action
  // Future<void> buscarCategorias(String tipo) async {
  //   try {
  //     tipoSelecionado = tipo;
  //     _categoriasFuture =
  //         ObservableFuture(_categoriaRepository.getCategorias(tipo));
  //     List<CategoriaModel> categoriasModel = await _categoriasFuture;
  //     this.categorias = categoriasModel;
  //   } catch (e) {
  //     errorMessage = 'Erro ao buscar categorias';
  //     print(e);
  //   }
  // }

  @observable
  ObservableFuture _faturarFuture;

  @computed
  StoreState get faturarStatus => StoreUtils.statusCheck(_faturarFuture);

  // @action
  // prepareForm() {
  //   changeCategoria(null);
  //   changeDescricao('');
  //   moneyController.text = '';
  //   categoriaValid = true;
  // }

  Future<void> faturar(AtendimentoServicoModel item) async {
    final nF = new NumberFormat("#,###,##0.00", "pt_BR");
    if (formKey.currentState.validate()) {
      try {
        final usuarioRepository = UsuarioRepository();
        final login = await usuarioRepository.getLogin();
        final usuario = await usuarioRepository.consultarUsuarioLogado(login);

        final movimentacaoRepository = MovimentacoesRepository();
        _faturarFuture = ObservableFuture(
          movimentacaoRepository.faturar(
            usuario.id,
            item.id,
            idCategoria,
            qtdeParcelas,
            descricao,
            moneyController.numberValue,
            dataInicial,
            tags,
          ),
        );
        await _faturarFuture;

        final atendimentoServicoRepository = AtendimentoServicoRepository();
        atendimentoServicoRepository.gravarAtendimentoServicoInfo(
          'ins',
          'Atendimento Faturado',
          tags,
          '${item.descricao} iniciar ${DateFormat('dd/MM/yyyy HH:mm').format(dataInicial)} R\$${nF.format(moneyController.numberValue)} em $qtdeParcelas parcelas',
          item.id,
          null,
        );
        Get.back(result: false);
        atendimentoServicoController.obterUltimosServicosDaEmpresaParaTela();
        await atendimentoServicoController.montaDadosParaAgenda();
        await atendimentoServicoController.obterServicos(
            'tudo',
            'date',
            DateFormat('yyyy-MM-dd')
                .format(atendimentoServicoController.selectedDay));
      } catch (e) {
        print(e);
      }
    }
  }
}
