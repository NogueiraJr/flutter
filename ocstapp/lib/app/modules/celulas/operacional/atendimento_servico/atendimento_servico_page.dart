import 'package:OCSTApp/app/core/store_state.dart';
import 'package:OCSTApp/app/models/atendimento_servico_model.dart';
import 'package:OCSTApp/app/models/produto_model.dart';
import 'package:OCSTApp/app/modules/celulas/operacional/atendimento_servico/components/atendimento_servico_calendario_item.dart';
import 'package:OCSTApp/app/modules/celulas/operacional/atendimento_servico/components/blocos_operacional_atendimento_servico/blocos_operacional_atendimento_servico_widget.dart';
import 'package:OCSTApp/app/modules/celulas/operacional/atendimento_servico/components/atendimento_servico_item.dart';
import 'package:OCSTApp/app/modules/principal/principal_controller.dart';
import 'package:OCSTApp/app/utils/size_utils.dart';
import 'package:OCSTApp/app/utils/snackbar_utils.dart';
import 'package:OCSTApp/app/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:table_calendar/table_calendar.dart';
import 'atendimento_servico_controller.dart';

class AtendimentoServicoPage extends StatefulWidget {
  final String title;
  const AtendimentoServicoPage({Key key, this.title = "Atendimento"})
      : super(key: key);

  @override
  _AtendimentoServicoPageState createState() => _AtendimentoServicoPageState();
}

