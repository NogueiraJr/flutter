import 'package:ocstapi/ocstapi.dart';

class ClienteVeiculoUpdRequest extends Serializable {
  int id;
  int clienteId;
  String marca;
  String modelo;
  String ano;
  String cor;
  String placa;
  String observacao;

  @override
  Map<String, dynamic> asMap() {
    return {
      'id': id,
      'clienteId': clienteId,
      'marca': marca,
      'modelo': modelo,
      'ano': ano,
      'cor': cor,
      'placa': placa,
      'observacao': observacao,
    };
  }

  @override
  void readFromMap(Map<String, dynamic> object) {
    id = object['id'] as int;
    clienteId = object['clienteId'] as int;
    marca = object['marca'] as String;
    modelo = object['modelo'] as String;
    ano = object['ano'] as String;
    cor = object['cor'] as String;
    placa = object['placa'] as String;
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
    if (placa == null) {
      validateResult['placa'] = 'Placa não informada';
    }
    return validateResult;
  }
}
