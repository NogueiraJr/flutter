import 'dart:convert';

import 'package:intl/intl.dart';

class AtendimentoServicoInfoModel {
  int id;
  int usuarioId;
  String usuarioPessoa;
  int atendimentoServicoId;
  String descricao;
  DateTime quando;
  DateTime quandoAlterado;
  String observacao;
  String tags;

  AtendimentoServicoInfoModel({
    this.id,
    this.usuarioId,
    this.usuarioPessoa,
    this.atendimentoServicoId,
    this.descricao,
    this.quando,
    this.quandoAlterado,
    this.observacao,
    this.tags,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'usuarioId': usuarioId,
      'usuarioPessoa': usuarioPessoa,
      'atendimentoServicoId': atendimentoServicoId,
      'descricao': descricao,
      'quando': quando.millisecondsSinceEpoch,
      'quandoAlterado': quandoAlterado.millisecondsSinceEpoch,
      'observacao': observacao,
      'tags': tags,
    };
  }

  static AtendimentoServicoInfoModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    var format = DateFormat('dd-MM-yyyy HH:mm:ss');
    return AtendimentoServicoInfoModel(
      id: map['id'],
      usuarioId: map['usuarioId'],
      usuarioPessoa: map['usuarioPessoa'],
      atendimentoServicoId: map['atendimentoServicoId'],
      descricao: map['descricao'],
      quando: format.parse(map['quando']),
      quandoAlterado: format.parse(map['quandoAlterado']),
      observacao: map['observacao'],
      tags: map['tags'],
    );
  }

  String toJson() => json.encode(toMap());

  static AtendimentoServicoInfoModel fromJson(String source) =>
      fromMap(json.decode(source));
}
