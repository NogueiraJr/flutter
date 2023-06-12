import 'package:OCSTApp/app/modules/celulas/dados/cliente/cliente_escolher/escolher_cliente_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:OCSTApp/app/modules/celulas/dados/cliente/cliente_escolher/escolher_cliente_page.dart';

class EscolherClienteModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => EscolherClienteController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => EscolherClientePage()),
      ];

  static Inject get to => Inject<EscolherClienteModule>.of();
}
