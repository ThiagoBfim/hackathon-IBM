import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:test_life/app/modules/home/home_page.dart';

main() {
  testWidgets('HomePage is Scaffold', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(HomePage()));
    final titleFinder = find.byType(Scaffold);
    expect(titleFinder, findsOneWidget);
  });
}
