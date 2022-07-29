import 'package:intl/intl.dart';
import 'package:ocstapi/controllers/movimentacoes/dto/apagar_movimentacao_request.dart';
import 'package:ocstapi/controllers/movimentacoes/dto/apagar_parcelas_movimentacao_request.dart';
import 'package:ocstapi/controllers/movimentacoes/dto/salvar_movimentacao_request.dart';
import 'package:ocstapi/model/usuario_model.dart';
import 'package:ocstapi/services/movimentacoes_service.dart';

import '../../ocstapi.dart';

class MovimentacoesParcelasDelController extends ResourceController {
  MovimentacoesParcelasDelController(this.context)
      : service = MovimentacoesService(context);
  final ManagedContext context;
  final MovimentacoesService service;

  @Operation.post()
  Future<Response> apagarParcelasMovimento(
      @Bind.body() ApagarParcelasMovimentacaoRequest requestDel) async {
    try {
      final validate = requestDel.validate();
      if (validate.isNotEmpty) {
        return Response.badRequest(body: validate);
      }
      await service.apagarParcelasMovimentacao(requestDel);
      return Response.ok({});
    } catch (e) {
      return Response.serverError(
          body: {'message': 'Erro ao apagar parcelas Movimentação'});
    }
  }
}
