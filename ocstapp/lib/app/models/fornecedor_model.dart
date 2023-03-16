import 'dart:convert';

class FornecedorModel {
  int id;
  int usuarioId;
  String usuarioNome;
  String nome;
  String telefone;
  String email;
  String tags;
  FornecedorModel({
    this.id,
    this.usuarioId,
    this.usuarioNome,
    this.nome,
    this.telefone,
    this.email,
    this.tags,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'usuarioId': usuarioId,
      'usuarioNome': usuarioNome,
      'nome': nome,
      'telefone': telefone,
      'email': email,
      'tags': tags,
    };
  }

  factory FornecedorModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return FornecedorModel(
      id: map['id'],
      usuarioId: map['usuarioId'],
      usuarioNome: map['usuarioNome'],
      nome: map['nome'],
      telefone: map['telefone'],
      email: map['email'],
      tags: map['tags'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FornecedorModel.fromJson(String source) =>
      FornecedorModel.fromMap(json.decode(source));
}
