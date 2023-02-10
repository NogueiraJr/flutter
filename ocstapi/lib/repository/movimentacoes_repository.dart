import 'package:intl/intl.dart';
import 'package:ocstapi/controllers/movimentacoes/dto/apagar_movimentacao_request.dart';
import 'package:ocstapi/controllers/movimentacoes/dto/apagar_parcelas_movimentacao_request.dart';
import 'package:ocstapi/controllers/movimentacoes/dto/efetivar_movimentacao_request.dart';
import 'package:ocstapi/controllers/movimentacoes/dto/salvar_movimentacao_request.dart';
import 'package:ocstapi/model/atendimento_servico_model.dart';
import 'package:ocstapi/model/categoria_model.dart';
import 'package:ocstapi/model/movimentacao_model.dart';
import 'package:ocstapi/model/usuario_model.dart';
import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/repository/categoria_repository.dart';
import 'package:ocstapi/repository/usuario_repository.dart';

class MovimentacoesRepository {
  MovimentacoesRepository(this.context)
      : categoriaRepository = CategoriaRepository(context),
        usuarioRepository = UsuarioRepository(context);
  final ManagedContext context;
  final CategoriaRepository categoriaRepository;
  final UsuarioRepository usuarioRepository;

  Future<List<MovimentacaoModel>> buscarMovimentacoesPorFaturamento(
      UsuarioModel usuario, String ref, int id) async {
    final usuariosEmpresa =
        await usuarioRepository.obterUsuariosDaEmpresaPorIdUsuario(usuario.id);
    switch (ref) {
      case 'atendimento':
        final query = Query<MovimentacaoModel>(context)
          ..join(object: (m) => m.categoria)
          ..join(object: (m) => m.atendimentoServico)
          ..where((m) => m.usuario.id).oneOf(usuariosEmpresa)
          ..where((m) => m.atendimentoServico.id).equalTo(id)
          ..sortBy((m) => m.dataMovimentacao, QuerySortOrder.ascending);
        return query.fetch();
        break;
      default:
        return [];
    }
  }

  Future<List<MovimentacaoModel>> buscarMovimentacoes(
      UsuarioModel usuario, String anoMes) async {
    final DateFormat format = DateFormat('yyyy-MM-dd HH:mm:ss');
    final _inicio =
        '${anoMes.substring(0, 4)}-${anoMes.substring(4)}-01 00:00:00';
    final ultimoDiaMes = DateTime(int.parse(anoMes.substring(0, 4)),
            int.parse(anoMes.substring(4)) + 1, 0)
        .day;
    final _fim =
        '${anoMes.substring(0, 4)}-${anoMes.substring(4)}-$ultimoDiaMes 23:59:59';
    final inicio = format.parse(_inicio);
    final fim = format.parse(_fim);

    final usuariosEmpresa =
        await usuarioRepository.obterUsuariosDaEmpresaPorIdUsuario(usuario.id);

    final query = Query<MovimentacaoModel>(context)
      ..join(object: (m) => m.categoria)
      ..join(object: (m) => m.atendimentoServico)
      ..where((m) => m.usuario.id).oneOf(usuariosEmpresa)
      ..where((m) => m.dataMovimentacao).between(inicio, fim)
      ..sortBy((m) => m.dataMovimentacao, QuerySortOrder.ascending)
      ..sortBy((m) => m.id, QuerySortOrder.ascending);
    return query.fetch();
  }

  Future<Map<String, dynamic>> recuperarTotalMesAno(
      UsuarioModel usuario, TipoCategoria tipoCategoria, String anoMes) async {
    final DateFormat format = DateFormat('yyyy-MM-dd HH:mm:ss');
    final _inicio =
        '${anoMes.substring(0, 4)}-${anoMes.substring(4)}-01 00:00:00';
    final ultimoDiaMes = DateTime(int.parse(anoMes.substring(0, 4)),
            int.parse(anoMes.substring(4)) + 1, 0)
        .day;
    final _fim =
        '${anoMes.substring(0, 4)}-${anoMes.substring(4)}-$ultimoDiaMes 23:59:59';
    final inicio = format.parse(_inicio);
    final fim = format.parse(_fim);

    final usuariosEmpresa =
        await usuarioRepository.obterUsuariosDaEmpresaPorIdUsuario(usuario.id);

    final query = Query<MovimentacaoModel>(context)
      ..join(object: (m) => m.categoria)
      ..where((m) => m.usuario.id).oneOf(usuariosEmpresa)
      ..where((m) => m.dataMovimentacao).between(inicio, fim)
      ..where((m) => m.categoria.tipoCategoria).equalTo(tipoCategoria);

    final List<MovimentacaoModel> resultado = await query.fetch();
    final num total = resultado.fold(0.0, (total, m) => total += m.valor);
    return {'tipo': tipoCategoria.toString(), 'total': total};
  }

