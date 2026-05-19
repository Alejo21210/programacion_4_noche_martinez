import 'dart:io';

void main() {
  int sumaTotal = 0;
  int numero = -1;

  print('Suma de numeros (Ponga 0 para terminar)');

  while (numero != 0) {
    print('Ingrese el numero:');
    numero = int.parse(stdin.readLineSync()!);
    sumaTotal += numero;
  }
  print('La suma total de los numeros es: $sumaTotal');
}