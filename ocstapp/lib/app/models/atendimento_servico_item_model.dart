import 'dart:convert';

class AtendimentoServicoItemModel {
  int id;
  int itemAtendimentoServicoId;
  int atendimentoServicoId;
  int itemAtendimentoServicoQtde;
  String itemAtendimentoServicoObservacao;
  int produtoId;
  String produtoCodigo;
  String produtoNome;
  String produtoDescricao;
  double produtoPreco;
  String produtoTags;
  AtendimentoServicoItemModel({
    this.id,
    this.itemAtendimentoServicoId,
    this.atendimentoServicoId,
    this.itemAtendimentoServicoQtde,
    this.itemAtendimentoServicoObservacao,
    this.produtoId,
    this.produtoCodigo,
    this.produtoNome,
    this.produtoDescricao,
    this.produtoPreco,
    this.produtoTags,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'itemAtendimentoServicoId': itemAtendimentoServicoId,
      'atendimentoServicoId': atendimentoServicoId,
      'itemAtendimentoServicoQtde': itemAtendimentoServicoQtde,
      'itemAtendimentoServicoObservacao': itemAtendimentoServicoObservacao,
      'produtoId': produtoId,
      'produtoCodigo': produtoCodigo,
      'produtoNome': produtoNome,
      'produtoDescricao': produtoDescricao,
      'produtoPreco': produtoPreco,
      'produtoTags': produtoTags,
    };
  }

  factory AtendimentoServicoItemModel.fromMap(Map<String, dynamic> map) {
    return AtendimentoServicoItemModel(
      id: map['id'],
      itemAtendimentoServicoId: map['itemAtendimentoServicoId'],
      atendimentoServicoId: map['atendimentoServicoId'],
      itemAtendimentoServicoQtde: map['itemAtendimentoServicoQtde'],
      itemAtendimentoServicoObservacao: map['itemAtendimentoServicoObservacao'],
      produtoId: map['produtoId'],
      produtoCodigo: map['produtoCodigo'],
      produtoNome: map['produtoNome'],
      produtoDescricao: map['produtoDescricao'],
      produtoPreco: map['produtoPreco'],
      produtoTags: map['produtoTags'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AtendimentoServicoItemModel.fromJson(String source) =>
      AtendimentoServicoItemModel.fromMap(json.decode(source));
}
