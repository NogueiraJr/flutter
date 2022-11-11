import 'package:ocstapi/controllers/cliente_manequim/dto/cliente_manequim_ins_request.dart';
import 'package:ocstapi/controllers/cliente_manequim/dto/cliente_manequim_upd_request.dart';
import 'package:ocstapi/model/cliente_manequim_model.dart';
import 'package:ocstapi/repository/cliente_repository.dart';

import '../ocstapi.dart';

class ClienteManequimRepository {
  ClienteManequimRepository(this.context)
      : clienteRepository = ClienteRepository(context);
  final ManagedContext context;
  final ClienteRepository clienteRepository;

  Future<ClienteManequimModel> clienteManequimIns(
      ClienteManequimInsRequest request) async {
    try {
      final cliente =
          await clienteRepository.obterClientePorId(request.clienteId);
      final model = ClienteManequimModel();
      model.cliente = cliente;
      model.data = request.data;
      model.busto = request.busto ?? 0;
      model.cintura = request.cintura ?? 0;
      model.quadril = request.quadril ?? 0;
      model.altura = request.altura ?? 0;
      model.peso = request.peso ?? 0;
      model.pescoco = request.pescoco ?? 0;
      model.ombro = request.ombro ?? 0;
      model.torax = request.torax ?? 0;
      model.bracoLargura = request.bracoLargura ?? 0;
      model.bracoComprimento = request.bracoComprimento ?? 0;
      model.costasLargura = request.costasLargura ?? 0;
      model.quadrilAltura = request.quadrilAltura ?? 0;
      model.barriga = request.barriga ?? 0;
      model.coxaLargura = request.coxaLargura ?? 0;
      model.pernaComprimento = request.pernaComprimento ?? 0;
      model.observacao = request.observacao ?? "";
      return await context.insertObject(model);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> clienteManequimUpd(ClienteManequimUpdRequest request) async {
    try {
      final query = Query<ClienteManequimModel>(context)
        ..values.data = request.data
        ..values.busto = request.busto ?? 0 ?? 0
        ..values.cintura = request.cintura ?? 0
        ..values.quadril = request.quadril ?? 0
        ..values.altura = request.altura ?? 0
        ..values.peso = request.peso ?? 0
        ..values.pescoco = request.pescoco ?? 0
        ..values.ombro = request.ombro ?? 0
        ..values.torax = request.torax ?? 0
        ..values.bracoLargura = request.bracoLargura ?? 0
        ..values.bracoComprimento = request.bracoComprimento ?? 0
        ..values.costasLargura = request.costasLargura ?? 0
        ..values.quadrilAltura = request.quadrilAltura ?? 0
        ..values.barriga = request.barriga ?? 0
        ..values.coxaLargura = request.coxaLargura ?? 0
        ..values.pernaComprimento = request.pernaComprimento ?? 0
        ..values.observacao = request.observacao ?? ""
        ..where((w) => w.id).equalTo(request.id)
        ..where((w) => w.cliente.id).equalTo(request.clienteId);
      final ret = await query.update();
      return ret.isNotEmpty;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<ClienteManequimModel> obterClienteManequimPorId(int id) async {
    try {
      final query = Query<ClienteManequimModel>(context)
        ..where((w) => w.id).equalTo(id);
      return await query.fetchOne();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<ClienteManequimModel>> obterClienteManequinsPorIdCliente(
      int clienteId) async {
    try {
      final query = Query<ClienteManequimModel>(context)
        ..join(object: (j) => j.cliente)
        ..where((w) => w.cliente.id).equalTo(clienteId)
        ..sortBy((s) => s.data, QuerySortOrder.descending);
      return await query.fetch();
    } catch (e) {
      print(e);
      return null;
    }
  }
}
