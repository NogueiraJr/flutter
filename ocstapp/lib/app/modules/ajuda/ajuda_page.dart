import 'package:OCSTApp/app/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:intro_slider/slide_object.dart';
import 'ajuda_controller.dart';

import 'package:intro_slider/intro_slider.dart';

class AjudaPage extends StatefulWidget {
  final String title;
  const AjudaPage({Key key, this.title = "Ajuda"}) : super(key: key);

  @override
  _AjudaPageState createState() => _AjudaPageState();
}

class _AjudaPageState extends ModularState<AjudaPage, AjudaController> {
  //use 'controller' variable to access controller
  List<Slide> slides = new List();

  Function goToTab;

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "Oi",
        styleTitle: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description: "Que bom que você está aqui!\n"
            "Vou te ajudar a controlar\n o seu Negócio!\n"
            "\n"
            "Vamos juntos?",
        styleDescription: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontStyle: FontStyle.normal,
            fontFamily: 'Raleway'),
        pathImage: "assets/images/ini-interacao.png",
      ),
    );
    slides.add(
      new Slide(
        title: "Sou fácil de usar!",
        styleTitle: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description: "Tenho só o que você precisa,\nsem complicar as coisas!\n"
            "\nAcredite, sou simples mesmo!",
        styleDescription: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontStyle: FontStyle.normal,
            fontFamily: 'Raleway'),
        pathImage: "assets/images/ini-expressao.png",
      ),
    );
    slides.add(
      new Slide(
        title: "Sou multi-usuário!",
        styleTitle: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description: "Você é quem manda!\n"
            "Me diga 'quem' faz 'o que'\nque eu cuido do resto!"
            "\n"
            "Tenho vários níveis de acesso\ne segurança para cada usuário!"
            "\n"
            "Ah! Sou multi-empresa também!",
        styleDescription: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontStyle: FontStyle.normal,
            fontFamily: 'Raleway'),
        pathImage: "assets/images/ini-discurso.png",
      ),
    );
    slides.add(
      new Slide(
        title: "Falei em segurança?",
        styleTitle: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description: "Claro que sou seguro!\n"
            "Todos os dados ficam na nuvem\nbem guardados e protegidos!"
            "\n"
            "Senha de acesso, rastreabilidade\ne bloqueios rápidos!",
        styleDescription: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontStyle: FontStyle.normal,
            fontFamily: 'Raleway'),
        pathImage: "assets/images/ini-impressao-digital.png",
      ),
    );
    slides.add(
      new Slide(
        title: "Custo-benefício inteligente!",
        styleTitle: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description: "Comece pequeno!\n\n"
            "Sou igual a blocos de montar, sabe?"
            "\n"
            "Você paga apenas o que\nrealmente vai usar!",
        styleDescription: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontStyle: FontStyle.normal,
            fontFamily: 'Raleway'),
        pathImage: "assets/images/ini-construcao.png",
      ),
    );
    slides.add(
      new Slide(
        title: "Vamos começar?",
        styleTitle: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description: "Primeiro preciso conhecer você!\n"
            "Faremos um cadastro rápido agora!\nAcredite, é rápido mesmo!\n"
            "\nEstá comigo? Ótimo!",
        styleDescription: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontStyle: FontStyle.normal,
            fontFamily: 'Raleway'),
        pathImage: "assets/images/ini-empregado.png",
      ),
    );
  }

  void onDonePress() {
    controller.vaiParaLogin();
    Get.toNamed('/login/cadastro_usuario');
  }

  void onTabChangeCompleted(index) {
    // Index of current tab is focused
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Colors.white,
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Colors.white,
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: Colors.white,
    );
  }

  List<Widget> renderListCustomTabs() {
    List<Widget> tabs = new List();
    for (int i = 0; i < slides.length; i++) {
      Slide currentSlide = slides[i];
      tabs.add(Container(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          margin: EdgeInsets.only(bottom: 60.0, top: 60.0),
          child: ListView(
            children: <Widget>[
              GestureDetector(
                  child: Image.asset(
                currentSlide.pathImage,
                width: 200.0,
                height: 200.0,
                fit: BoxFit.contain,
              )),
              Container(
                child: Text(
                  currentSlide.title,
                  style: currentSlide.styleTitle,
                  textAlign: TextAlign.center,
                ),
                margin: EdgeInsets.only(top: 20.0),
              ),
              Container(
                child: Text(
                  currentSlide.description,
                  style: currentSlide.styleDescription,
                  textAlign: TextAlign.center,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
                margin: EdgeInsets.only(top: 20.0),
              ),
            ],
          ),
        ),
      ));
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      // List slides
      slides: this.slides,

      // Skip button
      renderSkipBtn: this.renderSkipBtn(),
      colorSkipBtn: Colors.black,
      // colorSkipBtn: Color(0x33ffcc5c),
      highlightColorSkipBtn: Color(0xffffcc5c),

      // Next button
      renderNextBtn: this.renderNextBtn(),

      // Done button
      renderDoneBtn: this.renderDoneBtn(),
      onDonePress: this.onDonePress,
      colorDoneBtn: Colors.black,
      // colorDoneBtn: Color(0x33ffcc5c),
      highlightColorDoneBtn: Color(0xffffcc5c),

      // Dot indicator
      colorDot: Colors.black,
      sizeDot: 13.0,
      //typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,

      // Tabs
      listCustomTabs: this.renderListCustomTabs(),
      backgroundColorAllSlides: ThemeUtils.primaryColor, // Colors.blue[200],
      refFuncGoToTab: (refFunc) {
        this.goToTab = refFunc;
      },

      // Show or hide status bar
      shouldHideStatusBar: false,

      // On tab change completed
      onTabChangeCompleted: this.onTabChangeCompleted,
    );
  }
}
