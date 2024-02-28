import 'package:OCSTApp/app/components/app_flat_button.dart';
import 'package:OCSTApp/app/components/app_text_form_field.dart';
import 'package:OCSTApp/app/core/store_state.dart';
import 'package:OCSTApp/app/mixins/loader_mixin.dart';
import 'package:OCSTApp/app/models/atendimento_servico_item_model.dart';
import 'package:OCSTApp/app/modules/celulas/operacional/atendimento_servico/atendimento_servico_controller.dart';
import 'package:OCSTApp/app/modules/celulas/operacional/atendimento_servico/operacoes/cadastro/cadastro_controller.dart';
import 'package:OCSTApp/app/modules/celulas/operacional/atendimento_servico/operacoes/cadastro/components/produto_escolhido_item.dart';
import 'package:OCSTApp/app/utils/size_utils.dart';
import 'package:OCSTApp/app/utils/snackbar_utils.dart';
import 'package:OCSTApp/app/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

class AtendimentoServicoCadastroPage extends StatefulWidget {
  final String title;
  const AtendimentoServicoCadastroPage(
      {Key key, this.title = "Novo Atendimento"})
      : super(key: key);

  @override
  _AtendimentoServicoCadastroPageState createState() =>
      _AtendimentoServicoCadastroPageState();
}

