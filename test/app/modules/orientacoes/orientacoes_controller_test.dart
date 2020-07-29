import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_life/app/app_module.dart';
import 'package:test_life/app/modules/orientacoes/orientacoes_controller.dart';

void main() {
  initModule(AppModule());
  OrientacoesController orientacoes;

  setUp(() {
    orientacoes = AppModule.to.get<OrientacoesController>();
  });

  group('OrientacoesController Test', () {
    test("First Test", () {
      expect(orientacoes, isInstanceOf<OrientacoesController>());
    });

    test("Set Value", () {
      expect(orientacoes.value, equals(0));
      orientacoes.increment();
      expect(orientacoes.value, equals(1));
    });
  });
}
