import 'dart:convert';

class RespostaModel {
  String resposta;

  RespostaModel({
    this.resposta,
  });

  RespostaModel copyWith({
    String resposta,
  }) {
    return RespostaModel(
      resposta: resposta ?? this.resposta,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'resposta': resposta,
    };
  }

  static RespostaModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return RespostaModel(
      resposta: map['resposta'],
    );
  }

  String toJson() => json.encode(toMap());

  static RespostaModel fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'RespostaModel(resposta: $resposta)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is RespostaModel && o.resposta == resposta;
  }

  @override
  int get hashCode => resposta.hashCode;
}
