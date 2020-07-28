import 'package:mobx/mobx.dart';

part 'find_test_controller.g.dart';

class FindTestController = _FindTestBase with _$FindTestController;

abstract class _FindTestBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
