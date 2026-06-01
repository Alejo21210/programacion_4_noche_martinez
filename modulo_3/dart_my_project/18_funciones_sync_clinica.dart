import 'dart:io';

Future<String> obtenerResultadoLaboratorio() async {
  await Future.delayed(Duration(milliseconds: 200));
  return 'Hemograma: Normal - Glóbulos blancos: 12.5 K/ul';
}

void main() async {
  print('Procesando análisis de laboratorio...');
  final resultado = await obtenerResultadoLaboratorio();
  print('Resultado: $resultado');
  print('Análisis completado');
}
