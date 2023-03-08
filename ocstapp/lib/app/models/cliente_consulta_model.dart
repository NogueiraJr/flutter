import 'dart:convert';

class ClienteConsultaModel {
  int id;
  int usuarioId;
  String usuarioNome;
  String nome;
  String celular;
  String email;
  ClienteConsultaModel({
    this.id,
    this.usuarioId,
    this.usuarioNome,
    this.nome,
    this.celular,
    this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'usuarioId': usuarioId,
      'usuarioNome': usuarioNome,
      'nome': nome,
      'celular': celular,
      'email': email,
    };
  }

  static ClienteConsultaModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ClienteConsultaModel(
      id: map['id'],
      usuarioId: map['usuarioId'],
      usuarioNome: map['usuarioNome'],
      nome: map['nome'],
      celular: map['celular'],
      email: map['email'],
    );
  }

  String toJson() => json.encode(toMap());

  static ClienteConsultaModel fromJson(String source) =>
      fromMap(json.decode(source));
}
