import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:test_life/app/shared/web_view/web_view_widget.dart';

main() {
  testWidgets('WebViewWidget has message', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(WebViewWidget(title: "TESTE",url: "www.teste.com.br",)));
    final textFinder = find.text('TESTE');
    expect(textFinder, findsOneWidget);
  });
}
