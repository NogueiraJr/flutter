import 'dart:ffi';

import 'package:ocstapi/model/locacao_roupa_item_model.dart';
import 'package:ocstapi/model/atendimento_servico_item_model.dart';
import 'package:ocstapi/model/produto_item_model.dart';
import 'package:ocstapi/model/usuario_model.dart';
import '../ocstapi.dart';

class ProdutoModel extends ManagedObject<_ProdutoModel>
    implements _ProdutoModel {}

@Table(name: 'produto')
class _ProdutoModel {
  @Column(primaryKey: true, autoincrement: true)
  int id;

  @Relate(#produtos)
  UsuarioModel usuario;

  ManagedSet<ProdutoItemModel> produtos;
  ManagedSet<ProdutoItemModel> produtosItens;

  //Código interno do Produto (pode ser código de barras ou QRCode, por exemplo)
  @Column()
  String codigo;

  @Column()
  String nome;

  @Column()
  String descricao;

  //Quanto custou para comprar
  @Column(nullable: true)
  double custo;

  //Por quanto vai vender
  @Column(nullable: true)
  double preco;

  //Etiqueta, Contexto, Assunto, etc.
  //Grava cada uma separada da outra por espaço.
  //Tabela de domínio: [tags], sem PK ou FK, apenas a tag gravada aqui.
  @Column(nullable: true)
  String tags;

  @Column(nullable: true)
  String ativo;

  ManagedSet<LocacaoRoupaItemModel> locacoesRoupaProdutos;
  ManagedSet<AtendimentoServicoItemModel> atendimentoServicoProdutos;
}
