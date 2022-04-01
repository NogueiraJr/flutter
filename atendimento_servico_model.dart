import 'package:ocstapi/model/atendimento_servico_objeto_model.dart';
import 'package:ocstapi/model/cliente_veiculo_model.dart';
import 'package:ocstapi/model/atendimento_servico_info_model.dart';
import 'package:ocstapi/model/atendimento_servico_item_model.dart';
import 'package:ocstapi/model/movimentacao_model.dart';
import 'package:ocstapi/model/usuario_model.dart';
import 'cliente_model.dart';

class AtendimentoServicoModel extends ManagedObject<_AtendimentoServicoModel>
    implements _AtendimentoServicoModel {}

@Table(name: 'atendimento_servico')
class _AtendimentoServicoModel {
  @Column(primaryKey: true, autoincrement: true)
  int id;

  //Usuário do Sistema
  @Relate(#atendimentoServicoUsuario)
  UsuarioModel usuario;

  //Cliente dono do Veículo
  @Relate(#atendimentoServicoCliente)
  ClienteModel cliente;

  @Column()
  String descricao;

  @Column(nullable: true)
  DateTime iniciar;

  @Column(nullable: true)
  DateTime finalizar;

  @Column(nullable: true)
  DateTime iniciado;

  @Column(nullable: true)
  DateTime finalizado;

  @Column()
  double valor;

  @Column(nullable: true)
  String observacao;

  @Column(nullable: true)
  String tags;

  @Column(nullable: true)
  String ativo; //Inicialmente preenchido com 'S'.

  //Produtos usados no atendimento
  ManagedSet<AtendimentoServicoItemModel> atendimentoServicoItem;

  //Atuação, passos, anotações, etc.
  ManagedSet<AtendimentoServicoInfoModel> atendimentoServicoInfo;

  //Sistema de Oficina: Veículo(s) sendo atendido(s)
  ManagedSet<AtendimentoServicoObjetoModel> atendimentoServicoObjeto;

  //Chave Estrangeira da tabela Movimentação Financeira.
  ManagedSet<MovimentacaoModel> movimentacoes;
}
