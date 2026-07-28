import 'package:flutter_test/flutter_test.dart';
import 'package:modulo07_layouts/main.dart';

void main() {
  testWidgets('renderiza la pantalla veterinaria con el titulo principal', (WidgetTester tester) async {
    await tester.pumpWidget(const VeterinariaApp());

    expect(find.text('Clinica Veterinaria PetCare'), findsOneWidget);
    expect(find.text('Tu mascota en buenas manos'), findsOneWidget);
  });
}
