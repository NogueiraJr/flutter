import 'dart:convert';

class TagModel {
  int id;
  int usuarioId;
  String nome;
  String descricao;
  TagModel({
    this.id,
    this.usuarioId,
    this.nome,
    this.descricao,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'usuarioId': usuarioId,
      'nome': nome,
      'descricao': descricao,
    };
  }

  factory TagModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return TagModel(
      id: map['id'],
      usuarioId: map['usuarioId'],
      nome: map['nome'],
      descricao: map['descricao'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TagModel.fromJson(String source) =>
      TagModel.fromMap(json.decode(source));
}
