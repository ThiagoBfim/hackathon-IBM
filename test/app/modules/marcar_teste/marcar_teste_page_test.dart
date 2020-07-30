import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_life/app/modules/find_test/model/teste_covid.dart';
import 'package:test_life/app/modules/marcar_teste/marcar_teste_page.dart';

main() {
  testWidgets('MarcarTestePage has title', (WidgetTester tester) async {
    var testCovid = new TestCovid(title: "teste");
    await tester
        .pumpWidget(buildTestableWidget(MarcarTestePage(testCovid: testCovid,)));
    final titleFinder = find.text('teste');
    expect(titleFinder, findsOneWidget);
  });
}