class _AtendimentoServicoPageState
    extends ModularState<AtendimentoServicoPage, AtendimentoServicoController> {
  List<ReactionDisposer> _disposer;
  AtendimentoServicoController controller =
      Modular.get<AtendimentoServicoController>();
  final controllerPrincipal = GetIt.I.get<PrincipalController>();

  // Map<DateTime, List> _events;
  // Map<DateTime, List> _holidays;
  CalendarController _calendarController;
  // AnimationController _animationController;
  CalendarFormat calendarFormat = CalendarFormat.week;

  @override
  void initState() {
    super.initState();
    controller.obterUltimosServicosDaEmpresaParaTela();

    _calendarController = CalendarController();
    // final _selectedDay = DateTime.now();

    // _events = {};
    // for (var item in controller.atendimentosServico) {
    //   print('${item.iniciar} ${item.descricao}');
    //   // var quando = DateFormat('dd/MM/yyyy HH:mm').parse(item.iniciado);
    //   // if (item.descricao != null) {
    //   //   _events[quando].add(item.descricao);
    //   //   _events.
    //   // }
    // }

    // controller.atendimentosServico.forEach((f) => {
    //   // var _data = DateFormat('dd/MM/yyyy HH:mm').parse(item.iniciar);
    //   var x = DateFormat('dd/MM/yyyy HH:mm').parse(f.iniciado);
    //   // _events.addEntries(,  );
    // });

    _disposer ??= [];
    if (GetIt.I.isRegistered<AtendimentoServicoController>()) {
      GetIt.I.unregister<AtendimentoServicoController>();
    }
    GetIt.I.registerSingleton<AtendimentoServicoController>(controller);
    if (controller.produtosEscolhidos == null) {
      controller.produtosEscolhidos = new List<ProdutoModel>();
    }
    //controller.obterSistemaUsuarioLogado();
  }

  @override
  void dispose() {
    super.dispose();
    _calendarController.dispose();
    _disposer.forEach((d) => d());
  }

  @override
  Widget build(BuildContext context) {
    // controller.obterUltimosServicosDaEmpresaParaTela();
    controller.selectedDay = DateTime.now();
    return new Scaffold(
      body: buildNestedScrollView(),
      floatingActionButton: buildFloatingActionButton(),
    );
  }

  NestedScrollView buildNestedScrollView() {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: 260,
            floating: false,
            pinned: true,
            // forceElevated: true,
            // floating: false,
            // pinned: true,
            // forceElevated: false,
            // leading: Text('data'),
            // snap: false,
            // stretch: true,
            // primary: true,
            titleSpacing: 120,
            actions: _buildActions(),
            flexibleSpace: Container(
                decoration: BoxDecoration(
                  color: ThemeUtils.primaryColor,
                  border: Border(
                      bottom: BorderSide(width: 1, color: Colors.black12)),
                ),
                child: buildFlexibleSpaceBar()),
          ),
        ];
      },
      body: buildNestedScrollViewBody(),
    );
  }

  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        Get.toNamed('/atendimento_servico_cadastro');
      },
      child: Icon(
        Icons.add,
        color: Colors.black,
      ),
      backgroundColor: ThemeUtils.primaryColor,
    );
  }

  List<Widget> _buildActions() {
    return <Widget>[
      // IconButton(
      //   icon: Icon(Icons.date_range),
      //   onPressed: () {
      //     Get.toNamed('/atendimento_servico_calendario');
      //   },
      // ),
      IconButton(
        icon: Icon(Icons.update),
        tooltip: 'Atualizar',
        onPressed: () async {
          await controller.obterUltimosServicosDaEmpresaParaTela();
          await controller.montaDadosParaAgenda();
          await controller.obterServicos('tudo', 'date',
              DateFormat('yyyy-MM-dd').format(controller.selectedDay));
        },
      ),
      // IconButton(
      //   icon: Icon(Icons.find_in_page),
      //   onPressed: () {
      //     //Get.offAllNamed('/<pagina/tela>');
      //   },
      // ),
      PopupMenuButton<String>(
        icon: Icon(Icons.more_vert),
        onSelected: (opcaoMenu) {
          switch (opcaoMenu) {
            case 'agenda':
              Get.toNamed('/atendimento_servico_calendario');

              break;
            default:
          }
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
            //   value: 'agenda',
            //   child: Text(
            //     'Agenda',
            //     style: TextStyle(
            //       fontSize: 14,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            // PopupMenuItem<String>(
            //   value: '',
            //   child: Text(
            //     'Opção 1 Cliente',
            //     style: TextStyle(fontSize: 14),
            //   ),
            // ),
            // PopupMenuItem<String>(
            //   value: '',
            //   child: Text(
            //     'Opção 2 Cliente DEF XXX',
            //     style: TextStyle(fontSize: 14),
            //   ),
            // ),
            // PopupMenuItem<String>(
            //   value: '',
            //   child: Text(
            //     'Opção 2 Cliente GHI',
            //     style: TextStyle(fontSize: 14),
            //   ),
            // ),
            // PopupMenuItem<String>(
            //   value: '',
            //   child: Text(
            //     'Opção 5 Cliente JLM 12345',
            //     style: TextStyle(fontSize: 14),
            //   ),
            // ),
          ];
        },
      ),
    ];
  }

  FlexibleSpaceBar buildFlexibleSpaceBar() {
    return FlexibleSpaceBar(
      background: Observer(
        builder: (_) {
          switch (controller.servicoState) {
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
              return _makeHeader();
            case StoreState.error:
              SnackBarUtils.showSnackBar('Atenção', controller.errorMessage);
              return Container();
          }
          return Container();
        },
      ),
      centerTitle: true,
      title: Text(
        'Atendimentos',
        style: TextStyle(
          color: Colors.black,
          fontSize: 14.0,
        ),
      ),
    );
  }

  Container buildNestedScrollViewBody() {
    return Container(
        // padding: EdgeInsets.only(top: 30),
        // height: SizeUtils.heightScreen,
        child: _makeContent());
  }

  Widget _makeHeader() {
    final figura = Get.args(context)['figura'];
    // controller.obterSistemaUsuarioLogado(); // Provoca Loop
    return Stack(
      children: <Widget>[
        Positioned(
          bottom: 140,
          left: 10,
          child: Row(
            children: <Widget>[
              Container(
                width: 70,
                height: 70,
                child: Image(
                  image: AssetImage(figura ?? ''),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      controller.atendimentosServico.length > 1
                          ? '${controller.atendimentosServico?.length ?? 0} Atendimentos'
                          : '${controller.atendimentosServico?.length ?? 0} Atendimento',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
                    ),
                    // Text(
                    //   controller.clientesEspeciais > 1
                    //       ? '${controller.clientesEspeciais} Especiais'
                    //       : '${controller.clientesEspeciais} Especial',
                    //   style: TextStyle(
                    //     color: Colors.black,
                    //     fontSize: 13,
                    //   ),
                    // ),
                    // Text(
                    //   controller.clientesComDesvio > 1
                    //       ? '${controller.clientesComDesvio} com Desvios'
                    //       : '${controller.clientesComDesvio} com Desvio',
                    //   style: TextStyle(
                    //     color: Colors.black,
                    //     fontSize: 13,
                    //   ),
                    // ),
                  ],
                ),
              )
            ],
          ),
        ),
        Visibility(
            visible: controllerPrincipal.sistemaRef == 'refOficinaCarros' ||
                controllerPrincipal.sistemaRef == 'refPetShop' ||
                controllerPrincipal.sistemaRef == 'refClinicaVeterinaria' ||
                controllerPrincipal.sistemaRef == 'refDentista' ||
                controllerPrincipal.sistemaRef == 'refClinicaEstetica' ||
                controllerPrincipal.sistemaRef == 'refCabeleireiro' ||
                controllerPrincipal.sistemaRef == 'refEstudioFotografico',
            child: BlocosOperacionalAtendimentoServicosWidget(
                left: 10, right: 10, top: 152, bottom: 50)),
        // Visibility(
        //     visible: controller.sistemaRef == 'refLanchonete',
        //     child: BlocosDadosClienteLanchoneteWidget(
        //         left: 10, right: 10, top: 152, bottom: 50)),
      ],
    );
  }

  Widget _makeContent() {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 15, right: 80),
          color: Colors.white,
          child: TextFormField(
            onChanged: controller.setFilter,
            initialValue: controller.filter,
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
        Container(
          child: Expanded(
            child: _makeTabs(context),
          ),
        ),
      ],
    );
  }

  Widget _makeTabs(BuildContext context) {
    final dataSelecionada =
        _calendarController.selectedDay ?? controller.selectedDay;
    controller.obterServicos(
        'tudo', 'date', DateFormat('yyyy-MM-dd').format(dataSelecionada));

    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: TabBar(
          indicatorWeight: 1,
          indicatorColor: Colors.black,
          // isScrollable: true,
          tabs: <Widget>[
            Tab(
              text: 'Lista',
              icon: Icon(
                Icons.list,
                size: 21,
              ),
            ),
            Tab(
              text: 'Agenda',
              icon: Icon(
                Icons.date_range,
                size: 21,
              ),
            ),
          ],
        ),
        // ),
        body: TabBarView(
          children: <Widget>[
            Observer(
              builder: (_) {
                switch (controller.servicoState) {
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
                    return _makeListView();
                  case StoreState.error:
                    SnackBarUtils.showSnackBar(
                        'Atenção', controller.errorMessage);
                    return Container();
                }
                return Container();
              },
            ),
            _makeCalendarioAndList(context),
          ],
        ),
      ),
    );
  }

  Widget _makeCalendarioAndList(BuildContext context) {
    return Wrap(
      children: <Widget>[
        Observer(
          builder: (_) {
            switch (controller.servicoState) {
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
                return _makeTableCalendar();
              case StoreState.error:
                SnackBarUtils.showSnackBar('Atenção', controller.errorMessage);
                return Container();
            }
            return Container();
          },
        ),
        Container(
          padding: EdgeInsets.only(top: 10),
          constraints: BoxConstraints(
              minHeight: 50, minWidth: double.infinity, maxHeight: 430),
          child: Observer(
            builder: (_) {
              switch (controller.servicoCalendarState) {
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
                  return _makeListViewCalendar();
                case StoreState.error:
                  SnackBarUtils.showSnackBar(
                      'Atenção', controller.errorMessage);
                  return Container();
              }
              return Container();
            },
          ),
        ),
      ],
    );
  }

  TableCalendar _makeTableCalendar() {
    controller.montaDadosParaAgenda();
    // controller.obterServicos(
    //     'tudo', 'date', DateFormat('yyyy-MM-dd').format(controller.selectedDay));
    return TableCalendar(
      // availableCalendarFormats: {
      //   CalendarFormat.month: 'mensal',
      //   CalendarFormat.week: 'semanal',
      //   CalendarFormat.twoWeeks: 'duplo',
      // },
      locale: 'pt_BR',
      daysOfWeekStyle: DaysOfWeekStyle(
        weekendStyle: TextStyle().copyWith(
            fontWeight: FontWeight.bold, color: Colors.deepOrange[600]),
      ),
      formatAnimation: FormatAnimation.slide,
      availableGestures: AvailableGestures.all,
      startingDayOfWeek: StartingDayOfWeek.sunday,
      calendarStyle: CalendarStyle(
        selectedColor: Colors.deepOrange[400],
        todayColor: Colors.deepOrange[200],
        markersColor: Colors.brown[700],
        outsideDaysVisible: false,
        // canEventMarkersOverflow: false,
        // contentPadding: EdgeInsets.only(bottom: 100),
      ),
      builders: CalendarBuilders(
        markersBuilder: (context, date, events, holidays) {
          final children = <Widget>[];

          if (holidays.isNotEmpty) {
            children.add(
              Positioned(
                right: 5.5,
                bottom: 0,
                child: _buildHolidaysMarker(date, holidays),
              ),
            );
          }

          if (events.isNotEmpty) {
            children.add(
              Positioned(
                right: 24.5,
                top: 31,
                child: _buildEventsMarker(date, events),
              ),
            );
          }

          return children;
        },
      ),
      headerStyle: HeaderStyle(
        // titleTextBuilder: (date, locale) => DateFormat.yM(locale).format(date),
        // leftChevronIcon: Icon(Icons.date_range),
        formatButtonVisible: false,
        centerHeaderTitle: true,
        formatButtonTextStyle:
            TextStyle().copyWith(color: Colors.white, fontSize: 15),
        formatButtonDecoration: BoxDecoration(
          color: Colors.deepOrange[400],
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      calendarController: _calendarController,
      events: controller.events,
      holidays: controller.holidays,
      onDaySelected: (date, events) {
        _onDaySelected(date, events);
      },
      // onVisibleDaysChanged: _onVisibleDaysChanged,
      onCalendarCreated: _onCalendarCreated,
      onVisibleDaysChanged: _onVisibleDaysChanged,
    );
  }

  void _onDaySelected(DateTime day, List events) {
    controller.selectedDay = day;
    controller.obterServicos('tudo', 'date',
        DateFormat('yyyy-MM-dd').format(controller.selectedDay));
  }

  void _onCalendarCreated(
      DateTime first, DateTime last, CalendarFormat format) {
    _calendarController.setCalendarFormat(calendarFormat);
    _calendarController.setSelectedDay(controller.selectedDay);
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    calendarFormat = format;
  }

  Widget _buildEventsMarker(DateTime date, List events) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _calendarController.isSelected(date)
            ? Colors.blue[700]
            : _calendarController.isToday(date)
                ? Colors.blue[300]
                : Colors.blue,
      ),
      width: 18.0,
      height: 18.0,
      child: Center(
        child: Text(
          '${events[0]}',
          style: TextStyle().copyWith(
            color: Colors.white,
            fontSize: 10.0,
          ),
        ),
      ),
    );
  }

  // Widget _buildHolidaysMarker() {
  //   return Icon(
  //     Icons.add_box,
  //     size: 20.0,
  //     color: Colors.blueGrey[800],
  //   );
  // }

  Widget _buildHolidaysMarker(DateTime date, List holidays) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _calendarController.isSelected(date)
            ? Colors.green[700]
            : _calendarController.isToday(date)
                ? Colors.green[300]
                : Colors.green,
      ),
      width: 18.0,
      height: 18.0,
      child: Center(
        child: Text(
          '${holidays[0]}',
          style: TextStyle().copyWith(
            color: Colors.white,
            fontSize: 10.0,
          ),
        ),
      ),
    );
  }

  ListView _makeListView() {
    return ListView.separated(
      padding: const EdgeInsets.only(bottom: 80),
      itemBuilder: (_, index) => AtendimentoServicoItem(
        item: controller.filter.length == 0
            ? controller.atendimentosServico[index]
            : controller.listFiltered[index],
        controller: controller,
      ),
      separatorBuilder: (_, index) => Divider(color: Colors.black),
      itemCount: controller.filter.length == 0
          ? controller.atendimentosServico.length
          : controller.listFiltered?.length ?? 0,
    );
  }

  // Container _makeListViewCalendar() {
  //   return Container(
  //     height: 400,
  //     width: 400,
  //     child: ExpansionPanelList(
  //       expansionCallback: (int index, bool isExpanded) {
  //         setState(() {
  //           controller.atendimentosServicoCalendar[index].isExpanded =
  //               !isExpanded;
  //         });
  //       },
  //       children: controller.atendimentosServicoCalendar
  //           .map<ExpansionPanel>((AtendimentoServicoModel item) {
  //         return ExpansionPanel(
  //           headerBuilder: (BuildContext context, bool isExpanded) {
  //             return ListTile(
  //               title: Text(item.clienteNome),
  //             );
  //           },
  //           body: ListTile(
  //               title: Text(item.descricao),
  //               subtitle:
  //                   const Text('To delete this panel, tap the trash can icon'),
  //               trailing: const Icon(Icons.delete),
  //               onTap: () {
  //                 // setState(() {
  //                 //   _data.removeWhere((Item currentItem) => item == currentItem);
  //                 // });
  //               }),
  //           isExpanded: item.isExpanded,
  //         );
  //       }).toList(),
  //     ),
  //   );
  // }

  ListView _makeListViewCalendar() {
    return ListView.separated(
      padding: const EdgeInsets.only(bottom: 80),
      itemBuilder: (_, index) => AtendimentoServicoCalendarioItem(
        item: controller.atendimentosServicoCalendar[index],
        controller: controller,
      ),
      separatorBuilder: (_, index) => Divider(color: Colors.black26),
      itemCount: controller.atendimentosServicoCalendar.length,
    );
  }
}
