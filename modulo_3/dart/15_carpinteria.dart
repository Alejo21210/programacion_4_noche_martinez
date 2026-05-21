import 'dart:io';

void main() {
  int totalMuebles = 0;
  int cantidadTrabajadores = 0;
  int muebles = -1;

  while (muebles != 0) {
    print('Ingrese la cantidad de muebles elaborados por empleado:');
    muebles = int.parse(stdin.readLineSync()!);

    if (muebles <= 0) {
      break;
    }

    if (muebles < 3) {
      print('Producción baja');
    } else if (muebles >= 3 && muebles <= 7) {
      print('Producción normal');
    } else {
      print('Producción alta');
    }

    totalMuebles += muebles;
    cantidadTrabajadores++;
  }

  print('Total de muebles fabricados: $totalMuebles');
  print('Cantidad de trabajadores registrados: $cantidadTrabajadores');

  if (cantidadTrabajadores > 0) {
    double promedio = totalMuebles / cantidadTrabajadores;
    print('Promedio de muebles por trabajador: $promedio');
  } else {
    print('Promedio de muebles por trabajador: 0');
  }
}