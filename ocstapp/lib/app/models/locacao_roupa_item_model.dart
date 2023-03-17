import 'dart:convert';

class LocacaoRoupaItemModel {
  int itemLocacaoId;
  int locacaoRoupaId;
  int itemLocacaoQtde;
  String itemLocacaoObservacao;
  int produtoId;
  String produtoCodigo;
  String produtoNome;
  String produtoDescricao;
  double produtoPreco;
  String produtoTags;
  LocacaoRoupaItemModel({
    this.itemLocacaoId,
    this.locacaoRoupaId,
    this.itemLocacaoQtde,
    this.itemLocacaoObservacao,
    this.produtoId,
    this.produtoCodigo,
    this.produtoNome,
    this.produtoDescricao,
    this.produtoPreco,
    this.produtoTags,
  });

  Map<String, dynamic> toMap() {
    return {
      'itemLocacaoId': itemLocacaoId,
      'locacaoRoupaId': locacaoRoupaId,
      'itemLocacaoQtde': itemLocacaoQtde,
      'itemLocacaoObservacao': itemLocacaoObservacao,
      'produtoId': produtoId,
      'produtoCodigo': produtoCodigo,
      'produtoNome': produtoNome,
      'produtoDescricao': produtoDescricao,
      'produtoPreco': produtoPreco,
      'produtoTags': produtoTags,
    };
  }

  factory LocacaoRoupaItemModel.fromMap(Map<String, dynamic> map) {
    return LocacaoRoupaItemModel(
      itemLocacaoId: map['itemLocacaoId'],
      locacaoRoupaId: map['locacaoRoupaId'],
      itemLocacaoQtde: map['itemLocacaoQtde'],
      itemLocacaoObservacao: map['itemLocacaoObservacao'],
      produtoId: map['produtoId'],
      produtoCodigo: map['produtoCodigo'],
      produtoNome: map['produtoNome'],
      produtoDescricao: map['produtoDescricao'],
      produtoPreco: map['produtoPreco'],
      produtoTags: map['produtoTags'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LocacaoRoupaItemModel.fromJson(String source) =>
      LocacaoRoupaItemModel.fromMap(json.decode(source));
}
