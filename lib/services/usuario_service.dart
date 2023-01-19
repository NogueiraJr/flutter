import 'dart:math';

import 'package:ocstapi/controllers/login/dto/login_request.dart';
import 'package:ocstapi/controllers/proprietario/dto/gravar_proprietario_request.dart';
import 'package:ocstapi/controllers/usuario/dto/cadastrar_usuario_request.dart';
import 'package:ocstapi/controllers/usuario/dto/complementar_usuario_request.dart';
import 'package:ocstapi/controllers/usuario/dto/excluir_usuario_request.dart';
import 'package:ocstapi/controllers/usuario_acesso/dto/usuario_acesso_bloqueio_request.dart';
import 'package:ocstapi/controllers/usuario_acesso/dto/usuario_acesso_request.dart';
import 'package:ocstapi/controllers/usuario_pai_filho/dto/criar_login_filho_do_pai_request.dart';
import 'package:ocstapi/controllers/usuario_pai_filho/dto/usuario_delegar_request.dart';
import 'package:ocstapi/model/usuario_acesso_model.dart';
import 'package:ocstapi/model/usuario_model.dart';
import 'package:ocstapi/repository/usuario_repository.dart';
import 'package:ocstapi/utils/criptografia_utils.dart';
import 'package:ocstapi/utils/email_utils.dart';
import 'package:ocstapi/utils/jwt_utils.dart';
import '../ocstapi.dart';

class UsuarioService {
  UsuarioService(this.context) : usuarioRepository = UsuarioRepository(context);
  final ManagedContext context;
  final UsuarioRepository usuarioRepository;

  Future<String> login(LoginRequest request) async {
    final String login = request.login;
    final String senha = request.senha;
    final String senhaCriptografada =
        CriptografiaUtils.criptografarSenha(senha);
    final usuario = await usuarioRepository.recuperarUsuarioPorLoginESenha(
        login, senhaCriptografada);

    if (usuario != null) {
      return JwtUtils.gerarTokenJwt(usuario);
    }

    //Executa o .login se o usuario for != null
    //Exemplo: return usuario != null ? usuario.login : null;
    //return usuario?.login;

    return null;
  }

  Future<String> cadastrarUsuario(CadastrarUsuarioRequest request) async {
    request.codigo = gerarCodigoAleatorio();
    if (await usuarioRepository.cadastrarUsuario(request)) {
      await enviarEmailCodigoCadastro(request);
      return request.codigo.toString().padLeft(4, '0');
    }
    return '';
  }

  Future<String> enviarNovoCodigoEmailUsuario(
      CadastrarUsuarioRequest request) async {
    request.codigo = gerarCodigoAleatorio();
    if (await usuarioRepository.gravarNovoCodigoUsuario(request)) {
      await enviarEmailCodigoNovaSenha(request);
    }
    return request.codigo.toString().padLeft(4, '0');
  }

  Future<void> complementarUsuario(ComplementarUsuarioRequest request) async {
    await usuarioRepository.complementarUsuario(request);
  }

  Future<void> enviarEmailCodigoCadastro(
      CadastrarUsuarioRequest request) async {
    final usuario = await usuarioRepository.buscarPorLogin(request.login);
    EmailUtils().message(MailType.cadastro, usuario);
  }

  Future<void> enviarEmailCodigoNovaSenha(
      CadastrarUsuarioRequest request) async {
    final usuario = await usuarioRepository.buscarPorLogin(request.login);
    EmailUtils().message(MailType.novaSenha, usuario);
  }

  Future<void> enviarEmailCodigoCadAltFilho(
      CriarLoginFilhoDoPaiRequest request) async {
    final usuario = await usuarioRepository.buscarPorLogin(request.login);
    EmailUtils().message(MailType.cadastroFilho, usuario);
  }

  Future<UsuarioModel> buscarPorId(int id) async {
    return await usuarioRepository.buscarPorId(id);
  }

  Future<UsuarioModel> obterUsuarioPorLogin(String login) async {
    return await usuarioRepository.buscarPorLogin(login);
  }

  Future<UsuarioModel> usuarioValidado(String login) async {
    return await usuarioRepository.usuarioValidado(login);
  }

