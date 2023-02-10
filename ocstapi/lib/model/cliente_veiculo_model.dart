import 'package:ocstapi/model/atendimento_servico_objeto_model.dart';
import 'package:ocstapi/model/cliente_model.dart';
import 'package:ocstapi/model/atendimento_servico_model.dart';
import '../ocstapi.dart';

class ClienteVeiculoModel extends ManagedObject<_ClienteVeiculoModel>
    implements _ClienteVeiculoModel {}

@Table(name: 'cliente_veiculo')
class _ClienteVeiculoModel {
  @Column(primaryKey: true, autoincrement: true)
  int id;

  @Relate(#veiculos)
  ClienteModel cliente;

  @Column(nullable: true)
  String marca;

  @Column(nullable: true)
  String modelo;

  @Column(nullable: true)
  String ano;

  @Column(nullable: true)
  String cor;

  @Column(nullable: true)
  String placa;

  @Column(nullable: true)
  String observacao;

  ManagedSet<AtendimentoServicoObjetoModel> atendimentoServicoClienteVeiculo;
}
