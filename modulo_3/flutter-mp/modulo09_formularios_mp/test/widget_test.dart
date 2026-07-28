import 'package:flutter_test/flutter_test.dart';
import 'package:modulo09_formularios/main.dart';

void main() {
  testWidgets('App renders without error', (WidgetTester tester) async {
    await tester.pumpWidget(const AppVeterinaria());
    expect(find.text('Pacientes (4)'), findsOneWidget);
  });
}
