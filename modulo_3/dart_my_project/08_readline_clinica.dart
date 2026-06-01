import 'dart:io';

void main() {
  print('Ingrese el nombre de la mascota:');
  String? nombre = stdin.readLineSync();
  print('Mascota registrada: $nombre');

  print('Ingrese la edad de la mascota:');
  int edad = int.parse(stdin.readLineSync()!);
  print('Edad: $edad años');

  print('Ingrese el peso (kg):');
  double peso = double.parse(stdin.readLineSync()!);
  print('Peso: $peso kg');
}
