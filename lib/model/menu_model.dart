import 'package:ocstapi/model/menu_sistema_model.dart';
import 'package:ocstapi/model/usuario_acesso_model.dart';

import '../ocstapi.dart';

class MenuModel extends ManagedObject<_MenuModel> implements _MenuModel {}

@Table(name: 'menu')
class _MenuModel {
  @Column(primaryKey: true, autoincrement: true)
  int id;

  @Column()
  String menuPai; //GRC, DDS, OPR, UTL, RLT

  @Column(nullable: true)
  String menuOrdem; //00, 01, 02; 01A, 01B, 02A, 02B, etc.

  @Column()
  String menuRef; //cadastroClientes, cadastroProdutos

  @Column()
  String menuNome;

  @Column()
  String menuDescricao;

  @Column()
  String menuFigura;

  @Column()
  String menuModuloExec;

  @Column()
  String menuAtivo; //0 ou 1

  ManagedSet<UsuarioAcessoModel> acessos;

  ManagedSet<MenuSistemaModel> menus;
}
