import 'package:ocstapi/model/atendimento_servico_item_model.dart';
import 'package:ocstapi/model/atendimento_servico_model.dart';
import 'package:ocstapi/model/atendimento_servico_objeto_model.dart';
import 'package:ocstapi/model/locacao_roupa_item_model.dart';
import 'package:ocstapi/model/locacao_roupa_model.dart';
import 'package:ocstapi/model/produto_item_model.dart';
import 'package:ocstapi/repository/cliente_repository.dart';

import '../ocstapi.dart';

class ChecarAntesDeApagarRepository {
  ChecarAntesDeApagarRepository(this.context)
      : clienteRepository = ClienteRepository(context);
  final ManagedContext context;
  final ClienteRepository clienteRepository;

  Future<String> checarAntesDeApagar(int id, String ref) async {
    const msgIni = 'Não posso apagar.\n';
    try {
      switch (ref) {
        case 'clienteVeiculo':
          final query = Query<AtendimentoServicoObjetoModel>(context)
            ..join(object: (j) => j.clienteVeiculo)
            ..where((w) => w.clienteVeiculo.id).equalTo(id);
          return await query.fetch() != null
              ? '${msgIni}Veículo usado em algum atendimento.'
              : '';
          break;
        case 'clientePet':
          final query = Query<AtendimentoServicoObjetoModel>(context)
            ..join(object: (j) => j.clientePet)
            ..where((w) => w.clientePet.id).equalTo(id);
          return await query.fetch() != null
              ? '${msgIni}Pet usado em algum atendimento.'
              : '';
          break;
        case 'cliente':
          if (await checkClienteAtendimentoServico(id)) {
            return '${msgIni}Cliente consta em algum atendimento.';
          } else if (await checkClienteLocacaoRoupa(id)) {
            return '${msgIni}Cliente consta em alguma locação de roupa.';
          } else {
            return '';
          }
          break;
        case 'produto':
          if (await checkProdutoAtendimentoServico(id)) {
            return '${msgIni}Produto consta em algum atendimento.';
          } else if (await checkProdutoLocacaoRoupa(id)) {
            return '${msgIni}Produto consta em alguma locação de roupa.';
          } else if (await checkProdutoComposicao(id)) {
            return '${msgIni}Produto consta em alguma composição.';
          } else {
            return '';
          }
          break;
        default:
          return '';
      }
    } catch (e) {
      print(e);
      return '';
    }
  }

  Future<bool> checkClienteAtendimentoServico(int id) async {
    final query = Query<AtendimentoServicoModel>(context)
      ..where((w) => w.cliente.id).equalTo(id);
    final r = await query.fetch();
    return r.isNotEmpty;
  }

  Future<bool> checkClienteLocacaoRoupa(int id) async {
    final query = Query<LocacaoRoupaModel>(context)
      ..where((w) => w.cliente.id).equalTo(id);
    final r = await query.fetch();
    return r.isNotEmpty;
  }

  Future<bool> checkProdutoAtendimentoServico(int id) async {
    final query = Query<AtendimentoServicoItemModel>(context)
      ..where((w) => w.produto.id).equalTo(id);
    final r = await query.fetch();
    return r.isNotEmpty;
  }

  Future<bool> checkProdutoLocacaoRoupa(int id) async {
    final query = Query<LocacaoRoupaItemModel>(context)
      ..where((w) => w.produto.id).equalTo(id);
    final r = await query.fetch();
    return r.isNotEmpty;
  }

  Future<bool> checkProdutoComposicao(int id) async {
    final query = Query<ProdutoItemModel>(context)
      ..where((w) => w.produtoItem.id).equalTo(id);
    final r = await query.fetch();
    return r.isNotEmpty;
  }
}
