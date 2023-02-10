import '../../../ocstapi.dart';

class CriarLoginFilhoDoPaiRequest extends Serializable {
  /// Cadastro de um Logn Novo pelo Gerente, ou Alteração de um Login existente fazendo ele ser do Gerente.
  String operacao;

  int id;

  /// Gerente define o Login do Colaborador, seguindo ou não algum padrão da Empresa.
  String login;

  /// Gerente define a Senha do Colaborador, seguindo ou não algum padrão da Empresa.
  String senha;

  /// Gerente define:
  /// . e-mail padrão da empresa (mais controle do Gerente nas trocas de senha, por exemplo);
  /// . ou e-mai do colaborador (menos controle do Gerente nas trocas de senha, por exemplo).
  String email;

  /// Sempre ativo na criação. Pode desativar depois pelos Gerentes Superiores;
  /// ou pelo Admin junto com a conta do Gerente Primário em caso de inadimplência.
  String ativo;

  /// Vem do Login Pai automaticamente.
  String empresa;

  /// Gerente define o nome do seu colaborador (nome real).
  String pessoa;

  /// Envia para o e-mail para validar a criação do usuário.
  int codigo;

  /// Entra como 2, pois pertence já a um Pai e não precisa 'complementar' o Cadastro.
  int situacao;

  /// Vem do Login Pai automaticamente (pode ser de qualquer nível de Gerente).
  int idPai;

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
      'idPai': idPai,
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
    idPai = object['idPai'] as int;
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

    if (idPai == null || idPai.isNaN) {
      mapValidate['idPai'] = 'idPai Obrigatório';
    }

    if ((operacao == 'ALT') && (id == null)) {
      mapValidate['id'] = 'Id Obrigatório';
    }

    //if ((operacao == 'CAD') && (idSistema == null)) {
    //  mapValidate['idSistema'] = 'IdSistema Obrigatório';
    //}

    return mapValidate;
  }
}