  Future<Map<String, dynamic>> consultarUsuarioPorLogin(String login) async {
    final r = await usuarioRepository.consultarUsuarioPorLogin(login);
    return {
      'id': r.id,
      'login': r.login,
      'pessoa': r.pessoa,
      'empresa': r.empresa,
      'email': r.email,
      'codigo': r.codigo,
      'idPai': r.idPai,
      'qtdeFilhos': await usuarioRepository.obterQtdeFilhos(r.id),
    };
  }

  Future<UsuarioModel> usuarioBloqueado(String login) async {
    return await usuarioRepository.usuarioBloqueado(login);
  }

  int gerarCodigoAleatorio() {
    final Random random = Random();
    return random.nextInt(10000);
  }

  Future<UsuarioModel> usuarioAdmin(String login) async {
    return await usuarioRepository.usuarioAdmin(login);
  }

  Future<void> apagarCadastroInicialDoUsuario(
      ExcluirUsuarioRequest request) async {
    await usuarioRepository.apagarCadastroInicialDoUsuario(request);
  }

  Future<UsuarioModel> obterUsuarioPorLoginEmail(
      String login, String email) async {
    return await usuarioRepository.buscarPorLoginEmail(login, email);
  }

  Future<UsuarioModel> codigoValido(
      String login, String email, String codigo) async {
    return await usuarioRepository.codigoValido(login, email, codigo);
  }

  Future<void> gravarNovaSenhaUsuario(CadastrarUsuarioRequest request) async {
    await usuarioRepository.gravarNovaSenhaUsuario(request);
  }

  Future<List<UsuarioModel>> obterUsuariosFilhos(String login) async {
    final idDoLogin = await usuarioRepository.obterIdPorLogin(login);
    return usuarioRepository.obterUsuariosFilhosPorIdPai(idDoLogin);
  }

  Future<String> criarAlterarLoginFilhoDoPai(
      CriarLoginFilhoDoPaiRequest request) async {
    //Não pode cadastrar um Usuário com Login já existente.
    if ((request.operacao == 'CAD') &&
        (await usuarioRepository.buscarPorLogin(request.login) != null)) {
      return 'Login já existe. Informe outro Login para criar o Usuário.';
    }
    //Não pode alterar um Usuário com Login não existente.
    if ((request.operacao == 'ALT') &&
        (await usuarioRepository.buscarPorId(request.id) == null)) {
      return 'Id não existe. Informe outro Id existente para alterar o Usuário.';
    }

    final loginPai = await usuarioRepository.buscarPorId(request.idPai);
    final codigo = gerarCodigoAleatorio();
    request.empresa = loginPai.empresa;
    request.codigo = codigo;
    request.idSistema = await usuarioRepository
        .buscarPorId(request.idPai)
        .then((res) => res.usuariosistema.id);

    if (request.operacao == 'CAD') {
      request.ativo = 'S'; //Só no cadastro entra como ativo.
      if (await usuarioRepository.cadastrarUsuarioFilho(request)) {
        await enviarEmailCodigoCadAltFilho(request);
        return 'Usuário criado com sucesso.';
      }
    }
    if (request.operacao == 'ALT') {
      if (await usuarioRepository.alterarUsuarioFilho(request)) {
        await enviarEmailCodigoCadAltFilho(request);
        return 'Usuário alterado com sucesso.';
      }
    }
    return null;
  }

  Future<String> delegarUsuario(UsuarioDelegarRequest request) async {
    if (await usuarioRepository.delegarUsuario(request)) {
      return 'Usuário delegado com sucesso.';
    }
    return null;
  }

  Future<Map<String, dynamic>> consultarUsuarioPorId(int id) async {
    final r = await usuarioRepository.consultarUsuarioPorId(id);
    return {
      'id': r.id,
      'login': r.login,
      'pessoa': r.pessoa,
      'empresa': r.empresa,
      'email': r.email,
      'codigo': r.codigo,
      'idPai': r.idPai,
      'qtdeFilhos': await usuarioRepository.obterQtdeFilhos(r.id),
    };
  }

  Future<String> criarAcessoUsuario(UsuarioAcessoRequest request) async {
    if (await usuarioRepository.jaExisteAcessoUsuarioAoMenu(request)) {
      return 'Usuário já possui este acesso.';
    }
    if (await usuarioRepository.criarAcessoUsuario(request)) {
      return 'Acesso do Usuário foi criado com sucesso.';
    }
    return null;
  }

