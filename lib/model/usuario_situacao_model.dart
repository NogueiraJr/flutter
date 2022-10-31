import 'package:ocstapi/model/usuario_model.dart';

import '../ocstapi.dart';

class UsuarioSituacaoModel extends ManagedObject<_UsuarioSituacaoModel>
    implements _UsuarioSituacaoModel {}

@Table(name: 'usuario_situacao')
class _UsuarioSituacaoModel {
  @Column(primaryKey: true, autoincrement: true)
  int id;

  @Column()
  String situacao;

  @Column()
  String descricao;

  ManagedSet<UsuarioModel> usuarios;
}
