import 'package:OCSTApp/app/core/store_state.dart';
import 'package:OCSTApp/app/modules/celulas/dados/cliente/cliente_controller.dart';
import 'package:OCSTApp/app/modules/celulas/dados/cliente/complementos/enderecos/cliente_endereco_item.dart';
import 'package:OCSTApp/app/utils/size_utils.dart';
import 'package:OCSTApp/app/utils/snackbar_utils.dart';
import 'package:OCSTApp/app/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';

class ClienteEnderecoDialog extends StatelessWidget {
  final int clienteId;
  const ClienteEnderecoDialog({Key key, this.clienteId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final clienteController = GetIt.I.get<ClienteController>();
    final clienteController = ClienteController();
    clienteController.consultarVariosEnderecosCliente(clienteId);
    return Scaffold(
      floatingActionButton: buildFloatingActionButton(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('Endereços do Cliente'),
      ),
      backgroundColor: Colors.white,
      body: Observer(
        builder: (_) {
          switch (clienteController.enderecosClienteState) {
            case StoreState.initial:
            case StoreState.loading:
              return Container(
                height: SizeUtils.heightScreen,
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.only(top: 30),
                  child: CircularProgressIndicator(),
                ),
              );
            case StoreState.loaded:
              return _makeEnderecosCliente(clienteController);
            case StoreState.error:
              SnackBarUtils.showSnackBar(
                  'Atenção', clienteController.errorMessage);
              return Container();
          }
          return Container();
        },
      ),
    );
  }

  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        SnackBarUtils.showSnackBarFuncNotImplement();
        // Get.toNamed('/cliente_endereco_cadastro',
        //     arguments: {'clienteId': clienteId});
      },
      child: Icon(
        Icons.add,
        color: Colors.black,
      ),
      backgroundColor: ThemeUtils.primaryColor,
    );
  }

  ListView _makeEnderecosCliente(ClienteController clienteController) {
    return ListView.separated(
      controller: ScrollController(keepScrollOffset: false),
      shrinkWrap: true,
      padding: const EdgeInsets.only(bottom: 80),
      itemBuilder: (_, index) => ClienteEnderecoItem(
        item: clienteController.enderecosCliente[index],
        controller: clienteController,
      ),
      separatorBuilder: (_, index) => Divider(color: Colors.black),
      itemCount: clienteController.enderecosCliente.length,
    );
  }
}
