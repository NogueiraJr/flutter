import 'package:OCSTApp/app/core/store_state.dart';
import 'package:OCSTApp/app/modules/celulas/operacional/atendimento_servico/atendimento_servico_controller.dart';
import 'package:OCSTApp/app/modules/celulas/operacional/atendimento_servico/info/atendimento_servico_info_item.dart';
import 'package:OCSTApp/app/utils/size_utils.dart';
import 'package:OCSTApp/app/utils/snackbar_utils.dart';
import 'package:OCSTApp/app/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class AtendimentoServicoInfoDialog extends StatefulWidget {
  final int atendimentoServicoId;
  const AtendimentoServicoInfoDialog({Key key, this.atendimentoServicoId})
      : super(key: key);

  @override
  _AtendimentoServicoInfoDialogState createState() =>
      _AtendimentoServicoInfoDialogState();
}

final atendimentoServicoController =
    GetIt.I.get<AtendimentoServicoController>();
// final atendimentoServicoController = AtendimentoServicoController();

class _AtendimentoServicoInfoDialogState
    extends State<AtendimentoServicoInfoDialog> {
  @override
  Widget build(BuildContext context) {
    atendimentoServicoController
        .consultarAtendimentoServicoInfo(widget.atendimentoServicoId);
    return Scaffold(
      floatingActionButton: buildFloatingActionButton(),
      appBar: AppBar(
        actions: _buildActions(),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('Atuação'),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 15, right: 80),
            color: Colors.white,
            child: TextFormField(
              onChanged: atendimentoServicoController.setFilterInfo,
              initialValue: atendimentoServicoController.filterInfo,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w300,
                letterSpacing: 1,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                hintText: 'Digite aqui para procurar',
              ),
            ),
          ),
          Expanded(
            child: Observer(
              builder: (_) {
                switch (
                    atendimentoServicoController.atendimentoServicoInfoState) {
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
                    return _makeAtendimentoServicoInfo(
                        atendimentoServicoController);
                  case StoreState.error:
                    SnackBarUtils.showSnackBar(
                        'Atenção', atendimentoServicoController.errorMessage);
                    return Container();
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildActions() {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.update),
        tooltip: 'Atualizar',
        onPressed: () async {
          await atendimentoServicoController
              .consultarAtendimentoServicoInfo(widget.atendimentoServicoId);
        },
      ),
      PopupMenuButton<String>(
        icon: Icon(Icons.more_vert),
        onSelected: (opcaoMenu) {
          //controller.acaoDoMenuEscolhido(opcaoMenu);
        },
        itemBuilder: (_) {
          return [
            PopupMenuItem<String>(
              value: 'ajuda',
              child: Text(
                'Ajuda',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // PopupMenuItem<String>(
            //   value: '',
            //   child: Text(
            //     'Opção 1 Produto',
            //     style: TextStyle(fontSize: 14),
            //   ),
            // ),
            // PopupMenuItem<String>(
            //   value: '',
            //   child: Text(
            //     'Opção 2 Produto DEF XXX',
            //     style: TextStyle(fontSize: 14),
            //   ),
            // ),
            // PopupMenuItem<String>(
            //   value: '',
            //   child: Text(
            //     'Opção 2 Produto GHI',
            //     style: TextStyle(fontSize: 14),
            //   ),
            // ),
            // PopupMenuItem<String>(
            //   value: '',
            //   child: Text(
            //     'Opção 5 Produto JLM 12345',
            //     style: TextStyle(fontSize: 14),
            //   ),
            // ),
          ];
        },
      ),
    ];
  }

  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        Get.toNamed('/atendimento_servico_info_cadastro',
            arguments: {'atendimentoServicoId': widget.atendimentoServicoId});
      },
      child: Icon(
        Icons.add,
        color: Colors.black,
      ),
      backgroundColor: ThemeUtils.primaryColor,
    );
  }

  ListView _makeAtendimentoServicoInfo(
      AtendimentoServicoController atendimentoServicoController) {
    return ListView.separated(
      controller: ScrollController(keepScrollOffset: false),
      shrinkWrap: true,
      padding: const EdgeInsets.only(bottom: 80),
      itemBuilder: (_, index) => AtendimentoServicoInfoItem(
        item: atendimentoServicoController.filterInfo.length == 0
            ? atendimentoServicoController.atendimentoServicoInfo[index]
            : atendimentoServicoController.listFilteredInfo[index],
        controller: atendimentoServicoController,
      ),
      separatorBuilder: (_, index) => Divider(color: Colors.black),
      itemCount: atendimentoServicoController.filterInfo.length == 0
          ? atendimentoServicoController.atendimentoServicoInfo.length
          : atendimentoServicoController.listFilteredInfo?.length ?? 0,
    );
  }
}
