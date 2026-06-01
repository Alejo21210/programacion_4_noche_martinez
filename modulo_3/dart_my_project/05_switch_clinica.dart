void main() {
  String especie = 'Canino';

  switch (especie) {
    case 'Canino':
      print('Perro');
    case 'Felino':
      print('Gato');
    case 'Ave':
      print('Pájaro');
    case 'Roedor':
      print('Hámster / Cobayo');
    case 'Reptil':
      print('Lagarto / Tortuga');
    default:
      print('Especie desconocida');
  }

  especie = 'Felino';

  String descripcion = switch (especie) {
    'Canino'    => 'Perro doméstico',
    'Felino'    => 'Gato doméstico',
    'Ave'       => 'Ave de compañía',
    'Roedor'    => 'Roedor pequeño',
    'Reptil'    => 'Reptil exótico',
    'Equino'    => 'Caballo / Yegua',
    _           => 'Especie no registrada',
  };

  print(descripcion);

  int codigoSintoma = 2;

  String tipoSintoma = switch (codigoSintoma) {
    1 || 2 || 3       => 'Digestivo (vómito, diarrea)',
    4 || 5 || 6       => 'Respiratorio (tos, estornudos)',
    7 || 8 || 9       => 'Dermatológico (picazón, caída pelo)',
    10 || 11 || 12    => 'Traumatismo (fractura, herida)',
    _                 => 'Síntoma desconocido',
  };

  print(tipoSintoma);

  double peso = 25.5;

  String talla = switch (peso) {
    double p when p >= 40.0 => 'Grande',
    double p when p >= 20.0 => 'Mediano',
    double p when p >= 5.0  => 'Pequeño',
    double p when p >= 0.5  => 'Miniatura',
    _                       => 'Peso no válido',
  };

  print(talla);

  Object respuestaApi = {'id': 1, 'nombre': 'Max', 'especie': 'Canino'};

  String resultado = switch (respuestaApi) {
    Map<String, dynamic> m when m.containsKey('error') =>
        'Error: ${m['error']}',
    Map<String, dynamic> m =>
        'Paciente: ${m['nombre']} — ${m['especie']}',
    List<dynamic> lista =>
        '${lista.length} mascotas en la lista',
    String texto =>
        'Texto recibido: $texto',
    _ =>
        'Respuesta desconocida',
  };

  print(resultado);
}
