import 'dart:convert';

import 'package:OCSTApp/app/models/produto_model.dart';

class ProdutoResumoModel {
  int id;
  int usuarioId;
  String usuarioNome;
  String codigo;
  String nome;
  String descricao;
  double custo;
  double preco;
  String tags;
  List compoe;
  List composto;
  ProdutoResumoModel({
    this.id,
    this.usuarioId,
    this.usuarioNome,
    this.codigo,
    this.nome,
    this.descricao,
    this.custo,
    this.preco,
    this.tags,
    this.composto,
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
      'composto': composto.toList(),
      'compoe': compoe.toList(),
    };
  }

  static ProdutoResumoModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ProdutoResumoModel(
      id: map['id'],
      usuarioId: map['usuarioId'],
      usuarioNome: map['usuarioNome'],
      codigo: map['codigo'],
      nome: map['nome'],
      descricao: map['descricao'],
      custo: map['custo'],
      preco: map['preco'],
      tags: map['tags'],
      composto: map['composto'],
      compoe: map['compoe'],
    );
  }

  String toJson() => json.encode(toMap());

  static ProdutoResumoModel fromJson(String source) =>
      fromMap(json.decode(source));
}
