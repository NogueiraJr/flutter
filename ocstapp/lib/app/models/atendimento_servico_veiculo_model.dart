import 'dart:convert';

import 'package:intl/intl.dart';

class AtendimentoServicoVeiculoModel {
  int id;
  int usuarioId;
  int atendimentoServicoId;
  int clienteVeiculoId;
  String descricao;
  DateTime quando;
  String observacao;
  String tags;

  AtendimentoServicoVeiculoModel({
    this.id,
    this.usuarioId,
    this.atendimentoServicoId,
    this.clienteVeiculoId,
    this.descricao,
    this.quando,
    this.observacao,
    this.tags,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'usuarioId': usuarioId,
      'atendimentoServicoId': atendimentoServicoId,
      'clienteVeiculoId': clienteVeiculoId,
      'descricao': descricao,
      'quando': quando.millisecondsSinceEpoch,
      'observacao': observacao,
      'tags': tags,
    };
  }

  static AtendimentoServicoVeiculoModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    var format = DateFormat('y-MM-d');
    return AtendimentoServicoVeiculoModel(
      id: map['id'],
      usuarioId: map['usuarioId'],
      atendimentoServicoId: map['atendimentoServicoId'],
      clienteVeiculoId: map['clienteVeiculoId'],
      descricao: map['descricao'],
      quando: format.parse(map['quando']),
      observacao: map['observacao'],
      tags: map['tags'],
    );
  }

  String toJson() => json.encode(toMap());

  static AtendimentoServicoVeiculoModel fromJson(String source) =>
      fromMap(json.decode(source));
}
