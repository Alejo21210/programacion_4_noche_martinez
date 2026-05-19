import 'dart:io';

void main() {
  print('Ingrese un numero:');
  int numero = int.parse(stdin.readLineSync()!);
  print('Tabla de $numero (hasta el 10)');

  for (int i = 1; i <= 10; i++) (
    print('$numero x $i = ${numero*i}')
  );
  
}