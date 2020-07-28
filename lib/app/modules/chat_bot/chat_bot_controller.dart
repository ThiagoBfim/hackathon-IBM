import 'package:mobx/mobx.dart';

part 'chat_bot_controller.g.dart';

class ChatBotController = _ChatBotBase with _$ChatBotController;

abstract class _ChatBotBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
