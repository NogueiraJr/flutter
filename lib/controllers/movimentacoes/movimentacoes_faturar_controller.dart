import 'package:intl/intl.dart';
import 'package:ocstapi/controllers/movimentacoes/dto/apagar_movimentacao_request.dart';
import 'package:ocstapi/controllers/movimentacoes/dto/faturar_movimentacao_request.dart';
import 'package:ocstapi/controllers/movimentacoes/dto/salvar_movimentacao_request.dart';
import 'package:ocstapi/model/usuario_model.dart';
import 'package:ocstapi/services/movimentacoes_service.dart';

import '../../ocstapi.dart';

class MovimentacoesFaturarController extends ResourceController {
  MovimentacoesFaturarController(this.context)
      : service = MovimentacoesService(context);
  final ManagedContext context;
  final MovimentacoesService service;

  @Operation.post()
  Future<Response> faturar(
      @Bind.body() FaturarMovimentacaoRequest requestFat) async {
    try {
      final validate = requestFat.validate();
      if (validate.isNotEmpty) {
        return Response.badRequest(body: validate);
      }
      final usuario = request.attachments['userId'] as UsuarioModel;
      await service.faturarMovimentacao(usuario, requestFat);
      return Response.ok({});
    } catch (e) {
      return Response.serverError(
          body: {'message': 'Erro ao faturar Movimentação'});
    }
  }
}
