import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_life/app/modules/orientacoes/orientacoes_page.dart';

main() {
  testWidgets('OrientacoesPage has title', (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(OrientacoesPage(title: 'Orientações')));
    final titleFinder = find.text('Orientações');
    expect(titleFinder, findsOneWidget);
  });
}
