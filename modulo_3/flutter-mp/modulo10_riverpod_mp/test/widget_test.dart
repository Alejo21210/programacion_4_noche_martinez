import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:modulo10_riverpod/main.dart';

void main() {
  testWidgets('App shows the veterinary patient list', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: AppVeterinaria()));

    expect(find.text('Pacientes (4)'), findsOneWidget);
  });
}
