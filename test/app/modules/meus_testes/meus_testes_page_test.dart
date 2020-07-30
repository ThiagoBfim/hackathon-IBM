import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_life/app/modules/meus_testes/meus_testes_page.dart';

main() {
  testWidgets('MeusTestesPage has title', (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(MeusTestesPage(title: 'Meus Testes')));
    final titleFinder = find.text('Meus Testes');
    expect(titleFinder, findsOneWidget);
  });
}
