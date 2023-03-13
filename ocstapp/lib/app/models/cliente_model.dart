import 'dart:convert';

class ClienteModel {
  int id;
  int usuarioId;
  String usuarioNome;
  String nome;
  String celular;
  String email;
  String tags;
  ClienteModel({
    this.id,
    this.usuarioId,
    this.usuarioNome,
    this.nome,
    this.celular,
    this.email,
    this.tags,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'usuarioId': usuarioId,
      'usuarioNome': usuarioNome,
      'nome': nome,
      'celular': celular,
      'email': email,
      'tags': tags,
    };
  }

  static ClienteModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ClienteModel(
      id: map['id'],
      usuarioId: map['usuarioId'],
      usuarioNome: map['usuarioNome'],
      nome: map['nome'],
      celular: map['celular'],
      email: map['email'],
      tags: map['tags'],
    );
  }

  String toJson() => json.encode(toMap());

  static ClienteModel fromJson(String source) => fromMap(json.decode(source));
}
