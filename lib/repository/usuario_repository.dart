import 'package:ocstapi/controllers/proprietario/dto/gravar_proprietario_request.dart';
import 'package:ocstapi/controllers/usuario/dto/cadastrar_usuario_request.dart';
import 'package:ocstapi/controllers/usuario/dto/complementar_usuario_request.dart';
import 'package:ocstapi/controllers/usuario/dto/excluir_usuario_request.dart';
import 'package:ocstapi/controllers/usuario_acesso/dto/usuario_acesso_bloqueio_request.dart';
import 'package:ocstapi/controllers/usuario_acesso/dto/usuario_acesso_request.dart';
import 'package:ocstapi/controllers/usuario_pai_filho/dto/criar_login_filho_do_pai_request.dart';
import 'package:ocstapi/controllers/usuario_pai_filho/dto/usuario_delegar_request.dart';
import 'package:ocstapi/model/sistema_model.dart';
import 'package:ocstapi/model/usuario_acesso_model.dart';
import 'package:ocstapi/model/usuario_model.dart';
import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/repository/sistema_repository.dart';
import 'package:ocstapi/repository/usuario_situacao_repository.dart';
import 'package:ocstapi/utils/criptografia_utils.dart';

class UsuarioRepository {
  UsuarioRepository(this.context)
      : usuarioSituacaoRepository = UsuarioSituacaoRepository(context);
  final ManagedContext context;
  final UsuarioSituacaoRepository usuarioSituacaoRepository;

  Future<UsuarioModel> recuperarUsuarioPorLoginESenha(
      String login, String senha) {
    final query = Query<UsuarioModel>(context)
      ..where((usuario) => usuario.login).equalTo(login.toUpperCase())
      ..where((usuario) => usuario.senha).equalTo(senha);

    return query.fetchOne();
  }

