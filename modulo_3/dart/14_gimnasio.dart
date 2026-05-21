import 'dart:io';

void main() {
  int totalMinutos = 0;
  int cantidadClientes = 0;
  int minutos = -1;

  while (minutos != 0) {
    print('Ingrese los minutos de entrenamiento del cliente:');
    minutos = int.parse(stdin.readLineSync()!);

    if (minutos <= 0) {
      break;
    }

    if (minutos < 30) {
      print('Entrenamiento insuficiente');
    } else if (minutos >= 30 && minutos <= 90) {
      print('Entrenamiento adecuado');
    } else {
      print('Entrenamiento intenso');
    }

    totalMinutos += minutos;
    cantidadClientes++;
  }

  print('Total de minutos entrenados: $totalMinutos');
  print('Cantidad de clientes registrados: $cantidadClientes');
  
  if (cantidadClientes > 0) {
    double promedio = totalMinutos / cantidadClientes;
    print('Promedio de minutos por cliente: $promedio');
  } else {
    print('Promedio de minutos por cliente: 0');
  }
}