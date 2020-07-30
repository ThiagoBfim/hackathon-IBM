import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_life/app/app_module.dart';
import 'package:test_life/app/modules/meus_testes/meus_testes_controller.dart';

void main() {
  initModule(AppModule());
  MeusTestesController meustestes;

  setUp(() {
    meustestes = AppModule.to.get<MeusTestesController>();
  });

  group('MeusTestesController Test', () {
    test("First Test", () {
      expect(meustestes, isInstanceOf<MeusTestesController>());
    });

    test("Set Value", () {
      expect(meustestes.value, equals(0));
      meustestes.increment();
      expect(meustestes.value, equals(1));
    });
  });
}
