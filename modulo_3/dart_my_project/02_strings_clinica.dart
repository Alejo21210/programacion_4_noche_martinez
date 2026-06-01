void main() {
  final nombreMascota = 'Luna';
  final edad = 2;

  print('Hola, $nombreMascota');

  print('${nombreMascota.toUpperCase()} tiene ${edad + 1} años el próximo año');

  final fichaMedica =
      '''
Nombre: $nombreMascota
Edad:   $edad años
Vacunado:  ${edad >= 1 ? 'Sí' : 'No'}
  ''';
  print(fichaMedica);

  final ruta = r'C:\Clinica\expedientes\luna.pdf';
  print(ruta);

  final saludo = 'Paciente: ' + nombreMascota;

  print('veterinaria'.toUpperCase());
  print('  Canino  '.trim());
  print('Vacuna'.contains('cun'));
  print('Vacuna'.replaceAll('a', 'A'));
  print('perro,gato,ave'.split(','));
  print('Vacuna'.substring(0, 4));
  print('Perro'.startsWith('Per'));
  print('123'.padLeft(5, '0'));
  print('123'.padRight(5, '0'));
}
