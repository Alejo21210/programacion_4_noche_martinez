import 'dart:io';

void main() {
  print('Ingrese la temperatura de la mascota:');
  double temperatura = double.parse(stdin.readLineSync()!);

  if (temperatura > 39.0) {
    print('La mascota tiene fiebre alta');
  } else if (temperatura < 37.5) {
    print('La mascota tiene hipotermia');
  } else {
    print('La temperatura es normal');
  }
}
