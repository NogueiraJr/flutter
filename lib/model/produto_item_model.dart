import 'package:ocstapi/model/produto_model.dart';
import '../ocstapi.dart';

class ProdutoItemModel extends ManagedObject<_ProdutoItemModel>
    implements _ProdutoItemModel {}

@Table(name: 'produto_item')
class _ProdutoItemModel {
  @Column(primaryKey: true, autoincrement: true)
  int id;

  @Relate(#produtos)
  ProdutoModel produto;

  @Relate(#produtosItens)
  ProdutoModel produtoItem;
}
