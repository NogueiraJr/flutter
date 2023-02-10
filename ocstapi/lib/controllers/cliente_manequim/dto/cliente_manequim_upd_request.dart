import 'package:ocstapi/ocstapi.dart';

class ClienteManequimUpdRequest extends Serializable {
  int id;
  int clienteId;
  DateTime data;
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

  @override
  Map<String, dynamic> asMap() {
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

  @override
  void readFromMap(Map<String, dynamic> object) {
    id = object['id'] as int;
    clienteId = object['clienteId'] as int;
    final _data = object['data'] as String;
    data = _data != null ? DateTime.parse(_data) : null;
    busto = object['busto'] as double;
    cintura = object['cintura'] as double;
    quadril = object['quadril'] as double;
    altura = object['altura'] as double;
    peso = object['peso'] as double;
    pescoco = object['pescoco'] as double;
    ombro = object['ombro'] as double;
    torax = object['torax'] as double;
    bracoLargura = object['bracoLargura'] as double;
    bracoComprimento = object['bracoComprimento'] as double;
    costasLargura = object['costasLargura'] as double;
    quadrilAltura = object['quadrilAltura'] as double;
    barriga = object['barriga'] as double;
    coxaLargura = object['coxaLargura'] as double;
    pernaComprimento = object['pernaComprimento'] as double;
    observacao = object['observacao'] as String;
  }

  Map<String, String> validate() {
    final Map<String, String> validateResult = {};
    if (id == null) {
      validateResult['id'] = 'Id é necessário';
    }
    if (clienteId == null) {
      validateResult['clienteId'] = 'Cliente é necessário';
    }
    if (data == null) {
      validateResult['data'] = 'Data não informada';
    }
    if (busto == null) {
      validateResult['busto'] = 'Busto não informado';
    }
    if (cintura == null) {
      validateResult['cintura'] = 'Cintura não informada';
    }
    if (quadril == null) {
      validateResult['quadril'] = 'Quadril não informado';
    }
    return validateResult;
  }
}
