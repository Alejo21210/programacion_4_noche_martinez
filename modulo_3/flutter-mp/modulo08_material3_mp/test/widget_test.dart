import 'package:flutter_test/flutter_test.dart';

import 'package:modulo08_material3/main.dart';

void main() {
  testWidgets('App renders without error', (WidgetTester tester) async {
    await tester.pumpWidget(const AppMonitoreo());
    expect(find.text('Clinica Veterinaria Patitas Felices'), findsOneWidget);
  });
}
