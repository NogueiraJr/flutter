import 'package:jaguar_jwt/jaguar_jwt.dart';
import 'package:ocstapi/model/usuario_model.dart';

class JwtUtils {
  static const String _jwtChavePrivada =
      'SUA_CHAVE_PRIVADA_AQUI';
  static String gerarTokenJwt(UsuarioModel usuario) {
    final claimSet = JwtClaim(
        issuer: 'http://localhost',
        subject: usuario.id.toString(),
        otherClaims: <String, dynamic>{},
        maxAge: const Duration(days: 2));

    final token = 'Bearer ${issueJwtHS256(claimSet, _jwtChavePrivada)}';

    return token;
  }

  static JwtClaim verificarToken(String token) {
    return verifyJwtHS256Signature(token, _jwtChavePrivada);
  }
}
