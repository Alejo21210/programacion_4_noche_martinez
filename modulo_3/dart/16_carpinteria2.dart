import 'dart:io';

void main() {
  int totalTablas = 0;
  int cantidadOperarios = 0;
  int tablas = -1;

  while (tablas != 0) {
    print('Ingrese la cantidad de tablas cortadas por trabajador:');
    tablas = int.parse(stdin.readLineSync()!);

    if (tablas <= 0) {
      break;
    }

    if (tablas < 15) {
      print('Trabajo lento');
    } else if (tablas >= 15 && tablas <= 40) {
      print('Trabajo eficiente');
    } else {
      print('Trabajo sobresaliente');
    }

    totalTablas += tablas;
    cantidadOperarios++;
  }

  print('Total de tablas cortadas: $totalTablas');
  print('Cantidad de operarios registrados: $cantidadOperarios');

  if (cantidadOperarios > 0) {
    double promedio = totalTablas / cantidadOperarios;
    print('Promedio de tablas por operario: $promedio');
  } else {
    print('Promedio de tablas por operario: 0');
  }
}