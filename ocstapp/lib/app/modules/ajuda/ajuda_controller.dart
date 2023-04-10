import 'package:OCSTApp/app/repositories/usuario_repository.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';

part 'ajuda_controller.g.dart';

class AjudaController = _AjudaControllerBase with _$AjudaController;

abstract class _AjudaControllerBase with Store {
  final UsuarioRepository usuarioRepository;
  _AjudaControllerBase(this.usuarioRepository);

  @action
  Future<void> vaiParaLogin() async {
    usuarioRepository.setBoasVindas("S");
    Get.offAllNamed('/login');
  }
}
