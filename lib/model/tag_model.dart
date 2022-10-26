import 'package:ocstapi/model/usuario_model.dart';
import '../ocstapi.dart';

class TagModel extends ManagedObject<_TagModel> implements _TagModel {}

@Table(name: 'tag')
class _TagModel {
  @Column(primaryKey: true, autoincrement: true)
  int id;

  @Relate(#tags)
  UsuarioModel usuario;

  @Column()
  String nome;

  @Column(nullable: true)
  String descricao;
}
