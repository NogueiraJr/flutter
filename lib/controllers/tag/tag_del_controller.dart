import 'package:ocstapi/controllers/tag/dto/tag_del_request.dart';
import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/services/tag_service.dart';

class TagDelController extends ResourceController {
  TagDelController(this.context) : service = TagService(context);
  ManagedContext context;
  final TagService service;

  @Operation.post()
  Future<Response> tagDel(@Bind.body() TagDelRequest request) async {
    final validate = request.validate();
    if (validate.isNotEmpty) {
      return Response.badRequest(body: validate);
    }
    try {
      return Response.ok(await service.tagDel(request));
    } catch (e) {
      print(e);
      return Response.serverError(
          body: {'message': 'ERRO [tagDel]', 'exception': e.toString()});
    }
  }
}
