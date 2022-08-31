import 'package:ocstapi/controllers/tag/dto/tag_upd_request.dart';
import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/services/tag_service.dart';

class TagUpdController extends ResourceController {
  TagUpdController(this.context) : service = TagService(context);
  ManagedContext context;
  final TagService service;

  @Operation.post()
  Future<Response> tagUpd(@Bind.body() TagUpdRequest request) async {
    final validate = request.validate();
    if (validate.isNotEmpty) {
      return Response.badRequest(body: validate);
    }
    try {
      return Response.ok(await service.tagUpd(request));
    } catch (e) {
      print(e);
      return Response.serverError(
          body: {'message': 'ERRO [tagUpd]', 'exception': e.toString()});
    }
  }
}
