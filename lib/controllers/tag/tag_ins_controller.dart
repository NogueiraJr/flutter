import 'package:ocstapi/controllers/tag/dto/tag_ins_request.dart';
import 'package:ocstapi/ocstapi.dart';
import 'package:ocstapi/services/tag_service.dart';

class TagInsController extends ResourceController {
  TagInsController(this.context) : service = TagService(context);
  ManagedContext context;
  final TagService service;

  @Operation.post()
  Future<Response> tagIns(@Bind.body() TagInsRequest request) async {
    final validate = request.validate();
    if (validate.isNotEmpty) {
      return Response.badRequest(body: validate);
    }
    try {
      return Response.ok(await service.tagIns(request));
    } catch (e) {
      print(e);
      return Response.serverError(
          body: {'message': 'ERRO [tagIns]', 'exception': e.toString()});
    }
  }
}
