import 'package:ocstapi/model/atendimento_servico_model.dart';
import 'package:ocstapi/model/usuario_model.dart';

class AtendimentoServicoInfoModel
    extends ManagedObject<_AtendimentoServicoInfoModel>
    implements _AtendimentoServicoInfoModel {}

@Table(name: 'atendimento_servico_info')
class _AtendimentoServicoInfoModel {
  @Column(primaryKey: true, autoincrement: true)
  int id;

  //Usuário do Sistema
  @Relate(#atendimentoServicoInfoUsuario)
  UsuarioModel usuario;

  @Relate(#atendimentoServicoInfo)
  AtendimentoServicoModel atendimentoServico;

  @Column()
  String descricao;

  @Column(nullable: true)
  DateTime quando;

  @Column(nullable: true)
  DateTime quandoAlterado;

  @Column(nullable: true)
  String tags;

  @Column(nullable: true)
  String observacao;
}
