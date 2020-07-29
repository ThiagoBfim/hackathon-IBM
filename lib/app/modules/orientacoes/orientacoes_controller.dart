import 'package:mobx/mobx.dart';

part 'orientacoes_controller.g.dart';

class OrientacoesController = _OrientacoesBase with _$OrientacoesController;

abstract class _OrientacoesBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
