import 'package:ocstapi/routers/atendimento_servico_info_router.dart';
import 'package:ocstapi/routers/atendimento_servico_item_router.dart';
import 'package:ocstapi/routers/automotivo_router.dart';
import 'package:ocstapi/routers/categoria_router.dart';
import 'package:ocstapi/routers/cliente_manequim_router.dart';
import 'package:ocstapi/routers/cliente_pet_router.dart';
import 'package:ocstapi/routers/cliente_router.dart';
import 'package:ocstapi/routers/cliente_veiculo_router.dart';
import 'package:ocstapi/routers/fornecedor_router.dart';
import 'package:ocstapi/routers/locacao_roupa_router.dart';
import 'package:ocstapi/routers/menus_router.dart';
import 'package:ocstapi/routers/movimentacoes_router.dart';
import 'package:ocstapi/routers/atendimento_servico_router.dart';
import 'package:ocstapi/routers/produto_router.dart';
import 'package:ocstapi/routers/sistema_router.dart';
import 'package:ocstapi/routers/tag_router.dart';
import 'package:ocstapi/routers/usuarios_router.dart';

import 'ocstapi.dart';
import 'package:ocstapi/model/usuario_model.dart';
import 'package:ocstapi/model/categoria_model.dart';
import 'package:ocstapi/model/movimentacao_model.dart';
import 'package:ocstapi/model/menu_model.dart';
import 'package:ocstapi/model/usuario_situacao_model.dart';
import 'package:ocstapi/model/usuario_acesso_model.dart';
import 'package:ocstapi/model/sistema_model.dart';
import 'package:ocstapi/model/cliente_model.dart';
import 'package:ocstapi/model/produto_model.dart';
import 'package:ocstapi/model/fornecedor_model.dart';
import 'package:ocstapi/model/automotivo_model.dart';
import 'package:ocstapi/model/locacao_roupa_model.dart';

/// This type initializes an application.
///
/// Override methods in this class to set up routes and initialize services like
/// database connections. See http://aqueduct.io/docs/http/channel/.
class OcstapiChannel extends ApplicationChannel {
  ManagedContext context;

  /// Initialize services in this method.
  ///
  /// Implement this method to initialize services, read values from [options]
  /// and any other initialization required before constructing [entryPoint].
  ///
  /// This method is invoked prior to [entryPoint] being accessed.
  @override
  Future prepare() async {
    logger.onRecord.listen(
        (rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));

    final config = OcstapiConfiguration(options.configurationFilePath);
    context = contextWithConnectionInfo(config.database);
  }

  /// Construct the request channel.
  ///
  /// Return an instance of some [Controller] that will be the initial receiver
  /// of all [Request]s.
  ///
  /// This method is invoked after [prepare].
  @override
  Controller get entryPoint {
    final router = Router();
    //Delegar a geração das rotas para outras classes.
    UsuariosRouter.configurar(router, context);
    CategoriaRouter.configurar(router, context);
    MovimentacoesRouter.configurar(router, context);
    MenusRouter.configurar(router, context);
    SistemaRouter.configurar(router, context);
    ClienteRouter.configurar(router, context);
    ClienteManequimRouter.configurar(router, context);
    ClienteVeiculoRouter.configurar(router, context);
    ClientePetRouter.configurar(router, context);
    ProdutoRouter.configurar(router, context);
    FornecedorRouter.configurar(router, context);
    AutomotivoRouter.configurar(router, context);
    LocacaoRoupaRouter.configurar(router, context);
    AtendimentoServicoRouter.configurar(router, context);
    AtendimentoServicoInfoRouter.configurar(router, context);
    AtendimentoServicoItemRouter.configurar(router, context);
    TagRouter.configurar(router, context);
    //
    return router;
  }

  /*
   * Helper methods
   */

  ManagedContext contextWithConnectionInfo(
      DatabaseConfiguration connectionInfo) {
    final dataModel = ManagedDataModel.fromCurrentMirrorSystem();
    final psc = PostgreSQLPersistentStore(
        connectionInfo.username,
        connectionInfo.password,
        connectionInfo.host,
        connectionInfo.port,
        connectionInfo.databaseName);

    return ManagedContext(dataModel, psc);
  }
}

/// An instance of this class reads values from a configuration
/// file specific to this application.
///
/// Configuration files must have key-value for the properties in this class.
/// For more documentation on configuration files, see https://aqueduct.io/docs/configure/ and
/// https://pub.dartlang.org/packages/safe_config.
class OcstapiConfiguration extends Configuration {
  OcstapiConfiguration(String fileName) : super.fromFile(File(fileName));

  DatabaseConfiguration database;
}