class _AtendimentoServicoCadastroPageState extends ModularState<
    AtendimentoServicoCadastroPage,
    AtendimentoServicoCadastroController> with LoaderMixin {
  GlobalKey<TagsState> globalKeyTag = GlobalKey<TagsState>();
  List tags = new List();
  //use 'controller' variable to access controller

  List<ReactionDisposer> _disposer;
  AppBar appBar = AppBar(
    elevation: 0,
    title: Text('Novo Atendimento'),
  );

  var atendimentoServicoController =
      GetIt.I.get<AtendimentoServicoController>();

  @override
  Future<void> initState() {
    super.initState();
    controller.getImageAtendimento();
    atendimentoServicoController.definirNomeBotaoObjeto();
    _disposer ??= [
      reaction((_) => controller.state, (StoreState state) {
        if (state == StoreState.initial) {
          showLoader();
        } else if (state == StoreState.loading) {
          showLoader();
        } else if (state == StoreState.loaded) {
          hideLoader();
          Get.back();
        }
      }),
      reaction((_) => controller.errorMessage, (String errorMessage) {
        if (errorMessage.trim().length > 0) {
          SnackBarUtils.showSnackBar('Problemas', errorMessage);
          print('PROBLEMAS: [$errorMessage]');
          //hideLoader();
        }
      })
    ];
    atendimentoServicoController.consultarProdutoDoServico();
    // roupaLocacaoController.valor = roupaLocacaoController.valor ?? "0";
    // roupaLocacaoController.valor =
    // roupaLocacaoController.controllerMaskValor.toString();
  }

  @override
  void dispose() {
    super.dispose();
    _disposer.forEach((d) => d());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _makeHeader(),
            SizedBox(height: 10),
            _makeForm(),
          ],
        ),
      ),
    );
  }

  Widget _makeTags() {
    // roupaLocacaoController.atualizarValor();
    return Container(
      child: Tags(
        key: globalKeyTag,
        itemCount: tags.length,
        columns: 6,
        verticalDirection: VerticalDirection.up,
        textField: TagsTextField(
            hintText: 'Informe a etiqueta aqui ...',
            autofocus: false,
            constraintSuggestion: true,
            suggestions: atendimentoServicoController.tagsModel,
            helperText: 'Não temos essa ...',
            width: SizeUtils.widthScreen - 60,
            textStyle: TextStyle(fontSize: 16),
            onSubmitted: (string) {
              setState(() {
                tags.add(Item(title: string));
              });
              atendimentoServicoController.tagsListParaTagString(tags);
            }),
        itemBuilder: (index) {
          final Item currentItem = Item(title: tags[index].title);
          return ItemTags(
            index: index,
            title: currentItem.title,
            border: Border.all(color: Colors.black, width: 0.5),
            // activeColor: Colors.blueGrey.shade700,
            activeColor: Colors.grey.shade200,
            colorShowDuplicate: Colors.red.shade200,
            color: Colors.yellow.shade300,
            textActiveColor: Colors.black,
            customData: currentItem.customData,
            textStyle: TextStyle(fontSize: 18),
            combine: ItemTagsCombine.withTextBefore,
            // icon: ItemTagsIcon(
            //   icon: Icons.tag_faces,
            // ),
            onPressed: (i) => print(i),
            onLongPressed: (i) => print(i),
            removeButton: ItemTagsRemoveButton(onRemoved: () {
              setState(() {
                // roupaLocacaoController.atualizarValor();
                tags.removeAt(index);
              });
              atendimentoServicoController.tagsListParaTagString(tags);
              return true;
            }),
          );
        },
      ),
    );
  }

  Widget _makeHeader() {
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
          Observer(
            builder: (_) {
              switch (controller.stateSistemaRef) {
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
                  return Positioned(
                    height: SizeUtils.heightScreen * .18,
                    bottom: 70,
                    child: controller.imageAtendimento,
                  );
                case StoreState.error:
                  SnackBarUtils.showSnackBar(
                      'Atenção', controller.errorMessage);
                  return Container();
              }
              return Container();
            },
          ),
          Positioned(
            bottom: 28,
            child: Text(
              'Crie o Atendimento',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            bottom: 12,
            child: Text(
              '(informe os dados iniciais)',
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

  // Image imageAtendimento() {
  //   return Image.asset(
  //     'assets/images/opr-locacao-roupa-reservar.png',
  //   );
  // }

  Form _makeForm() {
    atendimentoServicoController.obterTags();
    return Form(
      key: controller.globalKeyCad,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            AppFlatButton(
              label: atendimentoServicoController.clienteEscolhidoNome,
              onPressed: () => controller.escolherCliente(),
            ),
            SizedBox(height: 10),
            AppTextFormField(
              label: 'Descreva o Atendimento',
              controller: TextEditingController.fromValue(TextEditingValue(
                  text: atendimentoServicoController.descricaoServico ?? "")),
              icon: Icons.note,
              onChanged: (String valor) =>
                  atendimentoServicoController.changeDescricaoServico(valor),
              validator: (String valor) {
                if (valor.trim().isEmpty ||
                    valor.trim().length != valor.length) {
                  return 'Obrigatório, sem espaços antes e depois';
                }
                return null;
              },
            ),
            Visibility(
              visible: (atendimentoServicoController.clienteEscolhidoId != 0 &&
                  atendimentoServicoController
                          .clienteObjetoEscolhidoNome.length >
                      0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10),
                  AppFlatButton(
                    label:
                        atendimentoServicoController.clienteObjetoEscolhidoNome,
                    onPressed: () => controller.escolherObjetoAtendimento(
                        atendimentoServicoController.clienteEscolhidoId,
                        context),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            AppFlatButton(
              label: atendimentoServicoController.iniciarData,
              onPressed: () async {
                var _data = atendimentoServicoController.iniciarDatabase;
                var date = await showDatePicker(
                  context: context,
                  initialDate: _data ?? DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (date == null) return;
                var time = await showTimePicker(
                    context: context,
                    initialTime: _data != null
                        ? TimeOfDay(hour: _data.hour, minute: _data.minute)
                        : TimeOfDay(hour: 12, minute: 00));
                if (date != null && time != null) {
                  setState(() {
                    // roupaLocacaoController.atualizarValor();
                    atendimentoServicoController.setIniciar(date, time);
                  });
                }
              },
            ),
            SizedBox(height: 10),
            AppFlatButton(
              label: atendimentoServicoController.finalizarData,
              onPressed: () async {
                var _data = atendimentoServicoController.finalizarDatabase;
                var date = await showDatePicker(
                  context: context,
                  initialDate: _data ?? DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (date == null) return;
                var time = await showTimePicker(
                    context: context,
                    initialTime: _data != null
                        ? TimeOfDay(hour: _data.hour, minute: _data.minute)
                        : TimeOfDay(hour: 12, minute: 00));
                if (date != null && time != null) {
                  setState(() {
                    // roupaLocacaoController.atualizarValor();
                    atendimentoServicoController.setFinalizar(date, time);
                  });
                }
              },
            ),
            // SizedBox(height: 10),
            Observer(
              builder: (_) {
                switch (atendimentoServicoController.produtosEscolhidosState) {
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
                    return _makeProdutosSelecionados();
                  case StoreState.error:
                    SnackBarUtils.showSnackBar(
                        'Atenção', controller.errorMessage);
                    return Container();
                }
                return Container();
              },
            ),
            SizedBox(height: 10),
            AppFlatButton(
              label: 'Inserir Produto',
              onPressed: () => {
                atendimentoServicoController.origemProdutoTela = 'cadastro',
                controller.escolherProdutos()
              },
            ),
            SizedBox(height: 10),
            Observer(
              builder: (_) {
                switch (atendimentoServicoController.produtosEscolhidosState) {
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
                    return _makeValorServico();
                  case StoreState.error:
                    SnackBarUtils.showSnackBar(
                        'Atenção', controller.errorMessage);
                    return Container();
                }
                return Container();
              },
            ),
            SizedBox(height: 10),
            AppTextFormField(
              label: 'Alguma observação?',
              controller: TextEditingController.fromValue(TextEditingValue(
                  text: atendimentoServicoController.observacao ?? "")),
              keyboardType: TextInputType.text,
              icon: Icons.textsms,
              onChanged: (String valor) =>
                  atendimentoServicoController.changeObservacao(valor.trim()),
              validator: (String valor) {
                if (valor.trim().isEmpty ||
                    valor.trim().length != valor.length) {
                  return 'Obrigatório, letras e números';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            Observer(
              builder: (_) {
                switch (atendimentoServicoController.tagsState) {
                  case StoreState.initial:
                  case StoreState.loading:
                    return Container(
                      padding: EdgeInsets.only(top: 50),
                      height: SizeUtils.heightScreen,
                      alignment: Alignment.topCenter,
                      child: Container(
                        margin: EdgeInsets.only(top: 30),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  case StoreState.loaded:
                    return _makeTags();
                  case StoreState.error:
                    SnackBarUtils.showSnackBar(
                        'Atenção', controller.errorMessage);
                    return Container();
                }
                return Container();
              },
            ),
            SizedBox(height: 10),
            AppFlatButton(
              label: 'Criar Atendimento',
              onPressed: () =>
                  atendimentoServicoController.criarAtendimento('ins'),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  AppTextFormField _makeValorServico() {
    // final nF = new NumberFormat("#,###,##0.00", "pt_BR");
    return AppTextFormField(
      label: 'Quanto custa?',
      keyboardType: TextInputType.number,
      icon: Icons.monetization_on,
      controller: atendimentoServicoController.controllerMaskValor,
      // controller: TextEditingController.fromValue(TextEditingValue(
      // text: "R\$ " + nF.format(roupaLocacaoController.valor) ?? "R\$ 0")),
      // text: nF.format(double.parse(
      // roupaLocacaoController.valor.replaceAll(',', '.'))) ??
      // "0")),

      // onChanged: (valor) => roupaLocacaoController
      // .changeValor(double.parse(valor.replaceAll(',', '.'))),
      // onChanged: (valor) => roupaLocacaoController.changeValor(valor),

      validator: (valor) {
        if (valor.isEmpty) {
          return 'Obrigatório informar o valor';
        }
        return null;
      },
      // apenasValores: true,
    );
  }

  Visibility _makeProdutosSelecionados() {
    var atendimentoServicoItens = List<AtendimentoServicoItemModel>();
    for (var produto in atendimentoServicoController.produtosEscolhidos) {
      var atendimentoServicoItem = AtendimentoServicoItemModel();
      atendimentoServicoItem.produtoId = produto.id;
      atendimentoServicoItem.itemAtendimentoServicoId = produto.id;
      atendimentoServicoItem.produtoNome = produto.nome;
      atendimentoServicoItem.produtoDescricao = produto.descricao;
      atendimentoServicoItem.produtoPreco = produto.preco;
      atendimentoServicoItens.add(atendimentoServicoItem);
    }
    return Visibility(
      visible: atendimentoServicoController.produtosEscolhidos.length > 0,
      child: ListView.separated(
        controller: ScrollController(keepScrollOffset: false),
        shrinkWrap: true,
        padding: const EdgeInsets.only(top: 10),
        itemBuilder: (_, index) => AtendimentoProdutoEscolhidoItem(
          item: atendimentoServicoItens[index],
          atendimentoServicoController: atendimentoServicoController,
        ),
        separatorBuilder: (_, index) => Divider(color: Colors.black),
        itemCount: atendimentoServicoItens.length,
      ),
    );
  }
}
