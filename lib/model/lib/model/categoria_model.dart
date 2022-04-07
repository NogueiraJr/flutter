import 'movimentacao_model.dart';

class CategoriaModel extends ManagedObject<_CategoriaModel>
    implements _CategoriaModel {}

enum TipoCategoria { receita, despesa }

@Table(name: 'categoria')
class _CategoriaModel {
  @Column(primaryKey: true)
  int id;

  @Column()
  String nome;

  @Column()
  TipoCategoria tipoCategoria;

  //Chave Estrangeira da tabela Movimentação Financeira.
  ManagedSet<MovimentacaoModel> movimentacoes;
}
