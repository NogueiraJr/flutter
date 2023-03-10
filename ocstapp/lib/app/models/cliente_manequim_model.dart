import 'dart:convert';

class ClienteManequimModel {
  int id;
  int clienteId;
  String data;
  double busto;
  double cintura;
  double quadril;
  double altura;
  double peso;
  double pescoco;
  double ombro;
  double torax;
  double bracoLargura;
  double bracoComprimento;
  double costasLargura;
  double quadrilAltura;
  double barriga;
  double coxaLargura;
  double pernaComprimento;
  String observacao;
  ClienteManequimModel({
    this.id,
    this.clienteId,
    this.data,
    this.busto,
    this.cintura,
    this.quadril,
    this.altura,
    this.peso,
    this.pescoco,
    this.ombro,
    this.torax,
    this.bracoLargura,
    this.bracoComprimento,
    this.costasLargura,
    this.quadrilAltura,
    this.barriga,
    this.coxaLargura,
    this.pernaComprimento,
    this.observacao,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'clienteId': clienteId,
      'data': data,
      'busto': busto,
      'cintura': cintura,
      'quadril': quadril,
      'altura': altura,
      'peso': peso,
      'pescoco': pescoco,
      'ombro': ombro,
      'torax': torax,
      'bracoLargura': bracoLargura,
      'bracoComprimento': bracoComprimento,
      'costasLargura': costasLargura,
      'quadrilAltura': quadrilAltura,
      'barriga': barriga,
      'coxaLargura': coxaLargura,
      'pernaComprimento': pernaComprimento,
      'observacao': observacao,
    };
  }

  factory ClienteManequimModel.fromMap(Map<String, dynamic> map) {
    return ClienteManequimModel(
      id: map['id'],
      clienteId: map['clienteId'],
      data: map['data'],
      busto: map['busto'],
      cintura: map['cintura'],
      quadril: map['quadril'],
      altura: map['altura'],
      peso: map['peso'],
      pescoco: map['pescoco'],
      ombro: map['ombro'],
      torax: map['torax'],
      bracoLargura: map['bracoLargura'],
      bracoComprimento: map['bracoComprimento'],
      costasLargura: map['costasLargura'],
      quadrilAltura: map['quadrilAltura'],
      barriga: map['barriga'],
      coxaLargura: map['coxaLargura'],
      pernaComprimento: map['pernaComprimento'],
      observacao: map['observacao'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ClienteManequimModel.fromJson(String source) =>
      ClienteManequimModel.fromMap(json.decode(source));
}
