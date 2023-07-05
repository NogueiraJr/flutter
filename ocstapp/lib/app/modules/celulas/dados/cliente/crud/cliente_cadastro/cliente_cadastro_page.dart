import 'package:OCSTApp/app/components/app_button.dart';
import 'package:OCSTApp/app/components/app_flat_button.dart';
import 'package:OCSTApp/app/components/app_text_form_field.dart';
import 'package:OCSTApp/app/core/store_state.dart';
import 'package:OCSTApp/app/mixins/loader_mixin.dart';
import 'package:OCSTApp/app/modules/celulas/dados/cliente/cliente_controller.dart';
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
import 'cliente_cadastro_controller.dart';

class ClienteCadastroPage extends StatefulWidget {
  final String title;
  const ClienteCadastroPage({Key key, this.title = "Cadastro"})
      : super(key: key);

  @override
  _ClienteCadastroPageState createState() => _ClienteCadastroPageState();
}

class _ClienteCadastroPageState
    extends ModularState<ClienteCadastroPage, ClienteCadastroController>
    with LoaderMixin {
  GlobalKey<TagsState> globalKeyTag = GlobalKey<TagsState>();
  List tags = new List();
  //use 'controller' variable to access controller

  List<ReactionDisposer> _disposer;
  AppBar appBar = AppBar(
    elevation: 0,
    title: Text('Cadastro'),
  );

  final clienteController = ClienteController();

  @override
  void initState() {
    super.initState();
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
            suggestions: clienteController.tagsModel,
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
              'assets/images/dds-cliente-cadastrar.png',
            ),
          ),
          Positioned(
            bottom: 28,
            child: Text(
              'Cadastre seu Cliente',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            bottom: 12,
            child: Text(
              '(primeiro os dados essenciais)',
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
    clienteController.obterTags();
    return Form(
      key: controller.globalKeyCad,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            AppTextFormField(
              label: 'Nome',
              icon: Icons.face,
              onChanged: (String valor) => controller.changeNome(valor),
              validator: (String valor) {
                if (valor.trim().isEmpty ||
                    valor.trim().length != valor.length) {
                  return 'Obrigatório, sem espaços antes e depois';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            AppTextFormField(
              label: 'Celular',
              keyboardType: TextInputType.phone,
              controller: controller.controllerMaskCelular,
              icon: Icons.account_circle,
              onChanged: (String valor) =>
                  controller.changeCelular(valor.trim()),
              validator: (String valor) {
                if (valor.trim().isEmpty ||
                    valor.trim().length != valor.length) {
                  return 'Obrigatório, formato número de celular';
                }
                return null;
              },
              apenasLetrasNumeros: true,
            ),
            SizedBox(height: 10),
            AppTextFormField(
              label: 'Email',
              keyboardType: TextInputType.emailAddress,
              icon: Icons.email,
              onChanged: (String valor) => controller.changeEmail(valor.trim()),
              validator: (String valor) {
                if (valor.trim().isEmpty ||
                    valor.trim().length != valor.length ||
                    valor.trim().length != valor.replaceAll(' ', '').length) {
                  return 'Obrigatório, letras e números sem espaços';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            Observer(
              builder: (_) {
                switch (clienteController.tagsState) {
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
              onPressed: () => controller.gravarCliente(),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
