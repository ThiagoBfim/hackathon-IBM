import 'package:mobx/mobx.dart';

part 'marcar_teste_controller.g.dart';

class MarcarTesteController = _MarcarTesteBase with _$MarcarTesteController;

abstract class _MarcarTesteBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
