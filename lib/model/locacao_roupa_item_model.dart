import 'package:ocstapi/model/locacao_roupa_model.dart';
import 'package:ocstapi/model/produto_model.dart';
import '../ocstapi.dart';

class LocacaoRoupaItemModel extends ManagedObject<_LocacaoRoupaItemModel>
    implements _LocacaoRoupaItemModel {}

@Table(name: 'locacao_roupa_item')
class _LocacaoRoupaItemModel {
  @Column(primaryKey: true, autoincrement: true)
  int id;

  @Relate(#locacoesRoupaItem)
  LocacaoRoupaModel locacaoRoupa;

  @Relate(#locacoesRoupaProdutos)
  ProdutoModel produto;

  @Column()
  int qtde;

  @Column(nullable: true)
  String observacao;
}
