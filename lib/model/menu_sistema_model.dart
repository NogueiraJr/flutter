import 'package:ocstapi/model/sistema_model.dart';

import '../ocstapi.dart';
import 'menu_model.dart';

class MenuSistemaModel extends ManagedObject<_MenuSistemaModel>
    implements _MenuSistemaModel {}

@Table(name: 'menu_sistema')
class _MenuSistemaModel {
  @Column(primaryKey: true, autoincrement: true)
  int id;

  @Relate(#sistemas)
  SistemaModel sistema;

  @Relate(#menus)
  MenuModel menu;
}
