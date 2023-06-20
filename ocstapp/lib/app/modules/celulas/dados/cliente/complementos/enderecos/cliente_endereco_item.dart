import 'package:OCSTApp/app/models/cliente_endereco_model.dart';
import 'package:OCSTApp/app/modules/celulas/dados/cliente/cliente_controller.dart';
import 'package:OCSTApp/app/modules/celulas/operacional/atendimento_servico/atendimento_servico_controller.dart';
import 'package:OCSTApp/app/repositories/cliente_repository.dart';
import 'package:OCSTApp/app/repositories/usuario_repository.dart';
import 'package:OCSTApp/app/utils/snackbar_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class ClienteEnderecoItem extends StatelessWidget {
  final ClienteEnderecoModel item;
  final ClienteController controller;

  const ClienteEnderecoItem({
    Key key,
    this.item,
    this.controller,
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
                  image: AssetImage('assets/images/dds-cliente-endereco.png'),
                  height: 320,
                ),
              ),
              title: Text(
                "${item.rua}, ${item.numero}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
              subtitle: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Text(
                                '${item.bairro}, ${item.cidade} - ${item.estado}',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w400),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: Text(
                                '${item.pais} / CEP ${item.cep}',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w300),
                              ),
                            ),
                            // Text(
                            // 'Quadril\n${nF.format(item.quadril)}',
                            // style: TextStyle(
                            // fontSize: 16, fontWeight: FontWeight.w400),
                            // ),
                          ],
                        ),
                        Visibility(
                          visible: item.complemento.length > 0,
                          child: Text(
                            '${item.complemento}',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w300),
                          ),
                        ),
                        _makeTags(item.tags),
                      ],
                    ),
                  ),
                ],
              ),
              // onTap: () => petEscolhido(item),
            ),
          ),
          actions: <Widget>[
            IconSlideAction(
              caption: 'EDITAR',
              color: Colors.green,
              icon: Icons.edit,
              onTap: () => editar(item),
            ),
            IconSlideAction(
              caption: 'MAPA',
              color: Colors.yellow,
              icon: Icons.location_on,
              onTap: () => mapa(item),
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
                    'Vou apagar o Endereço ${item.rua}, ${item.numero}, ${item.bairro}. Posso?',
                    item)),
          ],
        )
      ],
    );
  }

  Widget _makeTags(String tagsItem) {
    GlobalKey<TagsState> globalKeyTag = GlobalKey<TagsState>();
    List tags = controller.tagStringParaTagsList(tagsItem);
    return Visibility(
      visible: tags.length > 0,
      child: Container(
        child: Tags(
          key: globalKeyTag,
          itemCount: tags.length,
          alignment: WrapAlignment.start,
          horizontalScroll: true,
          heightHorizontalScroll: 35,
          spacing: 2,
          itemBuilder: (index) {
            final Item currentItem = Item(title: tags[index].title);
            return ItemTags(
              index: index,
              title: currentItem.title,
              border: Border.all(color: Colors.black, width: 0.5),
              // activeColor: Colors.grey.shade200,
              activeColor: tags[index].title == controller.filter
                  ? Colors.yellow.shade200
                  : Colors.grey.shade200,
              colorShowDuplicate: Colors.red.shade200,
              color: Colors.green.shade100,
              textActiveColor: Colors.black,
              customData: currentItem.customData,
              textStyle: TextStyle(fontSize: 10),
              combine: ItemTagsCombine.withTextBefore,
              onPressed: (i) => print(i),
              onLongPressed: (i) =>
                  controller.filter.length == 0 || controller.filter != i.title
                      ? controller.setFilter(i.title)
                      : controller.setFilter(''),
            );
          },
        ),
      ),
    );
  }

  enderecoEscolhido(ClienteEnderecoModel item) async {
    // final usuarioRepository = new UsuarioRepository();
    // final sistemaRef = await usuarioRepository
    //     .obterDadosDoSistemaEscolhidoPeloUsuario(
    //         await usuarioRepository.getLogin())
    //     .then((res) => res.sistemaRef);

    // // if (sistemaRef == 'refOficinaCarros' ||
    // //     sistemaRef == 'refCabeleireiro' ||
    // //     sistemaRef == 'refDentista' ||
    // //     sistemaRef == 'refPetShop' ||
    // //     sistemaRef == 'refClinicaEstetica' ||
    // //     sistemaRef == 'refEstudioFotografico') {
    // var controller = GetIt.I.get<AtendimentoServicoController>();
    // controller.clienteObjetoEscolhidoId = item.id;
    // controller.clienteObjetoEscolhidoNome = item.bairro;
    // Get.back();
  }

  Future editar(ClienteEnderecoModel item) async {
    SnackBarUtils.showSnackBarFuncNotImplement();
    // return Get.toNamed('/cliente_pet_editar', arguments: {'item': item});
  }

  Future mapa(ClienteEnderecoModel item) async {
    SnackBarUtils.showSnackBarFuncNotImplement();
    // return Get.toNamed('/cliente_pet_editar', arguments: {'item': item});
  }

  void confirmarAcao(
    BuildContext context,
    String acao,
    String msg,
    ClienteEnderecoModel item,
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
    SnackBarUtils.showSnackBarFuncNotImplement();
    // final repository = new ClienteRepository();
    // // SnackBarUtils.showSnackBar('Atenção',
    // //     await repository.apagarEnderecoCliente(item.id).then((t) => t));
    // //Trocar isso depois para o método principal
    // //a ser usado pelo usuário no filtro, etc.
    // // clienteController.consultarVariosEnderecosCliente(item.clienteId);
    Get.back();
  }
}
