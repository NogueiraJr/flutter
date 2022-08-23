import '../../../ocstapi.dart';

class GravarProprietarioRequest extends Serializable {
  String operacao;

  int id;
  String login;
  String senha;
  String email;
  String ativo;
  String empresa;
  String pessoa;
  int codigo;
  int situacao;
  int idSistema;

  @override
  Map<String, dynamic> asMap() {
    return {
      'operacao': operacao,
      'id': id,
      'login': login,
      'senha': senha,
      'email': email,
      'ativo': ativo,
      'empresa': empresa,
      'pessoa': pessoa,
      'codigo': codigo,
      'situacao': situacao,
      'idSistema': idSistema,
    };
  }

  @override
  void readFromMap(Map<String, dynamic> object) {
    operacao = object['operacao'] as String;
    id = object['id'] as int;
    login = object['login'] as String;
    senha = object['senha'] as String;
    email = object['email'] as String;
    ativo = object['ativo'] as String;
    empresa = object['empresa'] as String;
    pessoa = object['pessoa'] as String;
    codigo = object['codigo'] as int;
    situacao = object['situacao'] as int;
    idSistema = object['idSistema'] as int;
  }

  Map<String, String> validate() {
    final Map<String, String> mapValidate = {};
    if (operacao == null || operacao.isEmpty) {
      mapValidate['operacao'] = 'Operação Obrigatória (CAD, ALT)';
    }
    if (login == null || login.isEmpty) {
      mapValidate['login'] = 'Login Obrigatório';
    }
    if ((operacao == 'CAD') && (senha == null || senha.isEmpty)) {
      mapValidate['senha'] = 'Senha Obrigatória';
    }
    if (email == null || email.isEmpty) {
      mapValidate['email'] = 'Email Obrigatório';
    }

    if (pessoa == null || pessoa.isEmpty) {
      mapValidate['pessoa'] = 'Pessoa Obrigatória';
    }

    if ((operacao == 'ALT') && (id == null)) {
      mapValidate['id'] = 'Id Obrigatório';
    }

    return mapValidate;
  }
}
