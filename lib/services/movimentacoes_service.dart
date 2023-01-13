import 'package:ocstapi/controllers/movimentacoes/dto/apagar_movimentacao_request.dart';
import 'package:ocstapi/controllers/movimentacoes/dto/apagar_parcelas_movimentacao_request.dart';
import 'package:ocstapi/controllers/movimentacoes/dto/efetivar_movimentacao_request.dart';
import 'package:ocstapi/controllers/movimentacoes/dto/faturar_movimentacao_request.dart';
import 'package:ocstapi/controllers/movimentacoes/dto/salvar_movimentacao_request.dart';
import 'package:ocstapi/model/atendimento_servico_model.dart';
import 'package:ocstapi/model/categoria_model.dart';
import 'package:ocstapi/model/movimentacao_model.dart';
import 'package:ocstapi/model/usuario_model.dart';
import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/repository/atendimento_servico_repository.dart';
import 'package:ocstapi/repository/movimentacoes_repository.dart';
import 'package:ocstapi/services/atendimento_servico_service.dart';

class MovimentacoesService {
  MovimentacoesService(this.context)
      : repository = MovimentacoesRepository(context);
  final ManagedContext context;
  final MovimentacoesRepository repository;

  Future<List<MovimentacaoModel>> buscarMovimentacoesPorFaturamento(
      UsuarioModel usuario, String ref, int id) async {
    return repository.buscarMovimentacoesPorFaturamento(usuario, ref, id);
  }

  Future<List<MovimentacaoModel>> buscarMovimentacoes(
      UsuarioModel usuario, String anoMes) {
    return repository.buscarMovimentacoes(usuario, anoMes);
  }

  Future<Map<String, dynamic>> recuperarTotalMovimentacaoPorTipo(
      UsuarioModel usuarioModel, String anoMes) async {
    final receitas = await repository.recuperarTotalMesAno(
        usuarioModel, TipoCategoria.receita, anoMes);
    final despesas = await repository.recuperarTotalMesAno(
        usuarioModel, TipoCategoria.despesa, anoMes);

    final receitasA = await repository.recuperarAcumulado(
        usuarioModel, TipoCategoria.receita, anoMes);
    final despesasA = await repository.recuperarAcumulado(
        usuarioModel, TipoCategoria.despesa, anoMes);

    return {
      'receitas': receitas,
      'despesas': despesas,
      'total': (receitas['total'] ?? 0) + (despesas['total'] ?? 0),
      'saldo': (receitas['total'] ?? 0) + (despesas['total'] * -1 ?? 0),
      'acumulado': (receitasA['total'] ?? 0) + (despesasA['total'] * -1 ?? 0)
    };
  }

  Future<void> salvarMovimentacao(
      UsuarioModel usuario, SalvarMovimentacaoRequest request) async {
    await repository.salvarMovimentacao(usuario, null, request);
  }

  Future<void> apagarMovimentacao(ApagarMovimentacaoRequest requestDel) async {
    await repository.apagarMovimentacao(requestDel);
  }

  Future<void> faturarMovimentacao(
      UsuarioModel usuario, FaturarMovimentacaoRequest requestFat) async {
    final parcelas = int.parse(requestFat.qtdeParcelas);
    final movimentacao = SalvarMovimentacaoRequest();

    var atendimentoServicoModel = AtendimentoServicoModel();
    if (requestFat.idAtendimentoServico != null) {
      final atendimentoServicoRepository =
          AtendimentoServicoRepository(context);
      atendimentoServicoModel = await atendimentoServicoRepository
          .obterAtendimentoServicoPorId(requestFat.idAtendimentoServico);
    } else {}
    for (var i = 0; i < parcelas; i++) {
      movimentacao.operacao = 'ins';
      movimentacao.categoria = requestFat.idCategoria;
      movimentacao.dataMovimentacao = DateTime(
          requestFat.dataInicial.year,
          requestFat.dataInicial.month + i,
          requestFat.dataInicial.day,
          requestFat.dataInicial.hour,
          requestFat.dataInicial.minute);
      movimentacao.descricao = requestFat.descricao;
      movimentacao.valor = requestFat.numberValue / parcelas;
      movimentacao.parcela =
          '${(i + 1).toString().padLeft(3, '0')}/${requestFat.qtdeParcelas.padLeft(3, '0')}';
      movimentacao.atendimentoServicoId = requestFat.idAtendimentoServico;
      movimentacao.tags = requestFat.tags;
      await repository.salvarMovimentacao(
          usuario, atendimentoServicoModel, movimentacao);
    }
  }

  Future<void> efetivarMovimentacao(
      UsuarioModel usuario, EfetivarMovimentacaoRequest request) async {
    await repository.efetivarMovimentacao(usuario, request);
  }

  Future<void> apagarParcelasMovimentacao(
      ApagarParcelasMovimentacaoRequest requestDel) async {
    await repository.apagarParcelasMovimentacao(requestDel);
  }
}
