import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_life/app/app_module.dart';
import 'package:test_life/app/modules/perfil/perfil_controller.dart';

void main() {
  initModule(AppModule());
  PerfilController perfil;

  setUp(() {
    perfil = AppModule.to.get<PerfilController>();
  });

  group('PerfilController Test', () {
    test("First Test", () {
      expect(perfil, isInstanceOf<PerfilController>());
    });

    test("Set Value", () {
      expect(perfil.value, equals(0));
      perfil.increment();
      expect(perfil.value, equals(1));
    });
  });
}
