import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_life/app/app_module.dart';
import 'package:test_life/app/modules/marcar_teste/marcar_teste_controller.dart';

void main() {
  initModule(AppModule());
  MarcarTesteController marcarteste;

  setUp(() {
    marcarteste = AppModule.to.get<MarcarTesteController>();
  });

  group('MarcarTesteController Test', () {
    test("First Test", () {
      expect(marcarteste, isInstanceOf<MarcarTesteController>());
    });

    test("Set Value", () {
      expect(marcarteste.value, equals(0));
      marcarteste.increment();
      expect(marcarteste.value, equals(1));
    });
  });
}