  Future<bool> cadastrarUsuario(CadastrarUsuarioRequest request) async {
    try {
      //1	cadastro	Cadastro inicial realizado
      final situacao = await usuarioSituacaoRepository.buscarPorId(1);
      final model = UsuarioModel(); //..read(request.asMap());
      model.login = request.login.toUpperCase();
      model.email = request.email.toUpperCase();
      model.senha = CriptografiaUtils.criptografarSenha(request.senha);
      model.ativo = 'S'; //Todo cadastro inicial entra como ativo.
      model.codigo = request.codigo;
      model.usuariosituacao = situacao; //Todo cadastro inicial entra como 1.
      await context.insertObject(model);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> gravarNovoCodigoUsuario(CadastrarUsuarioRequest request) async {
    try {
      final query = Query<UsuarioModel>(context)
        ..values.codigo = request.codigo
        ..where((w) => w.login).equalTo(request.login.toUpperCase())
        ..where((w) => w.email).equalTo(request.email.toUpperCase());
      await query.update();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> complementarUsuario(ComplementarUsuarioRequest request) async {
    //2	validado	Cadastro inicial validado
    final situacao = await usuarioSituacaoRepository.buscarPorId(2);
    final query = Query<UsuarioModel>(context)
      ..values.empresa = request.empresa
      ..values.pessoa = request.pessoa
      ..values.usuariosituacao = situacao
      ..where((w) => w.login).equalTo(request.login.toUpperCase());
    await query.update();
  }

  Future<UsuarioModel> buscarPorId(int id) async {
    final query = Query<UsuarioModel>(context)
      ..where((usuario) => usuario.id).equalTo(id);
    return await query.fetchOne();
  }

  Future<UsuarioModel> buscarPorLogin(String login) async {
    final query = Query<UsuarioModel>(context)
      ..where((usuario) => usuario.login).equalTo(login.toUpperCase());
    return await query.fetchOne();
  }

  Future<UsuarioModel> usuarioValidado(String login) async {
    final query = Query<UsuarioModel>(context)
      ..where((usuario) => usuario.login).equalTo(login.toUpperCase())
      ..where((w) => w.usuariosituacao.id)
          .equalTo(2); //2: validado / Cadastro inicial validado
    return await query.fetchOne();
  }

  Future<UsuarioModel> consultarUsuarioPorLogin(String login) async {
    final q = Query<UsuarioModel>(context)
      ..where((w) => w.login).equalTo(login.toUpperCase());
    final r = q.fetchOne();
    return await r;
  }

  Future<UsuarioModel> consultarUsuarioPorId(int id) async {
    final q = Query<UsuarioModel>(context)..where((w) => w.id).equalTo(id);
    final r = q.fetchOne();
    return await r;
  }

  Future<UsuarioModel> usuarioBloqueado(String login) async {
    final query = Query<UsuarioModel>(context)
      ..where((usuario) => usuario.login).equalTo(login.toUpperCase())
      ..where((w) => w.ativo).equalTo('N');
    return await query.fetchOne();
  }

  Future<UsuarioModel> usuarioAdmin(String login) async {
    final query = Query<UsuarioModel>(context)
      ..where((usuario) => usuario.login).equalTo(login.toUpperCase())
      ..where((w) => w.usuariosituacao.id)
          .equalTo(0); //0: admin / Administrador
    return await query.fetchOne();
  }

  Future<void> apagarCadastroInicialDoUsuario(
      ExcluirUsuarioRequest request) async {
    final query = Query<UsuarioModel>(context)
      ..where((w) => w.login).equalTo(request.login.toUpperCase());
    await query.delete();
  }

  Future<UsuarioModel> buscarPorLoginEmail(String login, String email) async {
    //print(login);
    //print(email);
    final query = Query<UsuarioModel>(context)
      ..where((usuario) => usuario.login).equalTo(login.toUpperCase())
      ..where((usuario) => usuario.email).equalTo(email.toUpperCase());
    return await query.fetchOne();
  }

  Future<UsuarioModel> codigoValido(
      String login, String email, String codigo) async {
    final query = Query<UsuarioModel>(context)
      ..where((usuario) => usuario.login).equalTo(login.toUpperCase())
      ..where((usuario) => usuario.email).equalTo(email.toUpperCase())
      ..where((usuario) => usuario.codigo).equalTo(int.parse(codigo));
    return await query.fetchOne();
  }

  Future<void> gravarNovaSenhaUsuario(CadastrarUsuarioRequest request) async {
    try {
      final query = Query<UsuarioModel>(context)
        ..values.senha = CriptografiaUtils.criptografarSenha(request.senha)
        ..where((w) => w.login).equalTo(request.login.toUpperCase())
        ..where((w) => w.email).equalTo(request.email.toUpperCase());
      await query.update();
    } catch (e) {
      print(e);
    }
  }

  Future<int> obterQtdeFilhos(int id) async {
    final query = Query<UsuarioModel>(context)
      ..where((usuario) => usuario.idPai).equalTo(id);
    return await query.reduce.count();
  }

  Future<int> obterIdPorLogin(String login) async {
    final query = Query<UsuarioModel>(context)
      ..where((usuario) => usuario.login).equalTo(login.toUpperCase());
    print('login: $login');
    final res = await query.fetchOne().then((res) => res.id);
    return res;
  }

  Future<int> obterIdPaiDoLogin(String login) async {
    final query = Query<UsuarioModel>(context)
      ..where((usuario) => usuario.login).equalTo(login.toUpperCase());
    print('login: $login');
    final res = await query.fetchOne().then((res) => res.idPai);
    return res;
  }

  Future<List<UsuarioModel>> obterUsuariosFilhosPorIdPai(int idPai) async {
    final query = Query<UsuarioModel>(context)
      ..where((usuario) => usuario.idPai).equalTo(idPai)
      ..sortBy((s) => s.pessoa, QuerySortOrder.ascending);
    return await query.fetch();
  }

  Future<bool> cadastrarUsuarioFilho(
      CriarLoginFilhoDoPaiRequest request) async {
    try {
      final situacao = await usuarioSituacaoRepository.buscarPorId(2);
      final usuariosistema = await obterSistemaDoUsuarioPai(request.idSistema);
      final model = UsuarioModel();
      model.login = request.login.toUpperCase();
      model.email = request.email.toUpperCase();
      model.senha = CriptografiaUtils.criptografarSenha(request.senha);
      model.ativo = request.ativo;
      model.codigo = request.codigo;
      model.usuariosituacao = situacao;
      model.empresa = request.empresa;
      model.pessoa = request.pessoa;
      model.idPai = request.idPai;
      model.usuariosistema = usuariosistema;
      await context.insertObject(model);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> alterarUsuarioFilho(CriarLoginFilhoDoPaiRequest request) async {
    try {
      if (request.operacao == 'CAD') {
        final query = Query<UsuarioModel>(context)
          ..values.email = request.email.toUpperCase()
          ..values.ativo = request.ativo
          ..values.codigo = request.codigo
          ..values.empresa = request.empresa
          ..values.pessoa = request.pessoa
          ..values.senha = CriptografiaUtils.criptografarSenha(request.senha)
          ..where((w) => w.login).equalTo(request.login.toUpperCase())
          ..where((w) => w.idPai).equalTo(request.idPai);
        await query.update();
        return true;
      } else if (request.operacao == 'ALT') {
        final query = Query<UsuarioModel>(context)
          ..values.login = request.login.toUpperCase()
          ..values.email = request.email.toUpperCase()
          ..values.codigo = request.codigo
          ..values.empresa = request.empresa
          ..values.pessoa = request.pessoa
          ..where((w) => w.id).equalTo(request.id)
          ..where((w) => w.idPai).equalTo(request.idPai);
        await query.update();
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> gravarProprietario(GravarProprietarioRequest request) async {
    try {
      final query = Query<UsuarioModel>(context)
        ..values.login = request.login.toUpperCase()
        ..values.email = request.email.toUpperCase()
        //..values.codigo = request.codigo
        ..values.empresa = request.empresa
        ..values.pessoa = request.pessoa
        ..where((w) => w.id).equalTo(request.id);
      await query.update();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> delegarUsuario(UsuarioDelegarRequest request) async {
    final query = Query<UsuarioModel>(context)
      ..values.idPai = request.para
      ..where((w) => w.id).equalTo(request.quem);
    await query.update();
    return true;
  }

  Future<bool> criarAcessoUsuario(UsuarioAcessoRequest request) async {
    final query = Query<UsuarioAcessoModel>(context)
      ..values.usuario.id = request.usuarioId
      ..values.menu.id = request.menuId;
    await query.insert();
    return true;
  }

  Future<bool> jaExisteAcessoUsuarioAoMenu(UsuarioAcessoRequest request) async {
    final query = Query<UsuarioAcessoModel>(context)
      ..where((w) => w.menu.id).equalTo(request.menuId)
      ..where((w) => w.usuario.id).equalTo(request.usuarioId);
    return (await query.fetch()).isNotEmpty;
  }

  Future<bool> apagarAcessoUsuario(UsuarioAcessoRequest request) async {
    final query = Query<UsuarioAcessoModel>(context)
      ..where((w) => w.menu.id).equalTo(request.menuId)
      ..where((w) => w.usuario.id).equalTo(request.usuarioId);
    return await query.delete() > 0;
  }

  Future<SistemaModel> obterSistemaDoUsuarioPai(int idSistema) {
    return SistemaRepository(context).obterSistemaDoUsuarioPai(idSistema);
  }

  Future<List<UsuarioAcessoModel>> obterAcessosUsuario(int idDoLogin) async {
    final query = Query<UsuarioAcessoModel>(context)
      ..where((w) => w.usuario.id).equalTo(idDoLogin)
      ..where((w) => w.menu.menuAtivo).equalTo('S')
      ..where((w) => w.menu.menuPai).oneOf(['DDS', 'OPR', 'RLT'])
      ..join(object: (j) => j.menu)
          .sortBy((s) => s.menuOrdem, QuerySortOrder.ascending);
    return query.fetch();
  }

  Future<List<int>> obterUsuariosDaEmpresaPorIdUsuario(int id) async {
    final idPai = await obterIdProprietarioDaEmpresa(id);
    final List<int> filhos = await obterListaIdsUsuariosFilhosPorIdPai(idPai);

    for (int x = 0; x < filhos.length; x++) {
      final netos = await obterListaIdsUsuariosFilhosPorIdPai(filhos[x]);
      for (var i = 0; i < netos.length; i++) {
        if (!filhos.contains(netos[i])) {
          filhos.add(netos[i]);
        }
      }
    }

    filhos.add(idPai);
    return filhos;
  }

  Future<List<int>> obterListaIdsUsuariosFilhosPorIdPai(int idPai) async {
    final usuarios = obterUsuariosFilhosPorIdPai(idPai);
    final List<int> listaIds = <int>[];
    for (var usuario in await usuarios) {
      listaIds.add(usuario.id);
    }
    return listaIds;
  }

  Future<int> obterIdProprietarioDaEmpresa(int idUsuarioEmpresa) async {
    var usuario = await consultarUsuarioPorId(idUsuarioEmpresa);
    var idPai = await obterIdPaiDoLogin(usuario.login);
    while (idPai != null) {
      usuario = await consultarUsuarioPorId(idPai);
      idPai = await obterIdPaiDoLogin(usuario.login);
    }
    return usuario.id;
  }

  Future<String> bloqueioAcessoUsuario(
      UsuarioAcessoBloqueioRequest request, String sn) async {
    try {
      final ativo = sn == 'S' ? 'N' : 'S';
      final query = Query<UsuarioModel>(context)
        ..values.ativo = ativo
        ..where((w) => w.id).equalTo(request.id);
      await query.update();
      return ativo == 'S'
          ? 'Colaborador DESBLOQUEADO com sucesso'
          : 'Colaborador BLOQUEADO com sucesso';
    } catch (e) {
      print(e);
      return 'Problemas [bloqueioAcessoUsuario]: $e';
    }
  }

  Future<String> obterLoginPorId(int idUsuario) async {
    final usuario = await consultarUsuarioPorId(idUsuario);
    return usuario.login;
  }

  Future<String> obterSistemaRefPorUsuarioId(int idUsuario) async {
    try {
      final query = Query<UsuarioModel>(context)
        ..join(object: (j) => j.usuariosistema)
        ..where((w) => w.id).equalTo(idUsuario);
      return query.fetchOne().then((t) => t.usuariosistema.sistemaRef);
    } catch (e) {
      print(e);
      return '';
    }
  }
}
