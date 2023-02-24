import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:OCSTApp/app/repositories/usuario_repository.dart';

class CustomDio {
  var _dio;

  CustomDio() {
    _dio = Dio(_options);
  }

  CustomDio.withAuthentication() {
    _dio = Dio(_options);
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: _onRequest,
      onResponse: _onResponse,
      onError: _onError,
    ));
  }

  BaseOptions _options = BaseOptions(
      baseUrl: /*DEV*/ 'http://192.168.15.127:8888',

      //Platform.isAndroid ? 'http://192.168.15.5' : 'http://localhost:8888',
      connectTimeout: 30000,
      receiveTimeout: 30000);

  Dio get instance => _dio;

  _onRequest(RequestOptions options) async {
    var token = await UsuarioRepository().getToken();
    options.headers['authorization'] = token;
  }

  _onResponse(Response e) {
    print('################# Response Log');
    print(e.data);
    print('################# Response Log');
  }

  _onError(DioError e) {
    if (e.response?.statusCode == 403 || e.response.statusCode != 401) {
      UsuarioRepository().logout();
      Get.offAllNamed('/');
    }
    return e;
  }
}
