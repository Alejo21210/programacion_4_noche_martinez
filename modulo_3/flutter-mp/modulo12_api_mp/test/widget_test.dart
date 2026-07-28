import 'package:flutter_test/flutter_test.dart';

import 'package:modulo12_api/main.dart';

void main() {
  testWidgets('App renders menu', (WidgetTester tester) async {
    await tester.pumpWidget(const AppVeterinaria());
    expect(find.text('Modulo 12 - Veterinaria'), findsOneWidget);
  });
}
