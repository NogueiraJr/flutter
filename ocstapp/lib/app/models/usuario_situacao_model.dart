import 'dart:convert';

class UsuarioSituacaoModel {
  int id;
  String situacao;

  UsuarioSituacaoModel({
    this.id,
    this.situacao,
  });

  UsuarioSituacaoModel copyWith({
    int id,
    String situacao,
  }) {
    return UsuarioSituacaoModel(
      id: id ?? this.id,
      situacao: situacao ?? this.situacao,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'situacao': situacao,
    };
  }

  static UsuarioSituacaoModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UsuarioSituacaoModel(
      id: map['id'],
      situacao: map['situacao'],
    );
  }

  String toJson() => json.encode(toMap());

  static UsuarioSituacaoModel fromJson(String source) =>
      fromMap(json.decode(source));

  @override
  String toString() => 'UsuarioSituacaoModel(id: $id, situacao: $situacao)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is UsuarioSituacaoModel && o.id == id && o.situacao == situacao;
  }

  @override
  int get hashCode => id.hashCode ^ situacao.hashCode;
}
