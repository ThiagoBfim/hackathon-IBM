import 'package:mobx/mobx.dart';

part 'meus_testes_controller.g.dart';

class MeusTestesController = _MeusTestesBase with _$MeusTestesController;

abstract class _MeusTestesBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
