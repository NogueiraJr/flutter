import 'package:ocstapi/model/locacao_roupa_item_model.dart';
import 'package:ocstapi/model/usuario_model.dart';
import '../ocstapi.dart';
import 'cliente_model.dart';

class LocacaoRoupaModel extends ManagedObject<_LocacaoRoupaModel>
    implements _LocacaoRoupaModel {}

@Table(name: 'locacao_roupa')
class _LocacaoRoupaModel {
  @Column(primaryKey: true, autoincrement: true)
  int id;

  @Relate(#locacoesRoupaUsuario)
  UsuarioModel usuario;

  @Relate(#locacoesRoupaCliente)
  ClienteModel cliente;

  //Pode sugerir 'Primeiro Nome do Cliente' + 'Data'
  @Column()
  String descricao;

  @Column(nullable: true)
  DateTime provar;

  @Column(nullable: true)
  DateTime retirar;

  @Column(nullable: true)
  DateTime devolver;

  @Column(nullable: true)
  DateTime retirado;

  @Column(nullable: true)
  DateTime devolvido;

  @Column()
  double valor; //Valor Total da locação, (editável)

  @Column(nullable: true)
  String observacao;

  //Etiqueta, Contexto, Assunto, etc.
  //Grava cada uma separada da outra por espaço.
  //Tabela de domínio: [tags], sem PK ou FK, apenas a tag gravada aqui.
  @Column(nullable: true)
  String tags;

  @Column(nullable: true)
  String ativo; //Inicialmente preenchido com 'S'.

  ManagedSet<LocacaoRoupaItemModel> locacoesRoupaItem;
}
