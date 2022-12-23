import 'package:ocstapi/config/jwt_authentication.dart';
import 'package:ocstapi/controllers/login_controller.dart';
import 'package:ocstapi/controllers/proprietario/gravar_proprietario_controller.dart';
import 'package:ocstapi/controllers/usuario/usuario_cadastro_controller.dart';
import 'package:ocstapi/controllers/usuario/usuario_complemento_controller.dart';
import 'package:ocstapi/controllers/usuario/usuario_controller.dart';
import 'package:ocstapi/controllers/usuario/usuario_nova_senha_controller.dart';
import 'package:ocstapi/controllers/usuario/usuario_nova_senha_informe_controller.dart';
import 'package:ocstapi/controllers/usuario_acesso/usuario_acesso_apagar_controller.dart';
import 'package:ocstapi/controllers/usuario_acesso/usuario_acesso_bloqueio_controller.dart';
import 'package:ocstapi/controllers/usuario_acesso/usuario_acesso_controller.dart';
import 'package:ocstapi/controllers/usuario_pai_filho/usuario_delegar_controller.dart';
import 'package:ocstapi/controllers/usuario_pai_filho/usuario_pai_filho_controller.dart';
import 'package:ocstapi/ocstapi.dart';

class UsuariosRouter {
  static void configurar(Router router, ManagedContext context) {
    router.route('/login').link(() => LoginController(context));
    router.route('/usuario').link(() => UsuarioController(context));
    router
        .route('/usuario/complementar')
        .link(() => UsuarioComplementoController(context));

    router
        .route('/usuario/novasenha')
        .link(() => UsuarioNovaSenhaController(context));

    router
        .route('/usuario/codigo/:login/:email/:codigo')
        .link(() => UsuarioNovaSenhaController(context));

    router
        .route('/usuario/gravarnovasenha')
        .link(() => UsuarioNovaSenhaInformeController(context));

    router
        .route('/usuario/situacao/:user')
        .link(() => UsuarioController(context));

    router
        .route('/usuario/admin/:userAdmin')
        .link(() => UsuarioController(context));

    router
        .route('/usuario/excluir')
        .link(() => UsuarioCadastroController(context));

    router
        .route('/usuario/bloqueado/:userBloc')
        .link(() => UsuarioController(context));

    router
        .route('/usuario/existe/:login')
        .link(() => UsuarioController(context));

    router
        .route('/usuario_email/existem/:login/:email')
        .link(() => UsuarioController(context));

    router
        .route('/usuario/consultar/:loginConsultar')
        .link(() => JwtAuthentication(context))
        .link(() => UsuarioController(context));

    router
        .route('/usuario/consultarId/:idConsultar')
        .link(() => JwtAuthentication(context))
        .link(() => UsuarioController(context));

    router
        .route('/usuario/consultar/usuariosfilhos/:login')
        .link(() => JwtAuthentication(context))
        .link(() => UsuarioPaiFilhoController(context));

    router
        .route('/usuario/liderados/:id')
        .link(() => JwtAuthentication(context))
        .link(() => UsuarioPaiFilhoController(context));

    router
        .route('/usuario/consultar/usuariosfilhos')
        .link(() => JwtAuthentication(context))
        .link(() => UsuarioPaiFilhoController(context));

    router
        .route('/colaborador')
        .link(() => JwtAuthentication(context))
        .link(() => UsuarioPaiFilhoController(context));

    router
        .route('/delegar')
        .link(() => JwtAuthentication(context))
        .link(() => UsuarioDelegarController(context));

    router
        .route('/usuario/criar/acesso')
        .link(() => JwtAuthentication(context))
        .link(() => UsuarioAcessoController(context));

    router
        .route('/usuario/apagar/acesso')
        .link(() => JwtAuthentication(context))
        .link(() => UsuarioAcessoApagarController(context));

    router
        .route('usuario/acessos/:login')
        .link(() => JwtAuthentication(context))
        .link(() => UsuarioAcessoController(context));

    router
        .route('usuario/acessos/disponiveis/:loginAcesso/:loginPai')
        .link(() => JwtAuthentication(context))
        .link(() => UsuarioAcessoController(context));

    router
        .route('/usuario/acesso/bloquear')
        .link(() => JwtAuthentication(context))
        .link(() => UsuarioAcessoApagarController(context));

    router
        .route('/proprietario')
        .link(() => JwtAuthentication(context))
        .link(() => GravarProprietarioController(context));

    router
        .route('/equipe/:loginInicial')
        .link(() => JwtAuthentication(context))
        .link(() => UsuarioPaiFilhoController(context));

    router
        .route('/usuarios/filhos/:loginUsuarioPai')
        .link(() => JwtAuthentication(context))
        .link(() => UsuarioController(context));

    router
        .route('/colaborador/bloqueio')
        .link(() => JwtAuthentication(context))
        .link(() => UsuarioAcessoBloqueioController(context));
  }
}
