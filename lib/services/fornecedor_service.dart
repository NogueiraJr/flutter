import 'package:ocstapi/controllers/fornecedor/dto/fornecedor_del_request.dart';
import 'package:ocstapi/controllers/fornecedor/dto/fornecedor_ins_request.dart';
import 'package:ocstapi/controllers/fornecedor/dto/fornecedor_upd_request.dart';
import 'package:ocstapi/model/fornecedor_model.dart';
import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/repository/fornecedor_repository.dart';
import 'package:ocstapi/repository/usuario_repository.dart';
import 'package:ocstapi/services/usuario_service.dart';

class FornecedorService {
  FornecedorService(this.context)
      : repository = FornecedorRepository(context),
        usuarioRepository = UsuarioRepository(context),
        usuarioService = UsuarioService(context);
  final ManagedContext context;
  final FornecedorRepository repository;
  final UsuarioRepository usuarioRepository;
  final UsuarioService usuarioService;

  Future<FornecedorModel> fornecedorIns(FornecedorInsRequest request) async {
    return await repository.fornecedorIns(request);
  }

  Future<bool> fornecedorUpd(FornecedorUpdRequest request) async {
    return await repository.fornecedorUpd(request);
  }

  Future<bool> fornecedorDel(FornecedorDelRequest request) async {
    return await repository.fornecedorDel(request);
  }

  Future<FornecedorModel> obterFornecedorPorId(int id) async {
    return await repository.obterFornecedorPorId(id);
  }

  Future<List<FornecedorModel>> obterFornecedoresPorIdUsuario(
      int idUsuario) async {
    return await repository.obterFornecedoresPorIdUsuario(idUsuario);
  }

  Future<List<FornecedorModel>> obterFornecedoresPorNome(String nome) async {
    return await repository.obterFornecedoresPorNome(nome);
  }

  Future<List<FornecedorModel>> obterFornecedoresPorTelefone(
      String celular) async {
    return await repository.obterFornecedoresPorTelefone(celular);
  }

  Future<List<FornecedorModel>> obterFornecedoresPorEmail(String email) async {
    return await repository.obterFornecedoresPorEmail(email);
  }

  Future<List<FornecedorModel>> obterAmostraFornecedoresDaEmpresa(
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

    final fornecedoresEmpresa =
        await repository.obterAmostraFornecedoresDaEmpresa(ids, qtdeAmostra);
    return fornecedoresEmpresa;
  }
}
