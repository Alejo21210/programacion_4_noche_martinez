import 'package:flutter_test/flutter_test.dart';

import 'package:modulo11_gorouter/main.dart';

void main() {
  testWidgets('App renders the veterinary home screen', (WidgetTester tester) async {
    await tester.pumpWidget(const AppMonitoreo(paso: 1));

    expect(find.text('Clínica Veterinaria'), findsOneWidget);
    expect(find.text('Panel de pacientes'), findsOneWidget);
    expect(find.text('Gestiona fichas, consultas y seguimiento clínico'), findsOneWidget);
  });
}
