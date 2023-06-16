import 'package:OCSTApp/app/components/app_flat_button.dart';
import 'package:OCSTApp/app/components/app_text_form_field.dart';
import 'package:OCSTApp/app/modules/celulas/dados/cliente/cliente_controller.dart';
import 'package:OCSTApp/app/utils/size_utils.dart';
import 'package:OCSTApp/app/utils/snackbar_utils.dart';
import 'package:OCSTApp/app/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ClienteDetalhesDialog extends StatelessWidget {
  final int clienteId;
  const ClienteDetalhesDialog({Key key, this.clienteId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final clienteController = ClienteController();
    _popularVarComDadosDoParametro(context, clienteController);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('Detalhes do Cliente'),
      ),
      backgroundColor: Colors.white,
      body: _makeTabs(context, clienteController),
    );
  }

  Widget _makeTabs(BuildContext context, ClienteController clienteController) {

    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: TabBar(
          indicatorWeight: 1,
          indicatorColor: Colors.black,
          tabs: <Widget>[
            Tab(
              text: 'Pessoa',
            ),
            Tab(
              text: 'Empresa',
            ),
          ],
        ),
        // ),
        body: TabBarView(
          children: <Widget>[
            SingleChildScrollView(
                child: _makeFormPessoaFisica(clienteController)),
            SingleChildScrollView(
                child: _makeFormPessoaJuridica(clienteController)),
          ],
        ),
      ),
    );
  }

  Widget _makeHeaderPessoaFisica() {
    return Container(
      decoration: BoxDecoration(
        color: ThemeUtils.primaryColor,
        border: Border(bottom: BorderSide(width: 1, color: Colors.black12)),
      ),
      height: (SizeUtils.heightScreen * .35) - SizeUtils.statusBarHeight,
      width: SizeUtils.widthScreen * 2,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            height: SizeUtils.heightScreen * .18,
            bottom: 70,
            child: Image.asset(
              'assets/images/dds-cliente-pf-detalhes.png',
            ),
          ),
          Positioned(
            bottom: 28,
            child: Text(
              'Cliente Pessoa Física',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            bottom: 12,
            child: Text(
              '(informe os Detalhes da Pessoa)',
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _makeHeaderPessoaJuridica() {
    return Container(
      decoration: BoxDecoration(
        color: ThemeUtils.primaryColor,
        border: Border(bottom: BorderSide(width: 1, color: Colors.black12)),
      ),
      height: (SizeUtils.heightScreen * .35) - SizeUtils.statusBarHeight,
      width: SizeUtils.widthScreen * 2,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            height: SizeUtils.heightScreen * .18,
            bottom: 70,
            child: Image.asset(
              'assets/images/dds-cliente-pj-detalhes.png',
            ),
          ),
          Positioned(
            bottom: 28,
            child: Text(
              'Cliente Pessoa Jurídica',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            bottom: 12,
            child: Text(
              '(informe os Detalhes da Empresa)',
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Form _makeFormPessoaFisica(ClienteController clienteController) {
    return Form(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            _makeHeaderPessoaFisica(),
            SizedBox(height: 10),
            AppTextFormField(
              label: 'CPF',
              keyboardType: TextInputType.number,
              icon: Icons.credit_card,
            ),
            SizedBox(height: 10),
            AppTextFormField(
              label: 'RG',
              keyboardType: TextInputType.number,
              icon: Icons.confirmation_number,
            ),
            SizedBox(height: 10),
            AppTextFormField(
              label: 'Nascimento',
              keyboardType: TextInputType.datetime,
              icon: Icons.date_range,
            ),
            SizedBox(height: 10),
            AppTextFormField(
              label: 'Gênero',
              keyboardType: TextInputType.text,
              icon: Icons.people_outline,
            ),
            SizedBox(height: 10),
            AppTextFormField(
              label: 'Observação',
              keyboardType: TextInputType.text,
              icon: Icons.note,
            ),
            SizedBox(height: 10),
            AppFlatButton(
              label: 'Gravar',
              onPressed: () => gravarPessoaFisica(clienteController),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Form _makeFormPessoaJuridica(ClienteController clienteController) {
    return Form(
      // key: clienteController.globalKeyAlt,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            _makeHeaderPessoaJuridica(),
            SizedBox(height: 10),
            AppTextFormField(
              label: 'CNPJ',
              keyboardType: TextInputType.number,
              icon: Icons.credit_card,
            ),
            SizedBox(height: 10),
            AppTextFormField(
              label: 'Razão Social',
              keyboardType: TextInputType.text,
              icon: Icons.note,
            ),
            SizedBox(height: 10),
            AppTextFormField(
              label: 'Atividade',
              keyboardType: TextInputType.text,
              icon: Icons.textsms,
            ),
            SizedBox(height: 10),
            AppTextFormField(
              label: 'Data da Criação',
              keyboardType: TextInputType.datetime,
              icon: Icons.date_range,
            ),
            SizedBox(height: 10),
            AppTextFormField(
              label: 'Observação',
              keyboardType: TextInputType.text,
              icon: Icons.note,
            ),
            SizedBox(height: 10),
            AppFlatButton(
              label: 'Gravar',
              onPressed: () => gravarPessoaJuridica(clienteController),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  gravarPessoaFisica(ClienteController clienteController) async {
    SnackBarUtils.showSnackBarFuncNotImplement();
  }

  gravarPessoaJuridica(ClienteController clienteController) async {
    SnackBarUtils.showSnackBarFuncNotImplement();
  }

  _popularVarComDadosDoParametro(
      BuildContext context, ClienteController clienteController) {
    final nF = new NumberFormat("#,###,##0.00", "pt_BR");
  }
}
