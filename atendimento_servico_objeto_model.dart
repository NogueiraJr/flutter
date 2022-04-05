import 'package:ocstapi/model/atendimento_servico_model.dart';
import 'package:ocstapi/model/cliente_pet_model.dart';
import 'package:ocstapi/model/cliente_veiculo_model.dart';
import 'package:ocstapi/model/usuario_model.dart';

class AtendimentoServicoObjetoModel
    extends ManagedObject<_AtendimentoServicoObjetoModel>
    implements _AtendimentoServicoObjetoModel {}

@Table(name: 'atendimento_servico_objeto')
class _AtendimentoServicoObjetoModel {
  @Column(primaryKey: true, autoincrement: true)
  int id;

  //Usuário do Sistema
  @Relate(#atendimentoServicoObjetoUsuario)
  UsuarioModel usuario;

  @Relate(#atendimentoServicoObjeto)
  AtendimentoServicoModel atendimentoServico;

  @Relate(#atendimentoServicoClienteVeiculo)
  ClienteVeiculoModel clienteVeiculo;

  @Relate(#atendimentoServicoClientePet)
  ClientePetModel clientePet;

  @Column()
  String descricao;

  @Column(nullable: true)
  DateTime quando;

  @Column(nullable: true)
  String tags;

  @Column(nullable: true)
  String observacao;
}
