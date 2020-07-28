import 'package:mobx/mobx.dart';

part 'root_controller.g.dart';

class RootController = _RootBase with _$RootController;

abstract class _RootBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
