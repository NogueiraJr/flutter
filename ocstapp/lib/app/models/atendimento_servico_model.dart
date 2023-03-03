import 'dart:convert';

class AtendimentoServicoModel {
  int id;
  int usuarioId;
  String usuarioPessoa;
  int clienteId;
  String clienteNome;
  int clienteVeiculoId;
  String clienteVeiculoNome;
  String descricao;
  String iniciar;
  String finalizar;
  String iniciado;
  String finalizado;
  String provarSemana;
  String iniciarSemana;
  String finalizarSemana;
  String iniciadoSemana;
  String finalizadoSemana;
  double valor;
  String observacao;
  String tags;
  String ativo;
  String horario;
  bool faturado;
  int faturadoQtdeParcelas;

  AtendimentoServicoModel({
    this.id,
    this.usuarioId,
    this.usuarioPessoa,
    this.clienteId,
    this.clienteNome,
    this.clienteVeiculoId,
    this.clienteVeiculoNome,
    this.iniciar,
    this.finalizar,
    this.iniciado,
    this.finalizado,
    this.provarSemana,
    this.iniciarSemana,
    this.finalizarSemana,
    this.iniciadoSemana,
    this.finalizadoSemana,
    this.valor,
    this.descricao,
    this.observacao,
    this.tags,
    this.ativo,
    this.horario,
    this.faturado,
    this.faturadoQtdeParcelas,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'usuarioId': usuarioId,
      'usuarioPessoa': usuarioPessoa,
      'clienteId': clienteId,
      'clienteNome': clienteNome,
      'clienteVeiculoId': clienteVeiculoId,
      'clienteVeiculoNome': clienteVeiculoNome,
      'iniciar': iniciar,
      'finalizar': finalizar,
      'iniciado': iniciado,
      'finalizado': finalizado,
      'provarDb': provarSemana,
      'iniciarDb': iniciarSemana,
      'finalizarDb': finalizarSemana,
      'iniciadoDb': iniciadoSemana,
      'finalizadoDb': finalizadoSemana,
      'valor': valor,
      'descricao': descricao,
      'observacao': observacao,
      'tags': tags,
      'ativo': ativo,
      'horario': horario,
      'faturado': faturado,
      'faturadoQtdeParcelas': faturadoQtdeParcelas
    };
  }

  static AtendimentoServicoModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return AtendimentoServicoModel(
      id: map['id'],
      usuarioId: map['usuarioId'],
      usuarioPessoa: map['usuarioPessoa'],
      clienteId: map['clienteId'],
      clienteNome: map['clienteNome'],
      clienteVeiculoId: map['clienteVeiculoId'],
      clienteVeiculoNome: map['clienteVeiculoNome'],
      iniciar: map['iniciar'],
      finalizar: map['finalizar'],
      iniciado: map['iniciado'],
      finalizado: map['finalizado'],
      provarSemana: map['provarSemana'],
      iniciarSemana: map['iniciarSemana'],
      finalizarSemana: map['finalizarSemana'],
      iniciadoSemana: map['iniciadoSemana'],
      finalizadoSemana: map['finalizadoSemana'],
      valor: map['valor'],
      descricao: map['descricao'],
      observacao: map['observacao'],
      tags: map['tags'],
      ativo: map['ativo'],
      horario: map['horario'],
      faturado: map['faturado'],
      faturadoQtdeParcelas: map['faturadoQtdeParcelas'],
    );
  }

  String toJson() => json.encode(toMap());

  static AtendimentoServicoModel fromJson(String source) =>
      fromMap(json.decode(source));
}
