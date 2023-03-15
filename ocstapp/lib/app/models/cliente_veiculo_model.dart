import 'dart:convert';

class ClienteVeiculoModel {
  int id;
  int clienteId;
  // String clienteNome;
  String marca;
  String modelo;
  String ano;
  String cor;
  String placa;
  String observacao;
  ClienteVeiculoModel({
    this.id,
    this.clienteId,
    // this.clienteNome,
    this.marca,
    this.modelo,
    this.ano,
    this.cor,
    this.placa,
    this.observacao,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'clienteId': clienteId,
      // 'clienteNome': clienteNome,
      'marca': marca,
      'modelo': modelo,
      'ano': ano,
      'cor': cor,
      'placa': placa,
      'observacao': observacao,
    };
  }

  factory ClienteVeiculoModel.fromMap(Map<String, dynamic> map) {
    return ClienteVeiculoModel(
      id: map['id'],
      clienteId: map['clienteId'],
      // clienteNome: map['clienteNome'],
      marca: map['marca'],
      modelo: map['modelo'],
      ano: map['ano'],
      cor: map['cor'],
      placa: map['placa'],
      observacao: map['observacao'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ClienteVeiculoModel.fromJson(String source) =>
      ClienteVeiculoModel.fromMap(json.decode(source));
}
