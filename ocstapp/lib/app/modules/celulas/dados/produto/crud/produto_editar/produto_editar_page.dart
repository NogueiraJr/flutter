import 'package:OCSTApp/app/components/app_button.dart';
import 'package:OCSTApp/app/components/app_flat_button.dart';
import 'package:OCSTApp/app/components/app_text_form_field.dart';
import 'package:OCSTApp/app/core/store_state.dart';
import 'package:OCSTApp/app/mixins/loader_mixin.dart';
import 'package:OCSTApp/app/models/produto_model.dart';
import 'package:OCSTApp/app/modules/celulas/dados/produto/produto_controller.dart';
import 'package:OCSTApp/app/utils/size_utils.dart';
import 'package:OCSTApp/app/utils/snackbar_utils.dart';
import 'package:OCSTApp/app/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'produto_editar_controller.dart';

class ProdutoEditarPage extends StatefulWidget {
  final String title;
  const ProdutoEditarPage({Key key, this.title = "Editar"}) : super(key: key);

  @override
  _ProdutoEditarPageState createState() => _ProdutoEditarPageState();
}

class _ProdutoEditarPageState
    extends ModularState<ProdutoEditarPage, ProdutoEditarController>
    with LoaderMixin {
  //use 'controller' variable to access controller

  GlobalKey<TagsState> globalKeyTag = GlobalKey<TagsState>();
  List tags = new List();
  // List tagsSuggestions = new List();

  List<ReactionDisposer> _disposer;
  AppBar appBar = AppBar(
    elevation: 0,
    title: Text('Editar'),
  );

  ProdutoModel item;
  var produtoController = GetIt.I.get<ProdutoController>();

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
          Get.back();
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
    GetIt.I.unregister<ProdutoModel>();
  }

  @override
  Widget build(BuildContext context) {
    //controller.obterDadosDoColaboradorEditando();
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
            suggestions: produtoController.tagsModel,
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
              // 'assets/images/dds-cliente-editar.png',
              'assets/images/dds-produtos.png',
            ),
          ),
          Positioned(
            bottom: 28,
            child: Text(
              'Altere os dados do Produto',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            bottom: 12,
            child: Text(
              '(simplicidade e objetividade nos dados)',
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
    produtoController.obterTags();
    return Form(
      key: controller.globalKeyAlt,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            AppTextFormField(
              label: 'Código',
              initialValue: item == null ? 'N/C' : item.codigo,
              keyboardType: TextInputType.text,
              icon: Icons.confirmation_number,
              onChanged: (String valor) => controller.changeCodigo(valor),
              validator: (String valor) {
                if (valor.trim().isEmpty ||
                    valor.trim().length != valor.length ||
                    valor.trim().length != valor.replaceAll(' ', '').length) {
                  return 'Obrigatório, sem espaços antes e depois';
                }
                return null;
              },
              apenasCodigos: true,
            ),
            SizedBox(height: 10),
            AppTextFormField(
              label: 'Nome',
              initialValue: item == null ? 'N/C' : item.nome,
              keyboardType: TextInputType.text,
              //controller: controller.controllerMaskCelular,
              icon: Icons.note,
              onChanged: (String valor) => controller.changeNome(valor.trim()),
              validator: (String valor) {
                if (valor.trim().isEmpty ||
                    valor.trim().length != valor.length) {
                  return 'Obrigatório, letras e números sem espaços';
                }
                return null;
              },
              // apenasLetrasNumeros: true,
            ),
            SizedBox(height: 10),
            AppTextFormField(
              label: 'Descrição',
              initialValue: item == null ? 'N/C' : item.descricao,
              keyboardType: TextInputType.text,
              icon: Icons.description,
              onChanged: (String valor) =>
                  controller.changeDescricao(valor.trim()),
              validator: (String valor) {
                if (valor.trim().isEmpty ||
                    valor.trim().length != valor.length) {
                  return 'Obrigatório, letras e números sem espaços';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            AppTextFormField(
              label: 'Custo',
              // initialValue: nF.format(controller.controllerMaskCusto),
              keyboardType: TextInputType.number,
              controller: controller.controllerMaskCusto,
              icon: Icons.attach_money,
              // onChanged: (String valor) => controller.changeCusto(valor),
              // validator: (String valor) {
              //   if (valor.trim().isEmpty ||
              //       valor.trim().length != valor.length) {
              //     return 'Obrigatório, letras e números sem espaços';
              //   }
              //   return null;
              // },
            ),
            SizedBox(height: 10),
            AppTextFormField(
              label: 'Preço',
              //initialValue: item ?? item.preco,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              controller: controller.controllerMaskPreco,
              icon: Icons.attach_money,
              // onChanged: (String valor) => controller.changePreco(valor),
              // validator: (String valor) {
              //   if (valor.trim().isEmpty ||
              //       valor.trim().length != valor.length) {
              //     return 'Obrigatório, letras e números sem espaços';
              //   }
              //   return null;
              // },
            ),
            SizedBox(height: 10),
            Observer(
              builder: (_) {
                switch (produtoController.tagsState) {
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
            SizedBox(height: 15),
            AppFlatButton(
              label: 'Gravar',
              onPressed: () => controller.gravarProduto(),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  _popularVarComDadosDoParametro() {
    final nF = new NumberFormat("#,###,##0.00", "pt_BR");
    item = GetIt.I.get<ProdutoModel>();
    controller.id = item.id;
    controller.usuarioId = item.usuarioId;
    controller.codigo = item.codigo;
    controller.nome = item.nome;
    controller.descricao = item.descricao;
    controller.controllerMaskCusto.text =
        item.custo == null ? '0.00' : nF.format(item.custo);
    controller.controllerMaskPreco.text =
        item.preco == null ? '0.00' : nF.format(item.preco);
    controller.tags = item.tags.toString();

    // var produtoController = GetIt.I.get<ProdutoController>();
    // produtoController.obterTags();
    // produtoController.tags = produtoController.listaTela;
  }
}
