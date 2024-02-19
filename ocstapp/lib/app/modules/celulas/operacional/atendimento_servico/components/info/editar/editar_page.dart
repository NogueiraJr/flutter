import 'package:OCSTApp/app/components/app_flat_button.dart';
import 'package:OCSTApp/app/components/app_text_form_field.dart';
import 'package:OCSTApp/app/core/store_state.dart';
import 'package:OCSTApp/app/mixins/loader_mixin.dart';
import 'package:OCSTApp/app/models/atendimento_servico_info_model.dart';
import 'package:OCSTApp/app/modules/celulas/operacional/atendimento_servico/atendimento_servico_controller.dart';
import 'package:OCSTApp/app/modules/celulas/operacional/atendimento_servico/info/editar/editar_controller.dart';
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

class AtendimentoServicoInfoEditarPage extends StatefulWidget {
  final String title;
  const AtendimentoServicoInfoEditarPage({Key key, this.title = "Editar"})
      : super(key: key);

  @override
  _AtendimentoServicoInfoEditarPageState createState() =>
      _AtendimentoServicoInfoEditarPageState();
}

class _AtendimentoServicoInfoEditarPageState extends ModularState<
    AtendimentoServicoInfoEditarPage,
    AtendimentoServicoInfoEditarController> with LoaderMixin {
  GlobalKey<TagsState> globalKeyTag = GlobalKey<TagsState>();
  List tags = new List();
  //use 'controller' variable to access controller

  List<ReactionDisposer> _disposer;
  AppBar appBar = AppBar(
    elevation: 0,
    title: Text('Editar'),
  );

  AtendimentoServicoInfoModel item;
  // var AtendimentoServicoInfoEditarController =
  //     GetIt.I.get<AtendimentoServicoInfoEditarController>();

  // @override
  // void initState() {
  //   super.initState();
  //   _popularVarComDadosDoParametro();
  //   _disposer ??= [
  //     reaction((_) => controller.state, (StoreState state) {
  //       if (state == StoreState.initial) {
  //         showLoader();
  //       } else if (state == StoreState.loading) {
  //         showLoader();
  //       } else if (state == StoreState.loaded) {
  //         hideLoader();
  //         Get.back();
  //       }
  //     }),
  //     reaction((_) => controller.errorMessage, (String errorMessage) {
  //       if (errorMessage.trim().length > 0) {
  //         SnackBarUtils.showSnackBar('Problemas', errorMessage);
  //         print('PROBLEMAS: [$errorMessage]');
  //       }
  //     }),
  //   ];
  // }

  @override
  void initState() {
    super.initState();
    _popularVarComDadosDoParametro();
    tags = controller.tagStringParaTagsList();

    _disposer ??= [
      reaction((_) => controller.state, (StoreState state) {
        if (state == StoreState.initial) {
          showLoader();
          // produtoController.obterTags();
        } else if (state == StoreState.loading) {
          showLoader();
        } else if (state == StoreState.loaded) {
          hideLoader();
          // Get.back();
        }
      }),
      reaction((_) => controller.errorMessage, (String errorMessage) {
        if (errorMessage.trim().length > 0) {
          SnackBarUtils.showSnackBar('Problemas', errorMessage);
          print('PROBLEMAS: [$errorMessage]');
        }
      }),
    ];
  }

  @override
  void dispose() {
    super.dispose();
    _disposer.forEach((d) => d());
    GetIt.I.unregister<AtendimentoServicoInfoModel>();
  }

  @override
  Widget build(BuildContext context) {
    //_popularVarComDadosDoParametro();
    tags = controller.tagStringParaTagsList();
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
          Positioned(
            height: SizeUtils.heightScreen * .18,
            bottom: 70,
            child: Image.asset(
              'assets/images/opr-atendimento-servico-info.png',
            ),
          ),
          Positioned(
            bottom: 28,
            child: Text(
              'Altere a atuação',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            bottom: 12,
            child: Text(
              '(ocorrência, evento, notificação, etc.)',
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

  Form _makeForm() {
    controller.obterTags();
    return Form(
      key: controller.globalKeyCad,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            AppTextFormField(
              label: 'Descrição',
              initialValue:
                  controller.descricao == null ? 'N/C' : controller.descricao,
              keyboardType: TextInputType.text,
              // controller: controller.controllerMaskBusto,
              icon: Icons.note,
              onChanged: (String valor) => controller.changeDescricao(valor),
              validator: (String valor) {
                if (valor.trim().isEmpty ||
                    valor.trim().length != valor.length) {
                  return 'Obrigatório, letras e números';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            AppTextFormField(
              label: 'Observação',
              initialValue:
                  controller.observacao == null ? 'N/C' : controller.observacao,
              keyboardType: TextInputType.text,
              // controller: controller.controllerMaskCintura,
              icon: Icons.textsms,
              onChanged: (String valor) => controller.changeObservacao(valor),
              // validator: (String valor) {
              //   if (valor.trim().isEmpty ||
              //       valor.trim().length != valor.length) {
              //     return 'Obrigatório, letras e números';
              //   }
              //   return null;
              // },
            ),
            SizedBox(height: 10),
            Observer(
              builder: (_) {
                switch (controller.tagsState) {
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
              label: 'Gravar',
              onPressed: () => gravar(),
            ),
            SizedBox(height: 10),
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
            suggestions: controller.tagsModel,
            helperText: 'Não temos essa ...',
            width: SizeUtils.widthScreen - 60,
            textStyle: TextStyle(fontSize: 16),
            onSubmitted: (string) {
              setState(() {
                tags.add(Item(title: string));
              });
              controller.tagsListParaTagString(tags);
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
              controller.tagsListParaTagString(tags);
              return true;
            }),
          );
        },
      ),
    );
  }

  gravar() async {
    if (await controller.gravar()) {
      Get.back();
      var atendimentoServicoController =
          GetIt.I.get<AtendimentoServicoController>();
      await atendimentoServicoController
          .consultarAtendimentoServicoInfo(controller.atendimentoServicoId);
    }
  }

  _popularVarComDadosDoParametro() {
    // final item = Get.args(context)['item'];
    item = GetIt.I.get<AtendimentoServicoInfoModel>();
    controller.id = item.id;
    controller.atendimentoServicoId = item.atendimentoServicoId;
    controller.descricao = item.descricao;
    controller.tags = item.tags.toString();
    controller.observacao = item.observacao;
    return item;
  }
}
