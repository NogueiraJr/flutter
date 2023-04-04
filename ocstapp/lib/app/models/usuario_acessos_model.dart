import 'dart:convert';

class UsuarioAcessosModel {
  int id;
  String login;
  String pessoa;
  String empresa;
  String email;
  String ativo;
  int codigo;
  int idPai;
  int qtdeFilhos;

  UsuarioAcessosModel(
      {this.id,
      this.login,
      this.pessoa,
      this.empresa,
      this.email,
      this.ativo,
      this.codigo,
      this.idPai,
      this.qtdeFilhos});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'login': login,
      'pessoa': pessoa,
      'empresa': empresa,
      'email': email,
      'ativo': ativo,
      'codigo': codigo,
      'idPai': idPai,
      'qtdeFilhos': qtdeFilhos,
    };
  }

  static UsuarioAcessosModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UsuarioAcessosModel(
      id: map['id'],
      login: map['login'],
      pessoa: map['pessoa'],
      empresa: map['empresa'],
      email: map['email'],
      ativo: map['ativo'],
      codigo: map['codigo'],
      idPai: map['idPai'],
      qtdeFilhos: map['qtdeFilhos'],
    );
  }

  String toJson() => json.encode(toMap());

  static UsuarioAcessosModel fromJson(String source) =>
      fromMap(json.decode(source));
}
