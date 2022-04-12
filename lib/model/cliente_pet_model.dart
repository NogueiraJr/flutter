import 'package:ocstapi/model/atendimento_servico_objeto_model.dart';
import 'package:ocstapi/model/cliente_model.dart';
import 'package:ocstapi/model/atendimento_servico_model.dart';

class ClientePetModel extends ManagedObject<_ClientePetModel>
    implements _ClientePetModel {}

@Table(name: 'cliente_pet')
class _ClientePetModel {
  @Column(primaryKey: true, autoincrement: true)
  int id;

  @Relate(#pets)
  ClienteModel cliente;

  @Column(nullable: true)
  String nome;

  @Column(nullable: true)
  String raca;

  @Column(nullable: true)
  String anoNascimento;

  @Column(nullable: true)
  String mesNascimento;

  @Column(nullable: true)
  String cor;

  @Column(nullable: true)
  String observacao;

  ManagedSet<AtendimentoServicoObjetoModel> atendimentoServicoClientePet;
}
