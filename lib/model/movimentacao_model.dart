import 'package:ocstapi/model/atendimento_servico_model.dart';
import 'package:ocstapi/model/categoria_model.dart';
import 'package:ocstapi/model/usuario_model.dart';

import '../ocstapi.dart';

class MovimentacaoModel extends ManagedObject<_MovimentacaoModel>
    implements _MovimentacaoModel {}

@Table(name: 'movimentacao')
class _MovimentacaoModel {
  @Column(primaryKey: true, autoincrement: true)
  int id;

  @Column()
  String descricao;

  @Column()
  double valor;

  @Column()
  DateTime dataMovimentacao;

  @Column(nullable: true)
  String tags;

  @Column(nullable: true)
  String parcela;

  @Column(nullable: true)
  DateTime dataEfetivacao;

  //Um usuário possui 1 ou mais movimentações financeiras
  @Relate(#movimentacoes)
  UsuarioModel usuario;

  //Uma Categoria possui 1 ou mais movimentações financeiras
  @Relate(#movimentacoes)
  CategoriaModel categoria;

  @Relate(#movimentacoes)
  AtendimentoServicoModel atendimentoServico;
}
