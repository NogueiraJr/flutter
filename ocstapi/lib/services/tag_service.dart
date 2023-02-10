import 'package:ocstapi/controllers/cliente/dto/cliente_upd_request.dart';
import 'package:ocstapi/controllers/fornecedor/dto/fornecedor_upd_request.dart';
import 'package:ocstapi/controllers/locacao_roupa/dto/locacao_roupa_upd_request.dart';
import 'package:ocstapi/controllers/produto/dto/produto_upd_request.dart';
import 'package:ocstapi/controllers/tag/dto/tag_del_request.dart';
import 'package:ocstapi/controllers/tag/dto/tag_ins_request.dart';
import 'package:ocstapi/controllers/tag/dto/tag_upd_request.dart';
import 'package:ocstapi/model/cliente_model.dart';
import 'package:ocstapi/model/fornecedor_model.dart';
import 'package:ocstapi/model/locacao_roupa_model.dart';
import 'package:ocstapi/model/produto_model.dart';
import 'package:ocstapi/model/tag_model.dart';
import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/repository/cliente_repository.dart';
import 'package:ocstapi/repository/fornecedor_repository.dart';
import 'package:ocstapi/repository/locacao_roupa_repository.dart';
import 'package:ocstapi/repository/produto_repository.dart';
import 'package:ocstapi/repository/tag_repository.dart';
import 'package:ocstapi/repository/usuario_repository.dart';
import 'package:ocstapi/services/usuario_service.dart';

class TagService {
  TagService(this.context)
      : repository = TagRepository(context),
        usuarioRepository = UsuarioRepository(context),
        produtoRepository = ProdutoRepository(context),
        clienteRepository = ClienteRepository(context),
        locacaoRoupaRepository = LocacaoRoupaRepository(context),
        fornecedorRepository = FornecedorRepository(context),
        usuarioService = UsuarioService(context);
  final ManagedContext context;
  final TagRepository repository;
  final UsuarioRepository usuarioRepository;
  final ProdutoRepository produtoRepository;
  final ClienteRepository clienteRepository;
  final LocacaoRoupaRepository locacaoRoupaRepository;
  final FornecedorRepository fornecedorRepository;
  final UsuarioService usuarioService;

  Future<TagModel> tagIns(TagInsRequest request) async {
    return await repository.tagIns(request);
  }

  Future<bool> tagUpd(TagUpdRequest request) async {
    //Atualiza em todos os locais dos sistema onde essa Tag é usada
    await tagUpdAllSystem(request);
    //Atualiza na tabela de domínio
    return await repository.tagUpd(request);
  }

  Future<bool> tagUpdAllSystem(TagUpdRequest request) async {
    return await tagUpdProduto(request) &&
        await tagUpdCliente(request) &&
        await tagUpdFornecedor(request) &&
        await tagUpdLocacaoRoupa(request);
  }

  Future<bool> tagUpdLocacaoRoupa(TagUpdRequest request) async {
    try {
      final locacoesRoupas = await obterLocacoesRoupasComTags(request);
      for (var locacao in locacoesRoupas) {
        locacao.tags =
            locacao.tags.replaceAll(request.nomeAntigo, request.nomeNovo);
        final LocacaoRoupaUpdRequest locAlt = LocacaoRoupaUpdRequest();
        locAlt.tags = locacao.tags;
        locAlt.id = locacao.id;
        locAlt.usuarioId = locacao.usuario.id;
        await locacaoRoupaRepository.locacaoRoupaUpdTagsApenas(locAlt);
      }
    } catch (e) {
      return false;
    }
    return true;
  }

  Future<bool> tagUpdCliente(TagUpdRequest request) async {
    try {
      final clientes = await obterClientesComTags(request);
      for (var cliente in clientes) {
        cliente.tags =
            cliente.tags.replaceAll(request.nomeAntigo, request.nomeNovo);
        final ClienteUpdRequest cliAlt = ClienteUpdRequest();
        cliAlt.tags = cliente.tags;
        cliAlt.id = cliente.id;
        cliAlt.usuarioId = cliente.usuario.id;
        await clienteRepository.clienteUpdTagsApenas(cliAlt);
      }
    } catch (e) {
      return false;
    }
    return true;
  }

  Future<bool> tagUpdFornecedor(TagUpdRequest request) async {
    try {
      final fornecedores = await obterFornecedoresComTags(request);
      for (var fornecedor in fornecedores) {
        fornecedor.tags =
            fornecedor.tags.replaceAll(request.nomeAntigo, request.nomeNovo);
        final FornecedorUpdRequest fornAlt = FornecedorUpdRequest();
        fornAlt.tags = fornecedor.tags;
        fornAlt.id = fornecedor.id;
        fornAlt.usuarioId = fornecedor.usuario.id;
        await fornecedorRepository.fornecedorUpdTagsApenas(fornAlt);
      }
    } catch (e) {
      return false;
    }
    return true;
  }

