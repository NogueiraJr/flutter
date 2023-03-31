import 'dart:convert';

class SistemaModel {
  int id;
  String sistemaRef; //refLocacaoRoupas, refPastelaria
  String sistemaNome;
  String sistemaDescricao;
  String sistemaFigura;
  String sistemaAtivo;

  SistemaModel({
    this.id,
    this.sistemaRef,
    this.sistemaNome,
    this.sistemaDescricao,
    this.sistemaFigura,
    this.sistemaAtivo,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'sistemaRef': sistemaRef,
      'sistemaNome': sistemaNome,
      'sistemaDescricao': sistemaDescricao,
      'sistemaFigura': sistemaFigura,
      'sistemaAtivo': sistemaAtivo,
    };
  }

  static SistemaModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return SistemaModel(
      id: map['id'],
      sistemaRef: map['sistemaRef'],
      sistemaNome: map['sistemaNome'],
      sistemaDescricao: map['sistemaDescricao'],
      sistemaFigura: map['sistemaFigura'],
      sistemaAtivo: map['sistemaAtivo'],
    );
  }

  String toJson() => json.encode(toMap());

  static SistemaModel fromJson(String source) => fromMap(json.decode(source));
}
