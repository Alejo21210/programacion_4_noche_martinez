import 'package:flutter_test/flutter_test.dart';

import 'package:modulo11_gorouter/main.dart';

void main() {
  testWidgets('App renders PantallaInicio', (WidgetTester tester) async {
    await tester.pumpWidget(const AppMonitoreo(paso: 1));

    expect(find.text('Monitor SSH'), findsOneWidget);
    expect(find.text('Dashboard de Monitoreo'), findsOneWidget);
    expect(find.text('Gestiona tus servidores SSH'), findsOneWidget);
  });
}
