import 'dart:io';

void main() {
  print('Ingrese un numero:');
  int numero = int.parse(stdin.readLineSync()!);
  
  if (numero > 0) {
    print('El numero es positivo');
  } else if (numero < 0) {
    print('El numero es negativo');
  } else {
    print('El numero es cero');
  }
}