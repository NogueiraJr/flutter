import 'package:OCSTApp/app/modules/celulas/dados/fornecedor/crud/fornecedor_editar/fornecedor_editar_controller.dart';
import 'package:OCSTApp/app/repositories/fornecedor_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:OCSTApp/app/modules/celulas/dados/fornecedor/crud/fornecedor_editar/fornecedor_editar_page.dart';

class FornecedorEditarModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => FornecedorEditarController(i.get<FornecedorRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (_, args) => FornecedorEditarPage()),
      ];

  static Inject get to => Inject<FornecedorEditarModule>.of();
}