  Future<Map<String, dynamic>> recuperarAcumulado(
      UsuarioModel usuario, TipoCategoria tipoCategoria, String anoMes) async {
    final DateFormat format = DateFormat('yyyy-MM-dd HH:mm:ss');
    const _inicio = '1900-01-01 00:00:00';
    final ultimoDiaMes = DateTime(int.parse(anoMes.substring(0, 4)),
            int.parse(anoMes.substring(4)) + 1, 0)
        .day;
    final _fim =
        '${anoMes.substring(0, 4)}-${anoMes.substring(4)}-$ultimoDiaMes 23:59:59';
    final inicio = format.parse(_inicio);
    final fim = format.parse(_fim);

    final usuariosEmpresa =
        await usuarioRepository.obterUsuariosDaEmpresaPorIdUsuario(usuario.id);

    final query = Query<MovimentacaoModel>(context)
      ..join(object: (m) => m.categoria)
      ..where((m) => m.usuario.id).oneOf(usuariosEmpresa)
      ..where((m) => m.dataMovimentacao).between(inicio, fim)
      ..where((m) => m.categoria.tipoCategoria).equalTo(tipoCategoria);

    final List<MovimentacaoModel> resultado = await query.fetch();
    final num total = resultado.fold(0.0, (total, m) => total += m.valor);
    return {'tipo': tipoCategoria.toString(), 'total': total};
  }

  Future<void> salvarMovimentacao(
      UsuarioModel usuario,
      AtendimentoServicoModel atendimentoServicoModel,
      SalvarMovimentacaoRequest request) async {
    try {
      final categoria =
          await categoriaRepository.buscarPorId(request.categoria);
      switch (request.operacao) {
        case 'ins':
          final qry = MovimentacaoModel();
          qry.categoria = categoria;
          qry.dataMovimentacao = request.dataMovimentacao.toLocal();
          qry.descricao = request.descricao;
          qry.usuario = usuario;
          qry.valor = request.valor;
          qry.parcela = request.parcela;
          qry.tags = request.tags;
          qry.atendimentoServico = atendimentoServicoModel;
          // qry.dataEfetivacao = request.dataEfetivacao;
          await context.insertObject(qry);
          break;
        case 'upd':
          final qry = Query<MovimentacaoModel>(context);
          qry.values.categoria = categoria;
          qry.values.dataMovimentacao = request.dataMovimentacao;
          qry.values.descricao = request.descricao;
          qry.values.usuario = usuario;
          qry.values.valor = request.valor;
          // if (request.parcela.isNotEmpty) {
          //   qry.values.parcela = request.parcela;
          // }
          // if (request.tags.isNotEmpty) {
          //   qry.values.tags = request.tags;
          // }
          // qry.values.dataEfetivacao = request.dataEfetivacao;
          qry.where((w) => w.id).equalTo(request.id);
          await qry.update();
          break;
        default:
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> apagarMovimentacao(ApagarMovimentacaoRequest requestDel) async {
    try {
      final qry = Query<MovimentacaoModel>(context);
      qry.where((w) => w.id).equalTo(requestDel.id);
      await qry.delete();
    } catch (e) {
      print(e);
    }
  }

  Future<void> efetivarMovimentacao(
      UsuarioModel usuario, EfetivarMovimentacaoRequest request) async {
    final qry = Query<MovimentacaoModel>(context);
    qry.values.dataEfetivacao = request.dataEfetivacao;
    qry.where((w) => w.id).equalTo(request.id);
    await qry.update();
  }

  Future<void> apagarParcelasMovimentacao(
      ApagarParcelasMovimentacaoRequest requestDel) async {
    try {
      final qry = Query<MovimentacaoModel>(context);
      switch (requestDel.ref) {
        case 'atendimento':
          qry.where((w) => w.atendimentoServico.id).equalTo(requestDel.id);
          await qry.delete();
          break;
        // case 'venda':
        //   qry.where((w) => w.venda.id).equalTo(requestDel.id);
        //   await qry.delete();
        //   break;
        // case 'compra':
        //   qry.where((w) => w.compra.id).equalTo(requestDel.id);
        //   await qry.delete();
        //   break;
        // case 'locacaoRoupa':
        //   qry.where((w) => w.locacaoRoupa.id).equalTo(requestDel.id);
        //   await qry.delete();
        //   break;
        default:
      }
    } catch (e) {
      print(e);
    }
  }
}
