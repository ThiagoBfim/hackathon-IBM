import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:test_life/app/modules/chat_bot/chat_bot_controller.dart';
import 'package:test_life/app/app_module.dart';

void main() {
  initModule(AppModule());
  ChatBotController chatbot;

  setUp(() {
    chatbot = AppModule.to.get<ChatBotController>();
  });

  group('ChatBotController Test', () {
    test("First Test", () {
      expect(chatbot, isInstanceOf<ChatBotController>());
    });

    test("Set Value", () {
      expect(chatbot.value, equals(0));
      chatbot.increment();
      expect(chatbot.value, equals(1));
    });
  });
}
