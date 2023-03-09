import 'dart:convert';

class ClienteEnderecoModel {
  int id;
  int clienteId;
  // String clienteNome;
  String cep;
  String rua;
  String numero;
  String bairro;
  String cidade;
  String estado;
  String pais;
  String complemento;
  String tags;
  ClienteEnderecoModel({
    this.id,
    this.clienteId,
    // this.clienteNome,
    this.cep,
    this.rua,
    this.numero,
    this.bairro,
    this.cidade,
    this.estado,
    this.pais,
    this.complemento,
    this.tags,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'clienteId': clienteId,
      // 'clienteNome': clienteNome,
      'cep': cep,
      'rua': rua,
      'numero': numero,
      'bairro': bairro,
      'cidade': cidade,
      'estado': estado,
      'pais': pais,
      'complemento': complemento,
      'tags': tags,
    };
  }

  factory ClienteEnderecoModel.fromMap(Map<String, dynamic> map) {
    return ClienteEnderecoModel(
      id: map['id'],
      clienteId: map['clienteId'],
      // clienteNome: map['clienteNome'],
      cep: map['cep'],
      rua: map['rua'],
      numero: map['numero'],
      bairro: map['bairro'],
      cidade: map['cidade'],
      estado: map['estado'],
      pais: map['pais'],
      complemento: map['complemento'],
      tags: map['tags'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ClienteEnderecoModel.fromJson(String source) =>
      ClienteEnderecoModel.fromMap(json.decode(source));
}
