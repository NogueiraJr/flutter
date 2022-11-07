import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:ocstapi/controllers/atendimento_servico/dto/atendimento_servico_arquivar_request.dart';
import 'package:ocstapi/controllers/atendimento_servico/dto/atendimento_servico_cancelar_request.dart';
import 'package:ocstapi/controllers/atendimento_servico/dto/atendimento_servico_finalizar_request.dart';
import 'package:ocstapi/controllers/atendimento_servico/dto/atendimento_servico_inicio_request.dart';
import 'package:ocstapi/controllers/atendimento_servico/dto/atendimento_servico_ins_request.dart';
import 'package:ocstapi/controllers/atendimento_servico/dto/atendimento_servico_iniciar_request.dart';
import 'package:ocstapi/controllers/atendimento_servico/dto/atendimento_servico_novovalor_request.dart';
import 'package:ocstapi/controllers/atendimento_servico/dto/atendimento_servico_upd_request.dart';
import 'package:ocstapi/model/atendimento_servico_info_model.dart';
import 'package:ocstapi/model/atendimento_servico_item_model.dart';
import 'package:ocstapi/model/atendimento_servico_model.dart';
import 'package:ocstapi/model/atendimento_servico_objeto_model.dart';
import 'package:ocstapi/model/cliente_model.dart';
import 'package:ocstapi/model/cliente_pet_model.dart';
import 'package:ocstapi/model/cliente_veiculo_model.dart';
import 'package:ocstapi/model/usuario_model.dart';
import 'package:ocstapi/repository/atendimento_pet_repository.dart';
import 'package:ocstapi/repository/atendimento_servico_info_repository.dart';
import 'package:ocstapi/repository/cliente_repository.dart';
import 'package:ocstapi/repository/cliente_veiculo_repository.dart';
import 'package:ocstapi/repository/produto_repository.dart';
import 'package:ocstapi/repository/usuario_repository.dart';

import '../ocstapi.dart';

class AtendimentoServicoRepository {
  AtendimentoServicoRepository(this.context)
      : usuarioRepository = UsuarioRepository(context),
        clienteRepository = ClienteRepository(context),
        clienteVeiculoRepository = ClienteVeiculoRepository(context),
        clientePetRepository = ClientePetRepository(context),
        produtoRepository = ProdutoRepository(context);
  final ManagedContext context;
  final UsuarioRepository usuarioRepository;
  final ClienteRepository clienteRepository;
  final ClienteVeiculoRepository clienteVeiculoRepository;
  final ClientePetRepository clientePetRepository;
  final ProdutoRepository produtoRepository;