  Future<String> apagarAcessoUsuario(UsuarioAcessoRequest request) async {
    if (await usuarioRepository.jaExisteAcessoUsuarioAoMenu(request) == false) {
      return 'Usuário não possui este acesso.';
    }
    if (await usuarioRepository.apagarAcessoUsuario(request)) {
      return 'Acesso do Usuário foi apagado com sucesso.';
    }
    return null;
  }

  Future<List<UsuarioAcessoModel>> obterAcessosUsuario(String login) async {
    final idDoLogin = await usuarioRepository.obterIdPorLogin(login);
    return await usuarioRepository.obterAcessosUsuario(idDoLogin);
  }

  Future<List<UsuarioAcessoModel>> obterAcessosDisponiveis(
      String login, String loginPai) async {
    final idDoLogin = await usuarioRepository.obterIdPorLogin(login);

    final idPaiDoLogin = loginPai.trim().isNotEmpty
        ? await usuarioRepository.obterIdPorLogin(loginPai)
        : await usuarioRepository.obterIdPaiDoLogin(login);

    final menusPai = await usuarioRepository.obterAcessosUsuario(idPaiDoLogin);
    final menusFilho = await usuarioRepository.obterAcessosUsuario(idDoLogin);
    List<UsuarioAcessoModel> acessos;
    acessos = <UsuarioAcessoModel>[];
    for (int i = 0; i < menusPai.length; i++) {
      final itemPai = menusPai[i];
      acessos.add(itemPai);
    }
    for (var itemPai in menusPai) {
      for (var itemFilho in menusFilho) {
        if (itemFilho.menu.id == itemPai.menu.id) {
          acessos.removeWhere((w) => w.menu.id == itemFilho.menu.id);
        }
      }
    }
    return acessos;
  }

  Future<String> gravarProprietario(GravarProprietarioRequest request) async {
    if (await usuarioRepository.gravarProprietario(request)) {
      return 'Proprietário gravado com sucesso.';
    }
    return null;
  }

  Future<List<Map<String, dynamic>>> obterUsuariosEquipeInteira(
      String login) async {
    try {
      final equipe = await obterUsuariosEquipe(login);
      final List<Map<String, dynamic>> pessoas = <Map<String, dynamic>>[];
      for (var pessoa in equipe) {
        pessoas.add({
          'id': pessoa.id,
          'idPai': pessoa.idPai,
          'login': pessoa.login,
          'email': pessoa.email,
          'empresa': pessoa.empresa,
          'pessoa': pessoa.pessoa,
          'codigo': pessoa.codigo,
          'ativo': pessoa.ativo,
          'usuariosituacao': pessoa.usuariosituacao.id,
          'usuariosistema': pessoa.usuariosistema.id,
          'qtdeFilhos': await usuarioRepository.obterQtdeFilhos(pessoa.id),
        });
      }
      return pessoas.toList();
    } catch (e) {
      return [
        {'erro: ': e}
      ];
    }
  }

  Future<List<UsuarioModel>> obterUsuariosEquipe(String login) async {
    try {
      final List<UsuarioModel> ret = <UsuarioModel>[];
      final idPai = await usuarioRepository.obterIdPorLogin(login);
      final filhos = await usuarioRepository.obterUsuariosFilhosPorIdPai(idPai);
      for (int i = 0; i < filhos.length; i++) {
        final usuarioFilho = filhos[i];
        final filhosFilhos = await obterUsuariosEquipe(usuarioFilho.login);
        ret.add(usuarioFilho);
        for (int x = 0; x < filhosFilhos.length; x++) {
          final usuarioFilhoFilho = filhosFilhos[x];
          ret.add(usuarioFilhoFilho);
        }
      }
      return ret;
    } catch (e) {
      print('ERRO [obterUsuariosEquipe]: $e');
      return null;
    }
  }

  Future<List<int>> obterListaIdsUsuariosFilhosPorLoginPai(
      String loginUsuarioPai) async {
    final List<int> ret = <int>[];
    final equipe = await obterUsuariosEquipe(loginUsuarioPai);
    for (var membro in equipe) {
      ret.add(membro.id);
    }
    return ret;
  }

  Future<String> bloqueioAcessoUsuario(
      UsuarioAcessoBloqueioRequest request) async {
    final usuario = await usuarioRepository.consultarUsuarioPorId(request.id);
    return await usuarioRepository.bloqueioAcessoUsuario(
        request, usuario.ativo);
  }
}
