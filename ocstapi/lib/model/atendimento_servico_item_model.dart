import 'package:ocstapi/model/atendimento_servico_model.dart';
import 'package:ocstapi/model/produto_model.dart';

class AtendimentoServicoItemModel
    extends ManagedObject<_AtendimentoServicoItemModel>
    implements _AtendimentoServicoItemModel {}

@Table(name: 'atendimento_servico_item')
class _AtendimentoServicoItemModel {
  @Column(primaryKey: true, autoincrement: true)
  int id;

  @Relate(#atendimentoServicoItem)
  AtendimentoServicoModel atendimentoServico;

  @Relate(#atendimentoServicoProdutos)
  ProdutoModel produto;

  @Column()
  int qtde;

  @Column(nullable: true)
  String observacao;
}
