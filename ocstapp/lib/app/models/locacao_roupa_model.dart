import 'dart:convert';

class LocacaoRoupaModel {
  int id;
  int usuarioId;
  String usuarioPessoa;
  int clienteId;
  String clienteNome;
  String descricao;
  String provar;
  String retirar;
  String devolver;
  String retirado;
  String devolvido;
  String provarSemana;
  String retirarSemana;
  String devolverSemana;
  String retiradoSemana;
  String devolvidoSemana;
  double valor;
  String observacao;
  String tags;
  String ativo;

  LocacaoRoupaModel({
    this.id,
    this.usuarioId,
    this.usuarioPessoa,
    this.clienteId,
    this.clienteNome,
    this.provar,
    this.retirar,
    this.devolver,
    this.retirado,
    this.devolvido,
    this.provarSemana,
    this.retirarSemana,
    this.devolverSemana,
    this.retiradoSemana,
    this.devolvidoSemana,
    this.valor,
    this.descricao,
    this.observacao,
    this.tags,
    this.ativo,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'usuarioId': usuarioId,
      'usuarioPessoa': usuarioPessoa,
      'clienteId': clienteId,
      'clienteNome': clienteNome,
      'provar': provar,
      'retirar': retirar,
      'devolver': devolver,
      'retirado': retirado,
      'devolvido': devolvido,
      'provarDb': provarSemana,
      'retirarDb': retirarSemana,
      'devolverDb': devolverSemana,
      'retiradoDb': retiradoSemana,
      'devolvidoDb': devolvidoSemana,
      'valor': valor,
      'descricao': descricao,
      'observacao': observacao,
      'tags': tags,
      'ativo': ativo,
    };
  }

  static LocacaoRoupaModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return LocacaoRoupaModel(
      id: map['id'],
      usuarioId: map['usuarioId'],
      usuarioPessoa: map['usuarioPessoa'],
      clienteId: map['clienteId'],
      clienteNome: map['clienteNome'],
      provar: map['provar'],
      retirar: map['retirar'],
      devolver: map['devolver'],
      retirado: map['retirado'],
      devolvido: map['devolvido'],
      provarSemana: map['provarSemana'],
      retirarSemana: map['retirarSemana'],
      devolverSemana: map['devolverSemana'],
      retiradoSemana: map['retiradoSemana'],
      devolvidoSemana: map['devolvidoSemana'],
      valor: map['valor'],
      descricao: map['descricao'],
      observacao: map['observacao'],
      tags: map['tags'],
      ativo: map['ativo'],
    );
  }

  String toJson() => json.encode(toMap());

  static LocacaoRoupaModel fromJson(String source) =>
      fromMap(json.decode(source));
}
