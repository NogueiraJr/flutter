import 'package:ocstapi/model/cliente_model.dart';

class ClienteManequimModel extends ManagedObject<_ClienteManequimModel>
    implements _ClienteManequimModel {}

@Table(name: 'cliente_manequim')
class _ClienteManequimModel {
  @Column(primaryKey: true, autoincrement: true)
  int id;

  @Relate(#manequins)
  ClienteModel cliente;

  @Column()
  DateTime data;

  @Column()
  double busto;

  @Column()
  double cintura;

  @Column()
  double quadril;

  @Column(nullable: true)
  double altura;

  @Column(nullable: true)
  double peso;

  @Column(nullable: true)
  double pescoco;

  @Column(nullable: true)
  double ombro;

  @Column(nullable: true)
  double torax;

  @Column(nullable: true)
  double bracoLargura;

  @Column(nullable: true)
  double bracoComprimento;

  @Column(nullable: true)
  double costasLargura;

  @Column(nullable: true)
  double quadrilAltura;

  @Column(nullable: true)
  double barriga;

  @Column(nullable: true)
  double coxaLargura;

  @Column(nullable: true)
  double pernaComprimento;

  @Column(nullable: true)
  String observacao;
}
