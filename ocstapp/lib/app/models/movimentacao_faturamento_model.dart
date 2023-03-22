import 'dart:convert';

import 'package:OCSTApp/app/models/atendimento_servico_model.dart';
import 'package:OCSTApp/app/modules/celulas/operacional/atendimento_servico/operacoes/cadastro/cadastro_module.dart';
import 'package:intl/intl.dart';
import 'package:OCSTApp/app/models/categoria_model.dart';

class MovimentacaoFaturamentoModel {
  int id;
  DateTime dataMovimentacao;
  DateTime dataEfetivacao;
  String descricao;
  double valor;
  CategoriaModel categoria;
  String tags;
  String parcela;
  AtendimentoServicoModel atendimentoServico;

  MovimentacaoFaturamentoModel({
    this.id,
    this.dataMovimentacao,
    this.dataEfetivacao,
    this.descricao,
    this.valor,
    this.categoria,
    this.tags,
    this.parcela,
    this.atendimentoServico,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'dataMovimentacao': dataMovimentacao.millisecondsSinceEpoch,
      'dataEfetivacao': dataEfetivacao.millisecondsSinceEpoch,
      'descricao': descricao,
      'valor': valor,
      'categoria': categoria.toMap(),
      'tags': tags,
      'parcela': parcela,
      'atendimentoServico': atendimentoServico.toMap(),
    };
  }

  static MovimentacaoFaturamentoModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    var format = DateFormat('yyy-MM-dd HH:mm');
    return MovimentacaoFaturamentoModel(
      id: map['id'],
      dataMovimentacao: map['dataMovimentacao'] != ''
          ? format.parse(map['dataMovimentacao'])
          : null,
      dataEfetivacao: map['dataEfetivacao'] != ''
          ? format.parse(map['dataEfetivacao'])
          : null,
      descricao: map['descricao'],
      valor: map['valor'],
      categoria: CategoriaModel.fromMap(map['categoria']),
      tags: map['tags'],
      parcela: map['parcela'],
      atendimentoServico:
          AtendimentoServicoModel.fromMap(map['atendimentoServico']),
    );
  }

  String toJson() => json.encode(toMap());

  static MovimentacaoFaturamentoModel fromJson(String source) =>
      fromMap(json.decode(source));
}
