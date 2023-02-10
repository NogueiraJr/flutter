import 'package:ocstapi/model/menu_model.dart';
import 'package:ocstapi/model/usuario_model.dart';

import '../ocstapi.dart';

class UsuarioAcessoModel extends ManagedObject<_UsuarioAcessoModel>
    implements _UsuarioAcessoModel {}

@Table(name: 'usuario_acesso')
class _UsuarioAcessoModel {
  @Column(primaryKey: true, autoincrement: true)
  int id;

  @Relate(#acessos)
  UsuarioModel usuario;

  @Relate(#acessos)
  MenuModel menu;
}
