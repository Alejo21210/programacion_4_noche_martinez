import 'dart:io';

void main() {
  print('Ingrese la dosis base (ml) del medicamento:');
  double dosisBase = double.parse(stdin.readLineSync()!);
  print('Tabla de dosis para cada kg de peso:');

  for (int i = 1; i <= 10; i++) {
    print('$i kg -> ${dosisBase * i} ml');
  }
}
