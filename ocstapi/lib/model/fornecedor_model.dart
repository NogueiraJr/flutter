import 'package:ocstapi/model/usuario_model.dart';
import '../ocstapi.dart';

class FornecedorModel extends ManagedObject<_FornecedorModel>
    implements _FornecedorModel {}

@Table(name: 'fornecedor')
class _FornecedorModel {
  @Column(primaryKey: true, autoincrement: true)
  int id;

  @Relate(#fornecedores)
  UsuarioModel usuario;

  @Column()
  String nome;

  @Column()
  String telefone;

  @Column()
  String email;

  //Etiqueta, Contexto, Assunto, etc.
  //Grava cada uma separada da outra por espaço.
  //Tabela de domínio: [tags], sem PK ou FK, apenas a tag gravada aqui.
  @Column(nullable: true)
  String tags;

  @Column(nullable: true)
  String ativo;
}
