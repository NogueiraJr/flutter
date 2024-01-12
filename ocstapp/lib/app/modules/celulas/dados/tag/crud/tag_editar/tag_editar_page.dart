import 'package:OCSTApp/app/components/app_flat_button.dart';
import 'package:OCSTApp/app/components/app_text_form_field.dart';
import 'package:OCSTApp/app/core/store_state.dart';
import 'package:OCSTApp/app/mixins/loader_mixin.dart';
import 'package:OCSTApp/app/models/tag_model.dart';
import 'package:OCSTApp/app/utils/size_utils.dart';
import 'package:OCSTApp/app/utils/snackbar_utils.dart';
import 'package:OCSTApp/app/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'tag_editar_controller.dart';

class TagEditarPage extends StatefulWidget {
  final String title;
  const TagEditarPage({Key key, this.title = "Editar"}) : super(key: key);

  @override
  _TagEditarPageState createState() => _TagEditarPageState();
}

class _TagEditarPageState
    extends ModularState<TagEditarPage, TagEditarController> with LoaderMixin {
  //use 'controller' variable to access controller

  List<ReactionDisposer> _disposer;
  AppBar appBar = AppBar(
    elevation: 0,
    title: Text('Editar'),
  );

  TagModel item;
  String nomeAntigo = '';

  @override
  void initState() {
    super.initState();
    _popularVarComDadosDoParametro();
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
        }
      }),
    ];
  }

  @override
  void dispose() {
    super.dispose();
    _disposer.forEach((d) => d());
    GetIt.I.unregister<TagModel>();
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
              'assets/images/dds-tag.png',
            ),
          ),
          Positioned(
            bottom: 28,
            child: Text(
              'Altere os dados',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            bottom: 12,
            child: Text(
              '(continue focando o contexto)',
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
    return Form(
      key: controller.globalKeyAlt,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            AppTextFormField(
              label: 'Nome',
              initialValue: item == null ? 'N/C' : item.nome,
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
              label: 'Descrição',
              keyboardType: TextInputType.text,
              initialValue: item == null ? 'N/C' : item.descricao,
              icon: Icons.email,
              onChanged: (String valor) =>
                  controller.changeDescricao(valor.trim()),
              validator: (String valor) {
                if (valor.trim().isEmpty ||
                    valor.trim().length != valor.length) {
                  return 'Obrigatório, letras e números';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            AppFlatButton(
              label: 'Gravar',
              onPressed: () => controller.gravarTag(this.nomeAntigo),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  _popularVarComDadosDoParametro() {
    item = GetIt.I.get<TagModel>();
    controller.id = item.id;
    controller.usuarioId = item.usuarioId;
    controller.nome = item.nome;
    this.nomeAntigo = item.nome;
    controller.descricao = item.descricao;
  }
}
