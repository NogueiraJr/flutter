import 'dart:convert';

class ProdutoModel {
  int id;
  int usuarioId;
  String usuarioNome;
  String codigo;
  String nome;
  String descricao;
  double custo;
  double preco;
  String tags;
  int compostoDe;
  int compoe;
  ProdutoModel({
    this.id,
    this.usuarioId,
    this.usuarioNome,
    this.codigo,
    this.nome,
    this.descricao,
    this.custo,
    this.preco,
    this.tags,
    this.compostoDe,
    this.compoe,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'usuarioId': usuarioId,
      'usuarioNome': usuarioNome,
      'codigo': codigo,
      'nome': nome,
      'descricao': descricao,
      'custo': custo,
      'preco': preco,
      'tags': tags,
      'compostoDe': compostoDe,
      'compoe': compoe,
    };
  }

  factory ProdutoModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ProdutoModel(
      id: map['id'],
      usuarioId: map['usuarioId'],
      usuarioNome: map['usuarioNome'],
      codigo: map['codigo'],
      nome: map['nome'],
      descricao: map['descricao'],
      custo: map['custo'],
      preco: map['preco'],
      tags: map['tags'],
      compostoDe: map['compostoDe'],
      compoe: map['compoe'],
    );
  }

  factory ProdutoModel.fromMapResumo(Map<String, dynamic> map) {
    if (map == null) return null;

    return ProdutoModel(
      id: map['id'],
      usuarioId: map['usuarioId'],
      usuarioNome: map['usuarioNome'],
      codigo: map['codigo'],
      nome: map['nome'],
      descricao: map['descricao'],
      custo: map['custo'],
      preco: map['preco'],
      tags: map['tags'],
      compostoDe: map['compostoDe'].length,
      compoe: map['compoe'].length,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProdutoModel.fromJson(String source) =>
      ProdutoModel.fromMap(json.decode(source));
}
