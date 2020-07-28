import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:test_life/app/modules/find_test/find_test_controller.dart';
import 'package:test_life/app/app_module.dart';

void main() {
  initModule(AppModule());
  FindTestController findtest;

  setUp(() {
    findtest = AppModule.to.get<FindTestController>();
  });

  group('FindTestController Test', () {
    test("First Test", () {
      expect(findtest, isInstanceOf<FindTestController>());
    });

    test("Set Value", () {
      expect(findtest.value, equals(0));
      findtest.increment();
      expect(findtest.value, equals(1));
    });
  });
}
