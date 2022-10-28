import 'package:ocstapi/model/atendimento_servico_objeto_model.dart';
import 'package:ocstapi/model/cliente_model.dart';
import 'package:ocstapi/model/fornecedor_model.dart';
import 'package:ocstapi/model/locacao_roupa_model.dart';
import 'package:ocstapi/model/movimentacao_model.dart';
import 'package:ocstapi/model/atendimento_servico_info_model.dart';
import 'package:ocstapi/model/atendimento_servico_model.dart';
import 'package:ocstapi/model/produto_model.dart';
import 'package:ocstapi/model/sistema_model.dart';
import 'package:ocstapi/model/tag_model.dart';
import 'package:ocstapi/model/usuario_acesso_model.dart';
import 'package:ocstapi/model/usuario_situacao_model.dart';

import '../ocstapi.dart';

class UsuarioModel extends ManagedObject<_UsuarioModel>
    implements _UsuarioModel {}

@Table(name: 'usuario')
class _UsuarioModel {
  @Column(primaryKey: true, autoincrement: true)
  int id;

  /// Id do Usuário Superior
  @Column(nullable: true)
  int idPai;

  @Column(unique: true)
  String login;

  @Column()
  String senha;

  @Column(nullable: true)
  String email;

  @Column(nullable: true)
  String empresa;

  @Column(nullable: true)
  String pessoa;

  /// Código enviado ao e-mail
  @Column(nullable: true)
  int codigo;

  /// Para bloquear usuário se necessário (falta de pagamento, por exemplo)
  @Column(nullable: true)
  String ativo;

  ManagedSet<MovimentacaoModel> movimentacoes;

  @Relate(#usuarios)
  UsuarioSituacaoModel usuariosituacao;

  ManagedSet<UsuarioAcessoModel> acessos;

  @Relate(#usuarios)
  SistemaModel usuariosistema;

  ManagedSet<ProdutoModel> produtos;
  ManagedSet<ClienteModel> clientes;
  ManagedSet<FornecedorModel> fornecedores;

  ManagedSet<LocacaoRoupaModel> locacoesRoupaUsuario;
  ManagedSet<AtendimentoServicoModel> atendimentoServicoUsuario;
  ManagedSet<AtendimentoServicoInfoModel> atendimentoServicoInfoUsuario;
  ManagedSet<AtendimentoServicoObjetoModel> atendimentoServicoObjetoUsuario;

  ManagedSet<TagModel> tags;
}
