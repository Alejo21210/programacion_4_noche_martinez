import 'package:flutter_test/flutter_test.dart';
import 'package:modulo06_widgets/main_widgets.dart';

void main() {
  testWidgets('renderiza la pantalla de bienvenida veterinaria', (WidgetTester tester) async {
    await tester.pumpWidget(const VeterinariaApp());

    expect(find.text('Clínica Veterinaria PetCare'), findsOneWidget);
    expect(find.text('Tu mascota en buenas manos'), findsOneWidget);
  });
}