  Future<AtendimentoServicoModel> obterAtendimentoServicoPorId(int id) async {
    try {
      final query = Query<AtendimentoServicoModel>(context)
        ..where((w) => w.id).equalTo(id);
      return await query.fetchOne();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<AtendimentoServicoModel>> obterAtendimentoServicoPorClienteId(
      int id) async {
    try {
      final query = Query<AtendimentoServicoModel>(context)
        ..join(object: (j) => j.cliente)
        ..join(object: (j) => j.usuario)
        ..where((w) => w.cliente.id).equalTo(id);
      return await query.fetch();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<AtendimentoServicoModel>> obterAtendimentoServicoPorUsuarioId(
      int id) async {
    try {
      final query = Query<AtendimentoServicoModel>(context)
        ..join(object: (j) => j.cliente)
        ..join(object: (j) => j.usuario)
        ..where((w) => w.usuario.id).equalTo(id)
        ..where((w) => w.ativo).equalTo('S')
        ..sortBy((s) => s.id, QuerySortOrder.descending);
      return await query.fetch();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> ins(AtendimentoServicoInsRequest request) async {
    try {
      final usuario =
          await usuarioRepository.consultarUsuarioPorId(request.usuarioId);
      final cliente =
          await clienteRepository.obterClientePorId(request.clienteId);
      final model = AtendimentoServicoModel();
      model.usuario = usuario;
      model.cliente = cliente;
      model.descricao = request.descricao ?? "";
      model.iniciar = request.iniciar;
      model.finalizar = request.finalizar;
      model.valor = request.valor;
      model.observacao = request.observacao ?? "";
      model.tags = request.tags ?? "";
      model.ativo = request.ativo ?? "S";
      final atendimentoServico =
          await context.insertObject(model).then((t) => t);
      //Registrar na Atuação o Atendimento criado
      await registarNovoAtendimentoNaAtuacao(
          atendimentoServico, usuario, cliente);
      await atendimentoServicoItensIns(
          atendimentoServico, request.atendimentoServicoItens);
      //Aqui depende do sistema ...
      final sistema =
          await usuarioRepository.obterSistemaRefPorUsuarioId(usuario.id);
      switch (sistema) {
        case 'refOficinaCarros':
          await inserirVeiculoSeHouver(request, atendimentoServico, usuario);
          break;
        case 'refPetShop':
          await inserirPetSeHouver(request, atendimentoServico, usuario);
          break;
        case 'refClinicaVeterinaria':
          await inserirPetSeHouver(request, atendimentoServico, usuario);
          break;
        default:
      }
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> inserirVeiculoSeHouver(AtendimentoServicoInsRequest request,
      AtendimentoServicoModel atendimentoServico, UsuarioModel usuario) async {
    if (request.clienteObjetoEscolhidoId != 0) {
      final clienteVeiculo = await clienteVeiculoRepository
          .obterClienteVeiculoPorId(request.clienteObjetoEscolhidoId);
      final model = AtendimentoServicoObjetoModel();
      model.descricao = "";
      model.quando = DateTime.now();
      model.tags = "";
      model.observacao = "";
      model.usuario = usuario;
      model.atendimentoServico = atendimentoServico;
      model.clienteVeiculo = clienteVeiculo;
      await context.insertObject(model).then((t) => t);
    }
  }

  Future<void> inserirPetSeHouver(AtendimentoServicoInsRequest request,
      AtendimentoServicoModel atendimentoServico, UsuarioModel usuario) async {
    if (request.clienteObjetoEscolhidoId != 0) {
      final clientePet = await clientePetRepository
          .obterClientePetPorId(request.clienteObjetoEscolhidoId);
      final model = AtendimentoServicoObjetoModel();
      model.descricao = "";
      model.quando = DateTime.now();
      model.tags = "";
      model.observacao = "";
      model.usuario = usuario;
      model.atendimentoServico = atendimentoServico;
      model.clientePet = clientePet;
      await context.insertObject(model).then((t) => t);
    }
  }

  // ignore: type_annotate_public_apis
  T cast<T>(x) => x is T ? x : null;

  Future<void> atendimentoServicoItensIns(
      AtendimentoServicoModel atendimentoServico, String itens) async {
    try {
      final map = jsonDecode(itens);
      final produtosEscolhidos = map["produtosEscolhidos"];
      final model = AtendimentoServicoItemModel();
      // ignore: prefer_foreach
      for (var produto in produtosEscolhidos) {
        model.produto = await produtoRepository
            .obterProdutoPorId(cast<int>(produto["produtoId"]));
        model.atendimentoServico =
            await obterAtendimentoServicoPorId(atendimentoServico.id);
        model.qtde = cast<int>(produto["qtde"]);
        model.observacao = cast<String>(produto["observacao"]);
        await context.insertObject(model);
      }
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<List<AtendimentoServicoItemModel>> consultarProdutosDoAtendimento(
      int id) async {
    try {
      final query = Query<AtendimentoServicoItemModel>(context)
        ..join(object: (j) => j.produto)
        ..where((w) => w.atendimentoServico.id).equalTo(id)
        ..sortBy((s) => s.id, QuerySortOrder.ascending);
      return await query.fetch();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> iniciar(AtendimentoServicoIniciarRequest request) async {
    try {
      final usuario =
          await usuarioRepository.consultarUsuarioPorId(request.usuarioId);
      final query = Query<AtendimentoServicoModel>(context)
        ..values.usuario = usuario
        ..values.iniciado = request.iniciado
        ..where((w) => w.id).equalTo(request.atendimentoServicoId);
      final ret = await query.update();
      return ret.isNotEmpty;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> finalizar(AtendimentoServicoFinalizarRequest request) async {
    try {
      final usuario =
          await usuarioRepository.consultarUsuarioPorId(request.usuarioId);
      final query = Query<AtendimentoServicoModel>(context)
        ..values.usuario = usuario
        ..values.finalizado = request.finalizado
        ..where((w) => w.id).equalTo(request.atendimentoServicoId);
      final ret = await query.update();
      return ret.isNotEmpty;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> arquivar(AtendimentoServicoArquivarRequest request) async {
    try {
      final usuario =
          await usuarioRepository.consultarUsuarioPorId(request.usuarioId);
      final query = Query<AtendimentoServicoModel>(context)
        ..values.usuario = usuario
        ..values.ativo = 'N'
        ..where((w) => w.id).equalTo(request.atendimentoServicoId);
      final ret = await query.update();
      return ret.isNotEmpty;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> cancelar(AtendimentoServicoCancelarRequest request) async {
    try {
      final query = Query<AtendimentoServicoModel>(context)
        ..where((w) => w.id).equalTo(request.atendimentoServicoId);
      final ret = await query.delete();
      return ret > 0;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<int> obterQtdes(int id, String ref) async {
    try {
      switch (ref) {
        case 'ativos':
          return await obterQtdeAtendimentosAtivas(id);
          break;
        case 'iniciar':
          return await obterQtdeAtendimentosParaIniciar(id);
          break;
        case 'finalizar':
          return await obterQtdeAtendimentosParaFinalizar(id);
          break;
        case 'finalizados':
          return await obterQtdeAtendimentosFinalizados(id);
          break;
        case 'arquivados':
          return await obterQtdeAtendimentosArquivados(id);
          break;
      }
      return 0;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<int> obterQtdeAtendimentosAtivas(int id) async {
    try {
      final usuariosEmpresa =
          await usuarioRepository.obterUsuariosDaEmpresaPorIdUsuario(id);
      final query = Query<AtendimentoServicoModel>(context)
        ..where((w) => w.usuario.id).oneOf(usuariosEmpresa)
        ..where((w) => w.ativo).equalTo('S');
      final ret = await query.fetch();
      return ret.length;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<int> obterQtdeAtendimentosParaIniciar(int id) async {
    try {
      final usuariosEmpresa =
          await usuarioRepository.obterUsuariosDaEmpresaPorIdUsuario(id);
      final query = Query<AtendimentoServicoModel>(context)
        ..where((w) => w.usuario.id).oneOf(usuariosEmpresa)
        ..where((w) => w.iniciar).isNotNull()
        ..where((w) => w.iniciado).isNull()
        ..where((w) => w.ativo).equalTo('S');
      final ret = await query.fetch();
      return ret.length;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<int> obterQtdeAtendimentosParaFinalizar(int id) async {
    try {
      final usuariosEmpresa =
          await usuarioRepository.obterUsuariosDaEmpresaPorIdUsuario(id);
      final query = Query<AtendimentoServicoModel>(context)
        ..where((w) => w.usuario.id).oneOf(usuariosEmpresa)
        ..where((w) => w.finalizar).isNotNull()
        ..where((w) => w.iniciado).isNotNull()
        ..where((w) => w.finalizado).isNull()
        ..where((w) => w.ativo).equalTo('S');
      final ret = await query.fetch();
      return ret.length;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<int> obterQtdeAtendimentosFinalizados(int id) async {
    try {
      final usuariosEmpresa =
          await usuarioRepository.obterUsuariosDaEmpresaPorIdUsuario(id);
      final query = Query<AtendimentoServicoModel>(context)
        ..where((w) => w.usuario.id).oneOf(usuariosEmpresa)
        ..where((w) => w.finalizado).isNotNull()
        ..where((w) => w.ativo).equalTo('S');
      final ret = await query.fetch();
      return ret.length;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<int> obterQtdeAtendimentosArquivados(int id) async {
    try {
      final usuariosEmpresa =
          await usuarioRepository.obterUsuariosDaEmpresaPorIdUsuario(id);
      final query = Query<AtendimentoServicoModel>(context)
        ..where((w) => w.usuario.id).oneOf(usuariosEmpresa)
        ..where((w) => w.ativo).equalTo('N');
      final ret = await query.fetch();
      return ret.length;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<AtendimentoServicoModel>>
      obterAtendimentoServicoPorUsuarioEmpresaId(
          int id, String ref, String opc, String quando) async {
    try {
      if (opc == 'string') {
        switch (ref) {
          case 'ativos':
            return await obterTodosAtendimentosAtivos(id);
            break;
          case 'iniciar':
            return await obterAtendimentosParaIniciar(id);
            break;
          case 'finalizar':
            return await obterAtendimentosParaFinalizar(id);
            break;
          case 'finalizados':
            return await obterAtendimentosFinalizados(id);
            break;
          case 'arquivados':
            return await obterAtendimentosArquivados(id);
            break;
        }
      } else if (opc == 'date') {
        return await obterAtendimentosEmDataEspecifica(id, quando);
      }
      return await obterTodosAtendimentos(id);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<AtendimentoServicoModel>> obterTodosAtendimentos(int id) async {
    try {
      final usuariosEmpresa =
          await usuarioRepository.obterUsuariosDaEmpresaPorIdUsuario(id);
      final query = Query<AtendimentoServicoModel>(context)
        ..join(object: (j) => j.cliente)
        ..join(object: (j) => j.usuario)
        ..join(set: (j) => j.atendimentoServicoObjeto)
        ..join(set: (j) => j.movimentacoes)
        ..where((w) => w.usuario.id).oneOf(usuariosEmpresa)
        ..sortBy((s) => s.id, QuerySortOrder.descending);
      return await query.fetch();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<AtendimentoServicoModel>> obterTodosAtendimentosAtivos(
      int id) async {
    try {
      final usuariosEmpresa =
          await usuarioRepository.obterUsuariosDaEmpresaPorIdUsuario(id);
      final query = Query<AtendimentoServicoModel>(context)
        ..join(object: (j) => j.cliente)
        ..join(object: (j) => j.usuario)
        ..join(set: (j) => j.atendimentoServicoObjeto)
        ..join(set: (j) => j.movimentacoes)
        ..where((w) => w.usuario.id).oneOf(usuariosEmpresa)
        ..where((w) => w.ativo).equalTo('S')
        ..sortBy((s) => s.id, QuerySortOrder.descending);
      return await query.fetch();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<AtendimentoServicoModel>> obterAtendimentosParaIniciar(
      int id) async {
    try {
      final usuariosEmpresa =
          await usuarioRepository.obterUsuariosDaEmpresaPorIdUsuario(id);
      final query = Query<AtendimentoServicoModel>(context)
        ..join(object: (j) => j.cliente)
        ..join(object: (j) => j.usuario)
        ..join(set: (j) => j.atendimentoServicoObjeto)
        ..join(set: (j) => j.movimentacoes)
        ..where((w) => w.usuario.id).oneOf(usuariosEmpresa)
        ..where((w) => w.iniciar).isNotNull()
        ..where((w) => w.iniciado).isNull()
        ..where((w) => w.ativo).equalTo('S')
        ..sortBy((s) => s.id, QuerySortOrder.descending);
      return await query.fetch();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<AtendimentoServicoModel>> obterAtendimentosParaFinalizar(
      int id) async {
    try {
      final usuariosEmpresa =
          await usuarioRepository.obterUsuariosDaEmpresaPorIdUsuario(id);
      final query = Query<AtendimentoServicoModel>(context)
        ..join(object: (j) => j.cliente)
        ..join(object: (j) => j.usuario)
        ..join(set: (j) => j.atendimentoServicoObjeto)
        ..join(set: (j) => j.movimentacoes)
        ..where((w) => w.usuario.id).oneOf(usuariosEmpresa)
        ..where((w) => w.finalizar).isNotNull()
        ..where((w) => w.iniciado).isNotNull()
        ..where((w) => w.finalizado).isNull()
        ..where((w) => w.ativo).equalTo('S')
        ..sortBy((s) => s.id, QuerySortOrder.descending);
      return await query.fetch();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<AtendimentoServicoModel>> obterAtendimentosFinalizados(
      int id) async {
    try {
      final usuariosEmpresa =
          await usuarioRepository.obterUsuariosDaEmpresaPorIdUsuario(id);
      final query = Query<AtendimentoServicoModel>(context)
        ..join(object: (j) => j.cliente)
        ..join(object: (j) => j.usuario)
        ..join(set: (j) => j.atendimentoServicoObjeto)
        ..join(set: (j) => j.movimentacoes)
        ..where((w) => w.usuario.id).oneOf(usuariosEmpresa)
        ..where((w) => w.finalizado).isNotNull()
        ..where((w) => w.ativo).equalTo('S')
        ..sortBy((s) => s.id, QuerySortOrder.descending);
      return await query.fetch();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<AtendimentoServicoModel>> obterAtendimentosArquivados(
      int id) async {
    try {
      final usuariosEmpresa =
          await usuarioRepository.obterUsuariosDaEmpresaPorIdUsuario(id);
      final query = Query<AtendimentoServicoModel>(context)
        ..join(object: (j) => j.cliente)
        ..join(object: (j) => j.usuario)
        ..join(set: (j) => j.atendimentoServicoObjeto)
        ..join(set: (j) => j.movimentacoes)
        ..where((w) => w.usuario.id).oneOf(usuariosEmpresa)
        ..where((w) => w.ativo).equalTo('N')
        ..sortBy((s) => s.id, QuerySortOrder.descending);
      return await query.fetch();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<ClienteVeiculoModel> obterClienteVeiculoPorId(int id) async {
    try {
      final query = Query<ClienteVeiculoModel>(context)
        ..where((w) => w.id).equalTo(id);
      return await query.fetchOne();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<AtendimentoServicoObjetoModel>
      obterAtendimentoServicoObjetoPorIdAtendimento(int id) async {
    try {
      final query = Query<AtendimentoServicoObjetoModel>(context)
        ..where((w) => w.atendimentoServico.id).equalTo(id);
      return await query.fetchOne();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<AtendimentoServicoInfoModel>> consultarAtendimentoServicoInfo(
      int id) async {
    try {
      final query = Query<AtendimentoServicoInfoModel>(context)
        ..join(object: (j) => j.usuario)
        ..join(object: (j) => j.atendimentoServico)
        ..where((w) => w.atendimentoServico.id).equalTo(id);
      return await query.fetch();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> gravarNovoValor(
      AtendimentoServicoNovoValorRequest request) async {
    try {
      final usuario =
          await usuarioRepository.consultarUsuarioPorId(request.usuarioId);
      final query = Query<AtendimentoServicoModel>(context)
        ..values.usuario = usuario
        ..values.valor = request.valor
        ..where((w) => w.id).equalTo(request.atendimentoServicoId);
      final ret = await query.update();
      return ret.isNotEmpty;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<ClientePetModel> obterClientePetPorId(int id) async {
    try {
      final query = Query<ClientePetModel>(context)
        ..where((w) => w.id).equalTo(id);
      return await query.fetchOne();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> registarNovoAtendimentoNaAtuacao(
      AtendimentoServicoModel atendimentoServico,
      UsuarioModel usuario,
      ClienteModel cliente) async {
    final DateFormat dF = DateFormat('dd/MM/yyyy HH:mm');

    final clienteNome = cliente.nome.split(' ')[0];
    final observacaoAtendimento = atendimentoServico.observacao.isNotEmpty
        ? ', ${atendimentoServico.observacao}'
        : '';
    final observacaoAtuacao =
        'Cliente ${clienteNome}, iniciar em ${dF.format(atendimentoServico.iniciar.toLocal())}, finalizar em ${dF.format(atendimentoServico.finalizar.toLocal())}${observacaoAtendimento}';
    final model = AtendimentoServicoInfoModel();
    model.descricao = 'Atendimento Criado';
    model.quando = DateTime.now();
    model.tags = atendimentoServico.tags;
    model.observacao = observacaoAtuacao;
    model.usuario = usuario;
    model.atendimentoServico = atendimentoServico;
    await context.insertObject(model).then((t) => t);
  }

  Future<List<AtendimentoServicoModel>> obterAtendimentosEmDataEspecifica(
      int id, String quando) async {
    try {
      final usuariosEmpresa =
          await usuarioRepository.obterUsuariosDaEmpresaPorIdUsuario(id);
      final quandoIni =
          DateFormat('yyyy-MM-dd hh:mm:ss').parse('${quando} 00:00:00.000');
      final quandoEnd =
          DateFormat('yyyy-MM-dd hh:mm:ss').parse('${quando} 23:59:59.000');

      //Iniciar
      final queryInciar = Query<AtendimentoServicoModel>(context)
        ..join(object: (j) => j.cliente)
        ..join(object: (j) => j.usuario)
        ..join(set: (j) => j.atendimentoServicoObjeto)
        ..join(set: (j) => j.movimentacoes)
        ..where((w) => w.usuario.id).oneOf(usuariosEmpresa)
        ..where((w) => w.iniciar).between(quandoIni, quandoEnd)
        ..where((w) => w.iniciado).isNull()
        ..where((w) => w.ativo).equalTo('S')
        ..sortBy((s) => s.iniciar, QuerySortOrder.ascending);
      final result1 = await queryInciar.fetch();

      //Iniciado
      final queryInciado = Query<AtendimentoServicoModel>(context)
        ..join(object: (j) => j.cliente)
        ..join(object: (j) => j.usuario)
        ..join(set: (j) => j.atendimentoServicoObjeto)
        ..join(set: (j) => j.movimentacoes)
        ..where((w) => w.usuario.id).oneOf(usuariosEmpresa)
        ..where((w) => w.iniciado).between(quandoIni, quandoEnd)
        ..where((w) => w.finalizado).isNull()
        ..where((w) => w.ativo).equalTo('S')
        ..sortBy((s) => s.iniciado, QuerySortOrder.ascending);
      final result2 = await queryInciado.fetch();

      //Finalizado
      final queryFinalizado = Query<AtendimentoServicoModel>(context)
        ..join(object: (j) => j.cliente)
        ..join(object: (j) => j.usuario)
        ..join(set: (j) => j.atendimentoServicoObjeto)
        ..join(set: (j) => j.movimentacoes)
        ..where((w) => w.usuario.id).oneOf(usuariosEmpresa)
        ..where((w) => w.finalizado).between(quandoIni, quandoEnd)
        ..where((w) => w.ativo).equalTo('S')
        ..sortBy((s) => s.finalizado, QuerySortOrder.ascending);
      final result3 = await queryFinalizado.fetch();

      //Juntar em results ordenado pelo horário
      final List<AtendimentoServicoModel> resultAll = List.from(result1)
        ..addAll(result2)
        ..addAll(result3);

      return resultAll;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> inicio(AtendimentoServicoInicioRequest request) async {
    try {
      final usuario =
          await usuarioRepository.consultarUsuarioPorId(request.usuarioId);
      final query = Query<AtendimentoServicoModel>(context)
        ..values.usuario = usuario
        ..values.iniciar = request.inicio
        ..where((w) => w.id).equalTo(request.atendimentoServicoId);
      final ret = await query.update();
      return ret.isNotEmpty;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // Future<bool> locacaoRoupaUpdTagsApenas(
  //     AtendimentoServicoUpdRequest request) async {
  //   try {
  //     final query = Query<AtendimentoServicoModel>(context)
  //       ..values.tags = request.tags
  //       ..where((w) => w.id).equalTo(request.id)
  //       ..where((w) => w.usuario.id).equalTo(request.usuarioId);
  //     final ret = await query.update();
  //     return ret.isNotEmpty;
  //   } catch (e) {
  //     print(e);
  //     return false;
  //   }
  // }
}
