import 'package:OCSTApp/app/models/cliente_manequim_model.dart';
import 'package:OCSTApp/app/models/cliente_pet_model.dart';
import 'package:OCSTApp/app/models/produto_model.dart';
import 'package:OCSTApp/app/modules/celulas/dados/cliente/cliente_controller.dart';
import 'package:OCSTApp/app/modules/celulas/operacional/atendimento_servico/atendimento_servico_controller.dart';
import 'package:OCSTApp/app/repositories/cliente_repository.dart';
import 'package:OCSTApp/app/repositories/usuario_repository.dart';
import 'package:OCSTApp/app/utils/snackbar_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class ClientePetItem extends StatelessWidget {
  final ClientePetModel item;
  final ClienteController clienteController;

  const ClientePetItem({
    Key key,
    this.item,
    this.clienteController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Slidable(
          actionPane: SlidableBehindActionPane(),
          actionExtentRatio: 0.25,
          child: Container(
            // color: Colors.white,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                maxRadius: 30,
                child: Image(
                  image: AssetImage('assets/images/dds-cliente-pet.png'),
                  height: 320,
                ),
              ),
              title: Text(
                "${item.nome} ${item.cor}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
              // subtitle: Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: <Widget>[
              //     Table(
              //       children: [
              //         TableRow(children: <Widget>[
              //           Text(
              //             'Busto\n${nF.format(item.busto)}',
              //             style: TextStyle(
              //                 fontSize: 16, fontWeight: FontWeight.w400),
              //           ),
              //           Text(
              //             'Cintura\n${nF.format(item.cintura)}',
              //             style: TextStyle(
              //                 fontSize: 16, fontWeight: FontWeight.w400),
              //           ),
              //           Text(
              //             'Quadril\n${nF.format(item.quadril)}',
              //             style: TextStyle(
              //                 fontSize: 16, fontWeight: FontWeight.w400),
              //           ),
              //         ]),
              //       ],
              //     ),
              //     Text(
              //       item.observacao,
              //       style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
              //     ),
              //   ],
              // ),

              subtitle: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Text(
                                item.raca,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: Text(
                                '(${item.anoNascimento}/${item.mesNascimento})',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                            ),
                            // Text(
                            // 'Quadril\n${nF.format(item.quadril)}',
                            // style: TextStyle(
                            // fontSize: 16, fontWeight: FontWeight.w400),
                            // ),
                          ],
                        ),
                        Text(
                          item.observacao,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              onTap: () => petEscolhido(item),
            ),
          ),
          actions: <Widget>[
            IconSlideAction(
              caption: 'EDITAR',
              color: Colors.green,
              icon: Icons.edit,
              onTap: () => editar(item),
            ),
          ],
          secondaryActions: <Widget>[
            IconSlideAction(
                caption: 'APAGAR',
                color: Colors.red,
                icon: Icons.delete_outline,
                onTap: () => confirmarAcao(
                    context,
                    'APAGAR',
                    'Vou apagar o Veículo ${item.nome} ${item.raca} ${item.cor}. Posso?',
                    item)),
          ],
        )
      ],
    );
  }

  petEscolhido(ClientePetModel item) async {
    final usuarioRepository = new UsuarioRepository();
    final sistemaRef = await usuarioRepository
        .obterDadosDoSistemaEscolhidoPeloUsuario(
            await usuarioRepository.getLogin())
        .then((res) => res.sistemaRef);

    // if (sistemaRef == 'refOficinaCarros' ||
    //     sistemaRef == 'refCabeleireiro' ||
    //     sistemaRef == 'refDentista' ||
    //     sistemaRef == 'refPetShop' ||
    //     sistemaRef == 'refClinicaEstetica' ||
    //     sistemaRef == 'refEstudioFotografico') {
    var controller = GetIt.I.get<AtendimentoServicoController>();
    controller.clienteObjetoEscolhidoId = item.id;
    controller.clienteObjetoEscolhidoNome = item.nome;
    Get.back();
//    }
  }

  Future editar(ClientePetModel item) async {
    return Get.toNamed('/cliente_pet_editar', arguments: {'item': item});
  }

  void confirmarAcao(
    BuildContext context,
    String acao,
    String msg,
    ClientePetModel item,
  ) {
    Widget naoButton = FlatButton(
      child: Text("Não"),
      onPressed: () {
        Get.back();
      },
    );
    Widget simButton = FlatButton(
      child: Text("Sim"),
      onPressed: () {
        switch (acao) {
          case 'APAGAR':
            apagar();
            break;
          //  case 'LIBERAR':
          //    delegarColaborador(pessoaSendoDelegada, novoLider);
          //    break;
          default:
        }
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text("Atenção"),
      content: Text(msg),
      actions: [
        naoButton,
        simButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void apagar() async {
    final repository = new ClienteRepository();
    SnackBarUtils.showSnackBar(
        'Atenção', await repository.apagarPetCliente(item.id).then((t) => t));
    //Trocar isso depois para o método principal
    //a ser usado pelo usuário no filtro, etc.
    clienteController.consultarVariosPetsCliente(item.clienteId);
    Get.back();
  }
}
