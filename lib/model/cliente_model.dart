import 'package:ocstapi/model/cliente_manequim_model.dart';
import 'package:ocstapi/model/cliente_pet_model.dart';
import 'package:ocstapi/model/cliente_veiculo_model.dart';
import 'package:ocstapi/model/locacao_roupa_model.dart';
import 'package:ocstapi/model/atendimento_servico_model.dart';
import 'package:ocstapi/model/usuario_model.dart';

class ClienteModel extends ManagedObject<_ClienteModel>
    implements _ClienteModel {}

@Table(name: 'cliente')
class _ClienteModel {
  @Column(primaryKey: true, autoincrement: true)
  int id;

  @Relate(#clientes)
  UsuarioModel usuario;

  @Column()
  String nome;

  @Column()
  String celular;

  @Column()
  String email;

  ManagedSet<LocacaoRoupaModel> locacoesRoupaCliente;
  ManagedSet<AtendimentoServicoModel> atendimentoServicoCliente;

  @Column(nullable: true)
  String tags;

  @Column(nullable: true)
  String ativo;

  ManagedSet<ClienteManequimModel> manequins;
  ManagedSet<ClienteVeiculoModel> veiculos;
  ManagedSet<ClientePetModel> pets;
}
