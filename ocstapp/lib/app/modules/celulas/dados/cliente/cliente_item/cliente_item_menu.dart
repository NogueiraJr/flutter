import 'package:OCSTApp/app/models/cliente_model.dart';
import 'package:OCSTApp/app/modules/celulas/dados/cliente/complementos/detalhes/cliente_detalhes_dialog.dart';
import 'package:OCSTApp/app/modules/celulas/dados/cliente/complementos/enderecos/cliente_endereco_dialog.dart';
import 'package:OCSTApp/app/modules/celulas/dados/cliente/complementos/manequim/cliente_manequim_dialog.dart';
import 'package:OCSTApp/app/modules/celulas/dados/cliente/complementos/pets/cliente_pet_dialog.dart';
import 'package:OCSTApp/app/modules/celulas/dados/cliente/complementos/veiculos/cliente_veiculo_dialog.dart';
import 'package:OCSTApp/app/modules/principal/principal_controller.dart';
import 'package:OCSTApp/app/utils/snackbar_utils.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ClienteItemMenu {
  PopupMenuButton<String> buildPopupMenuButton(
      BuildContext context, ClienteModel item) {
    return PopupMenuButton<String>(
      tooltip: 'Mais ações para este item',
      icon: Icon(
        Icons.more_vert,
        color: Colors.black54,
      ),
      onSelected: (opcaoMenu) {
        _selectMenu(opcaoMenu, item, context);
      },
      itemBuilder: _buildPopupMenus,
    );
  }
}

List<PopupMenuEntry<String>> _buildPopupMenus(_) {
  var controller = GetIt.I.get<PrincipalController>();
  List<PopupMenuEntry<String>> menus = [];
  menus.add(_buildPopupMenuClienteDetalhes());
  // menus.add(_buildPopupMenuClienteDodumentos());
  menus.add(_buildPopupMenuClienteEnderecos());
  switch (controller.idSistema) {
    case 1: /*refLocacaoRoupas*/
      menus.add(_buildPopupMenuClienteManequim());
      return menus;
    case 3: /*refOficinaCarros*/
      menus.add(_buildPopupMenuClienteVeiculos());
      return menus;
    case 6: /*refPetShop*/
      menus.add(_buildPopupMenuClienteAnimais());
      return menus;
    case 10: /*refClinicaVeterinaria*/
      menus.add(_buildPopupMenuClienteAnimais());
      return menus;
    default:
      return menus;
  }
}

PopupMenuItem<String> _buildPopupMenuClienteDetalhes() {
  return PopupMenuItem<String>(
      value: 'clienteDetalhes',
      child: Column(children: <Widget>[
        Row(children: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Icon(Icons.receipt, color: Colors.black54)),
          // child: Icon(Icons.person, color: Colors.black54)),
          Text('Detalhes',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
        ])
      ]));
}

// PopupMenuItem<String> _buildPopupMenuClienteDodumentos() {
//   return PopupMenuItem<String>(
//       value: 'clienteDocumentos',
//       child: Column(children: <Widget>[
//         Row(children: <Widget>[
//           Padding(
//               padding: const EdgeInsets.only(right: 8),
//               child: Icon(Icons.account_balance_wallet, color: Colors.black54)),
//           // child: Icon(Icons.person, color: Colors.black54)),
//           Text('Documentos',
//               style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
//         ])
//       ]));
// }

PopupMenuItem<String> _buildPopupMenuClienteEnderecos() {
  return PopupMenuItem<String>(
      value: 'clienteEnderecos',
      child: Column(children: <Widget>[
        Row(children: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Icon(Icons.location_on, color: Colors.black54)),
          // child: Icon(Icons.person, color: Colors.black54)),
          Text('Endereços',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
        ])
      ]));
}

PopupMenuItem<String> _buildPopupMenuClienteVeiculos() {
  return PopupMenuItem<String>(
      value: 'clienteVeiculos',
      child: Column(children: <Widget>[
        Row(children: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Icon(Icons.directions_car, color: Colors.black54)),
          Text('Veículos',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
        ])
      ]));
}

PopupMenuItem<String> _buildPopupMenuClienteAnimais() {
  return PopupMenuItem<String>(
      value: 'clienteAnimais',
      child: Column(children: <Widget>[
        Row(children: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Icon(Icons.pets, color: Colors.black54)),
          Text('Animais',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
        ])
      ]));
}

PopupMenuItem<String> _buildPopupMenuClienteManequim() {
  return PopupMenuItem<String>(
      value: 'clienteManequim',
      child: Column(children: <Widget>[
        Row(children: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Icon(Icons.accessibility, color: Colors.black54)),
          Text('Manequim',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
        ])
      ]));
}

void _selectMenu(String opcaoMenu, ClienteModel item, BuildContext context) {
  switch (opcaoMenu) {
    case 'clienteDetalhes':
      _detalhes(item.id, context);
      break;
    case 'clienteEnderecos':
      // SnackBarUtils.showSnackBarFuncNotImplement();
      _enderecos(item.id, context);
      break;

    case 'clienteManequim':
      _manequim(item.id, context);
      break;
    case 'clienteVeiculos':
      _veiculo(item.id, context);
      break;
    case 'clienteAnimais':
      _animais(item.id, context);
      break;
    default:
  }
}

_detalhes(int clienteId, BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute<void>(
      builder: (BuildContext context) =>
          ClienteDetalhesDialog(clienteId: clienteId),
      fullscreenDialog: true,
    ),
  );
}

_enderecos(int clienteId, BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute<void>(
      builder: (BuildContext context) =>
          ClienteEnderecoDialog(clienteId: clienteId),
      fullscreenDialog: true,
    ),
  );
}

_manequim(int clienteId, BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute<void>(
      builder: (BuildContext context) =>
          ClienteManequimDialog(clienteId: clienteId),
      fullscreenDialog: true,
    ),
  );
}

_veiculo(int clienteId, BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute<void>(
      builder: (BuildContext context) =>
          ClienteVeiculoDialog(clienteId: clienteId),
      fullscreenDialog: true,
    ),
  );
}

_animais(int clienteId, BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute<void>(
      builder: (BuildContext context) => ClientePetDialog(clienteId: clienteId),
      fullscreenDialog: true,
    ),
  );
}
