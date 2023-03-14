import 'dart:convert';

class ClientePetModel {
  int id;
  int clienteId;
  // String clienteNome;
  String nome;
  String raca;
  String anoNascimento;
  String mesNascimento;
  String cor;
  String observacao;
  ClientePetModel({
    this.id,
    this.clienteId,
    // this.clienteNome,
    this.nome,
    this.raca,
    this.anoNascimento,
    this.mesNascimento,
    this.cor,
    this.observacao,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'clienteId': clienteId,
      // 'clienteNome': clienteNome,
      'nome': nome,
      'raca': raca,
      'anoNascimento': anoNascimento,
      'mesNascimento': mesNascimento,
      'cor': cor,
      'observacao': observacao,
    };
  }

  factory ClientePetModel.fromMap(Map<String, dynamic> map) {
    return ClientePetModel(
      id: map['id'],
      clienteId: map['clienteId'],
      // clienteNome: map['clienteNome'],
      nome: map['nome'],
      raca: map['raca'],
      anoNascimento: map['anoNascimento'],
      mesNascimento: map['mesNascimento'],
      cor: map['cor'],
      observacao: map['observacao'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ClientePetModel.fromJson(String source) =>
      ClientePetModel.fromMap(json.decode(source));
}
