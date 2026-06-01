import 'dart:io';

void main() {
  int sumaTotal = 0;
  int numero = -1;

  print('Consumo del cliente (Ponga 0 para terminar)');

  while (numero != 0) {
    print('Ingrese el precio del plato:');
    numero = int.parse(stdin.readLineSync()!);
    sumaTotal += numero;
  }
  print('La suma total de sus platos son: $sumaTotal');
}