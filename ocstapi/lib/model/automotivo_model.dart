class AutomotivoModel extends ManagedObject<_AutomotivoModel>
    implements _AutomotivoModel {}

@Table(name: 'automotivo')
class _AutomotivoModel {
  @Column(primaryKey: true)
  int id;

  @Column()
  double velocMedia;

  @Column()
  double tempoGasto;

  //Calc
  @Column(nullable: true)
  double distPercorida;

  //Calc
  @Column(nullable: true)
  double litrosGastos;

  //
  @Column()
  double kmPorLitro;
}
