import 'dart:convert';

class MenuModel {
  int id;
  int idMenu;
  String menuPai; //GRC, DDS, OPR, UTL, RLT
  String menuRef; //cadastroClientes, cadastroProdutos
  String menuNome;
  String menuDescricao;
  String menuFigura;
  String menuModuloExec;
  String menuAtivo; //0 ou 1

  MenuModel({
    this.id,
    this.idMenu,
    this.menuPai,
    this.menuRef,
    this.menuNome,
    this.menuDescricao,
    this.menuFigura,
    this.menuModuloExec,
    this.menuAtivo,
  });

  MenuModel copyWith({
    int id,
    int idMenu,
    String menuPai,
    String menuRef,
    String menuNome,
    String menuDescricao,
    String menuFigura,
    String menuModuloExec,
    String menuAtivo,
  }) {
    return MenuModel(
      id: id ?? this.id,
      idMenu: idMenu ?? this.idMenu,
      menuPai: menuPai ?? this.menuPai,
      menuRef: menuRef ?? this.menuRef,
      menuNome: menuNome ?? this.menuNome,
      menuDescricao: menuDescricao ?? this.menuDescricao,
      menuFigura: menuFigura ?? this.menuFigura,
      menuModuloExec: menuModuloExec ?? this.menuModuloExec,
      menuAtivo: menuAtivo ?? this.menuAtivo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idMenu': idMenu,
      'menuPai': menuPai,
      'menuRef': menuRef,
      'menuNome': menuNome,
      'menuDescricao': menuDescricao,
      'menuFigura': menuFigura,
      'menuModuloExec': menuModuloExec,
      'menuAtivo': menuAtivo,
    };
  }

  static MenuModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return MenuModel(
      id: map['id'],
      idMenu: map['idMenu'],
      menuPai: map['menuPai'],
      menuRef: map['menuRef'],
      menuNome: map['menuNome'],
      menuDescricao: map['menuDescricao'],
      menuFigura: map['menuFigura'],
      menuModuloExec: map['menuModuloExec'],
      menuAtivo: map['menuAtivo'],
    );
  }

  String toJson() => json.encode(toMap());

  static MenuModel fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'MenuModel(id: $id, idMenu: $idMenu, menuPai: $menuPai, menuRef: $menuRef, menuNome: $menuNome, menuDescricao: $menuDescricao, menuFigura: $menuFigura, menuModuloExec: $menuModuloExec, menuAtivo: $menuAtivo)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is MenuModel &&
        o.id == id &&
        o.idMenu == idMenu &&
        o.menuPai == menuPai &&
        o.menuRef == menuRef &&
        o.menuNome == menuNome &&
        o.menuDescricao == menuDescricao &&
        o.menuFigura == menuFigura &&
        o.menuModuloExec == menuModuloExec &&
        o.menuAtivo == menuAtivo;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        idMenu.hashCode ^
        menuPai.hashCode ^
        menuRef.hashCode ^
        menuNome.hashCode ^
        menuDescricao.hashCode ^
        menuFigura.hashCode ^
        menuModuloExec.hashCode ^
        menuAtivo.hashCode;
  }
}
