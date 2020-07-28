import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_life/app/app_module.dart';
import 'package:test_life/app/modules/root/root_controller.dart';

void main() {
  initModule(AppModule());
  RootController root;

  setUp(() {
    root = AppModule.to.get<RootController>();
  });

  group('RootController Test', () {
    test("First Test", () {
      expect(root, isInstanceOf<RootController>());
    });

    test("Set Value", () {
      expect(root.value, equals(0));
      root.increment();
      expect(root.value, equals(1));
    });
  });
}
