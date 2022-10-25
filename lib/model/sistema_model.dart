import 'package:ocstapi/model/menu_sistema_model.dart';
import 'package:ocstapi/model/usuario_model.dart';

import '../ocstapi.dart';

class SistemaModel extends ManagedObject<_SistemaModel>
    implements _SistemaModel {}

@Table(name: 'sistema')
class _SistemaModel {
  @Column(primaryKey: true, autoincrement: true)
  int id;

  @Column()
  String sistemaRef;

  @Column()
  String sistemaNome;

  @Column()
  String sistemaDescricao;

  @Column()
  String sistemaFigura;

  @Column()
  String sistemaAtivo;

  ManagedSet<UsuarioModel> usuarios;

  ManagedSet<MenuSistemaModel> sistemas;
}