  Future<bool> tagUpdProduto(TagUpdRequest request) async {
    try {
      final produtos = await obterProdutosComTags(request);
      for (var produto in produtos) {
        produto.tags =
            produto.tags.replaceAll(request.nomeAntigo, request.nomeNovo);
        final ProdutoUpdRequest prodAlt = ProdutoUpdRequest();
        prodAlt.tags = produto.tags;
        prodAlt.id = produto.id;
        prodAlt.usuarioId = produto.usuario.id;
        await produtoRepository.produtoUpdTagsApenas(prodAlt);
      }
    } catch (e) {
      return false;
    }
    return true;
  }

  Future<List<ProdutoModel>> obterProdutosComTags(TagUpdRequest request) async {
    final idsUsuariosEmpresa = await usuariosEmpresa(request.usuarioId);
    final produtos = await produtoRepository.obterProdutosDaEmpresaDoUsuario(
        request.usuarioId, idsUsuariosEmpresa)
      ..where((w) => w.tags.contains(request.nomeAntigo));
    return produtos;
  }

  Future<List<ClienteModel>> obterClientesComTags(TagUpdRequest request) async {
    final idsUsuariosEmpresa = await usuariosEmpresa(request.usuarioId);
    final clientes = await clienteRepository.obterClientesDaEmpresaDoUsuario(
        request.usuarioId, idsUsuariosEmpresa)
      ..where((w) => w.tags.contains(request.nomeAntigo));
    return clientes;
  }

  Future<List<LocacaoRoupaModel>> obterLocacoesRoupasComTags(
      TagUpdRequest request) async {
    final locacoesRoupas = await locacaoRoupaRepository
        .obterLocacaoRoupaPorUsuarioEmpresaId(request.usuarioId, null)
      ..where((w) => w.tags.contains(request.nomeAntigo));
    return locacoesRoupas;
  }

  Future<List<FornecedorModel>> obterFornecedoresComTags(
      TagUpdRequest request) async {
    final idsUsuariosEmpresa = await usuariosEmpresa(request.usuarioId);
    final fornecedores = await fornecedorRepository
        .obterFornecedoresDaEmpresaDoUsuario(
            request.usuarioId, idsUsuariosEmpresa)
      ..where((w) => w.tags.contains(request.nomeAntigo));
    return fornecedores;
  }

  Future<bool> tagDel(TagDelRequest request) async {
    if (request.tudo == 'S') {
      await apagarTagEmTodoSistema(request);
    }
    return await repository.tagDel(request);
  }

  Future apagarTagEmTodoSistema(TagDelRequest request) async {
    final TagUpdRequest tagAlt = TagUpdRequest();
    tagAlt.id = request.id;
    tagAlt.usuarioId = request.usuarioId;
    tagAlt.nomeNovo = '';

    tagAlt.nomeAntigo = '${await obterNomeTagPorId(request.id)}|';
    await tagUpdAllSystem(tagAlt);
    tagAlt.nomeAntigo = '|${await obterNomeTagPorId(request.id)}';
    await tagUpdAllSystem(tagAlt);
  }

  Future<String> obterNomeTagPorId(int idTag) async {
    return await repository.obterNomeTagPorId(idTag);
  }

  Future<TagModel> obterTagsPorId(int id) async {
    return await repository.obterTagPorId(id);
  }

  Future<List<TagModel>> obterTagsPorIdUsuario(int idUsuario) async {
    final idsUsuariosEmpresa = await usuariosEmpresa(idUsuario);
    return await repository.obterTagsDaEmpresaDoUsuario(
        idUsuario, idsUsuariosEmpresa);
  }

  Future<List<int>> usuariosEmpresa(int idUsuario) async {
    final idPai =
        await usuarioRepository.obterIdProprietarioDaEmpresa(idUsuario);
    final loginPai = await usuarioRepository.obterLoginPorId(idPai);
    final usuariosDaEquipe = await usuarioService.obterUsuariosEquipe(loginPai);
    final idsUsuariosEmpresa = <int>[];
    for (var usuario in usuariosDaEquipe) {
      idsUsuariosEmpresa.add(usuario.id);
    }
    //Inclusive o Dono da Empresa!
    idsUsuariosEmpresa.add(idPai);
    return idsUsuariosEmpresa;
  }

  Future<List<TagModel>> obterTagsPorNome(
      int id, String nome, int usuarioId) async {
    final idsUsuariosEmpresa = await usuariosEmpresa(usuarioId);
    return await repository.obterTagsPorNome(id, nome, idsUsuariosEmpresa);
  }

  Future<List<TagModel>> obterAmostraTagsDaEmpresa(
      String login, int qtdeAmostra) async {
    final id = await usuarioRepository.obterIdPorLogin(login);
    final idsUsuariosEmpresa = await usuariosEmpresa(id);
    final tagsEmpresa = await repository.obterAmostraTagsDaEmpresa(
        idsUsuariosEmpresa, qtdeAmostra);
    return tagsEmpresa;
  }
}
