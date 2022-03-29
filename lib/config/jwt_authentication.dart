import 'package:jaguar_jwt/jaguar_jwt.dart';
import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/services/usuario_service.dart';
import 'package:ocstapi/utils/jwt_utils.dart';

class JwtAuthentication extends Controller {
  JwtAuthentication(this.context) : service = UsuarioService(context);

  final ManagedContext context;
  final UsuarioService service;

  @override
  FutureOr<RequestOrResponse> handle(Request request) async {
    final authReder = request.raw.headers['authorization'];
    if (authReder == null || authReder.isEmpty) {
      return Response.unauthorized();
    }

    final authHeaderContent = authReder[0]?.split(" ");
    if (authHeaderContent.length != 2 || authHeaderContent[0] != 'Bearer') {
      return Response.badRequest(body: {'message': 'Token inválido'});
    }

    try {
      final token = authHeaderContent[1];
      final JwtClaim claimSet = JwtUtils.verificarToken(token);
      final userId = int.tryParse(claimSet.toJson()['sub'].toString());
      if (userId == null) {
        throw JwtException;
      }
      final dataAtual = DateTime.now().toUtc();
      if (dataAtual.isAfter(claimSet.expiry)) {
        return Response.unauthorized();
      }

      final usuario = await service.buscarPorId(userId);

      request.attachments['userId'] = usuario;

      return request;
    } on JwtException catch (e) {
      print(e);
      return Response.unauthorized();
    }
  }
}
