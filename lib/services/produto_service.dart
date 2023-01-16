import 'package:ocstapi/controllers/produto/dto/produto_del_request.dart';
import 'package:ocstapi/controllers/produto/dto/produto_ins_request.dart';
import 'package:ocstapi/controllers/produto/dto/produto_item_del_request.dart';
import 'package:ocstapi/controllers/produto/dto/produto_item_ins_request.dart';
import 'package:ocstapi/controllers/produto/dto/produto_upd_request.dart';
import 'package:ocstapi/model/produto_item_model.dart';
import 'package:ocstapi/model/produto_model.dart';
import 'package:ocstapi/model/usuario_model.dart';
import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/repository/checar_antes_de_apagar_repository.dart';
import 'package:ocstapi/repository/produto_repository.dart';
import 'package:ocstapi/repository/usuario_repository.dart';
import 'package:ocstapi/services/usuario_service.dart';

class ProdutoService {
  ProdutoService(this.context)
      : repository = ProdutoRepository(context),
        usuarioRepository = UsuarioRepository(context),
        usuarioService = UsuarioService(context);
  final ManagedContext context;
  final ProdutoRepository repository;
  final UsuarioRepository usuarioRepository;
  final UsuarioService usuarioService;

  Future<ProdutoModel> produtoIns(ProdutoInsRequest request) async {
    return await repository.produtoIns(request);
  }

  Future<bool> produtoUpd(ProdutoUpdRequest request) async {
    return await repository.produtoUpd(request);
  }

  Future<String> produtoDel(ProdutoDelRequest request) async {
    final msg = await ChecarAntesDeApagarRepository(context)
        .checarAntesDeApagar(request.id, 'produto');
    if (msg.isNotEmpty) {
      return msg;
    } else {
      //Primeiro apaga o Produto em todos os lugares no Sistema.
      await apagarProdutoEmTodosOsLugaresNoSistema(request.id);
      //Depois apaga o produto da tabela domínio dele.
      return await repository.produtoDel(request);
    }
  }

  Future<bool> apagarProdutoEmTodosOsLugaresNoSistema(int produtoId) async {
    try {
      //Apagar o Produto em todos os produtos onde ele existe.
      await _apagarProdNaComposicao(produtoId, true);
      //Apagar todas as Composições do Produto.
      await _apagarProdNaComposicao(produtoId, false);

      //Demais lugares onde será necessário apagar o Produto (Pedido, Locação, Venda, etc.)
      //Lembrando que o estrago será grande: valores sendo recalculados, etc.
      //await _aaaa(produtoId);
      //await _bbbb(produtoId);
      //await _cccc(produtoId);

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<String> _apagarProdNaComposicao(int id, bool compondoUmProduto) async {
    final ProdutoItemDelRequest itemDelRequest = ProdutoItemDelRequest();
    itemDelRequest.produtoId = compondoUmProduto ? 0 : id;
    itemDelRequest.produtoItemId = compondoUmProduto ? id : 0;
    return await repository.produtoItemDel(itemDelRequest);
  }

  Future<ProdutoModel> obterProdutoPorId(int id) async {
    return await repository.obterProdutoPorId(id);
  }

  Future<List<ProdutoModel>> obterProdutosPorIdUsuario(int idUsuario) async {
    // return await repository.obterProdutosPorIdUsuario(idUsuario);
    // final login = await usuarioRepository.obterLoginPorId(idUsuario);
    final idPai =
        await usuarioRepository.obterIdProprietarioDaEmpresa(idUsuario);
    final loginPai = await usuarioRepository.obterLoginPorId(idPai);
    final usuariosDaEquipe = await usuarioService.obterUsuariosEquipe(loginPai);
    final idsUsuariosEmpresa = <int>[];
    for (var usuario in usuariosDaEquipe) {
      idsUsuariosEmpresa.add(usuario.id);
    }
    return await repository.obterProdutosDaEmpresaDoUsuario(
        idUsuario, idsUsuariosEmpresa);
  }

  Future<List<ProdutoModel>> obterProdutosPorCodigo(String codigo) async {
    return await repository.obterProdutosPorCodigo(codigo);
  }

  Future<List<ProdutoModel>> obterProdutosPorNome(String nome) async {
    return await repository.obterProdutosPorNome(nome);
  }

  Future<List<ProdutoModel>> obterProdutosPorDescricao(String descricao) async {
    return await repository.obterProdutosPorDescricao(descricao);
  }

  Future<List<ProdutoModel>> obterAmostraProdutosDaEmpresa(
      String login, int qtdeAmostra) async {
    final id = await usuarioRepository.obterIdPorLogin(login);
    final idDono = await usuarioRepository.obterIdProprietarioDaEmpresa(id);
    final dono = await usuarioRepository.consultarUsuarioPorId(idDono);
    final usuarios = await usuarioService.obterUsuariosEquipe(dono.login);
    final ids = <int>[];
    for (var usuario in usuarios) {
      ids.add(usuario.id);
    }
    //Inclusive o Dono!
    ids.add(idDono);

    final produtosEmpresa =
        await repository.obterAmostraProdutosDaEmpresa(ids, qtdeAmostra);
    return produtosEmpresa;
  }

  Future<List<ProdutoItemModel>> obterProdutoItemPorIdProdutoPai(int id) async {
    return await repository.obterProdutoItemPorIdProdutoPai(id);
  }

  Future<List<ProdutoItemModel>> obterProdutoItemPorIdProdutoFilho(
      int id) async {
    return await repository.obterProdutoItemPorIdProdutoFilho(id);
  }

  Future<ProdutoItemModel> produtoItemIns(ProdutoItemInsRequest request) async {
    return await repository.produtoItemIns(request);
  }

  Future<String> produtoItemDel(ProdutoItemDelRequest request) async {
    final msg = await ChecarAntesDeApagarRepository(context)
        .checarAntesDeApagar(request.produtoId, 'cliente');
    if (msg.isNotEmpty) {
      return msg;
    } else {
      return await repository.produtoItemDel(request);
    }
  }

  Future<int> obterUsuarioIdPorProdutoId(int id) async {
    return await repository.obterProdutoPorId(id).then((t) => t.usuario.id);
  }

  Future<ProdutoModel> obterResumoProdutoPorIdProduto(int id) async {
    return await repository.obterResumoProdutoPorIdProduto(id);
  }
}
