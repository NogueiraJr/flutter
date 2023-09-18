import 'package:OCSTApp/app/modules/celulas/dados/fornecedor/crud/fornecedor_cadastro/fornecedor_cadastro_controller.dart';
import 'package:OCSTApp/app/repositories/fornecedor_repository.dart';
import 'package:OCSTApp/app/repositories/usuario_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:OCSTApp/app/modules/celulas/dados/fornecedor/crud/fornecedor_cadastro/fornecedor_cadastro_page.dart';

class FornecedorCadastroModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => FornecedorCadastroController(
            i.get<FornecedorRepository>(), i.get<UsuarioRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (_, args) => FornecedorCadastroPage()),
      ];

  static Inject get to => Inject<FornecedorCadastroModule>.of();
}
