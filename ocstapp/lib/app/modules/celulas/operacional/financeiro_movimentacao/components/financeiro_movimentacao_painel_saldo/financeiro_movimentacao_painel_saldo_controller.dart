import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:OCSTApp/app/core/store_state.dart';
import 'package:OCSTApp/app/models/movimentacao_total_model.dart';
import 'package:OCSTApp/app/repositories/movimentacoes_repository.dart';
import 'package:OCSTApp/app/utils/store_utils.dart';

part 'financeiro_movimentacao_painel_saldo_controller.g.dart';

class FinanceiroMovimentacaoPainelSaldoController = _FinanceiroMovimentacaoPainelSaldoControllerBase
    with _$FinanceiroMovimentacaoPainelSaldoController;

abstract class _FinanceiroMovimentacaoPainelSaldoControllerBase with Store {
  final MovimentacoesRepository movimentacoesRepository;
  _FinanceiroMovimentacaoPainelSaldoControllerBase(
      this.movimentacoesRepository);

  @observable
  DateTime data = DateTime.now();

  @action
  nextMonth() {
    print('nextMonth');
    data = DateTime(data.year, data.month + 1, 1);
  }

  @action
  previousMonth() {
    data = DateTime(data.year, data.month - 1, 1);
  }

  @computed
  String get anoMes => DateFormat('yyyyMM').format(data);

  @observable
  String errorMessage;

  @observable
  ObservableFuture<MovimentacaoTotalModel> _totalMovimentacao;

  @computed
  StoreState get totalsTate => StoreUtils.statusCheck(_totalMovimentacao);

  @observable
  MovimentacaoTotalModel movimentacaoTotalModel;

  @action
  buscarTotalDoMes() async {
    try {
      errorMessage = '';
      _totalMovimentacao =
          ObservableFuture(movimentacoesRepository.getTotalMes(anoMes));
      movimentacaoTotalModel = await _totalMovimentacao;
    } catch (e) {
      errorMessage = 'Erro ao buscar total de movimentacoes';
      print(e);
    }
  }
}
