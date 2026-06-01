class Mascota {
  final String id;
  final String nombre;
  String       especie;
  bool         _vacunado = false;

  Mascota({
    required this.id,
    required this.nombre,
    required this.especie,
  });

  bool   get vacunado => _vacunado;
  String get estado   => _vacunado ? 'vacunado' : 'pendiente';

  set estadoVacunado(bool valor) {
    _vacunado = valor;
    print('$nombre: ${valor ? "vacunado" : "vacunación pendiente"}');
  }

  void vacunar() {
    _vacunado = true;
    print('$nombre ha sido vacunado');
  }

  void desvacunar() {
    _vacunado = false;
    print('Registro de vacunación de $nombre removido');
  }

  String resumen() => 'ID: $id | Nombre: $nombre | Especie: $especie | Estado: $estado';

  @override
  String toString() => 'Mascota($nombre, $especie, $estado)';
}

void main() {
  final max = Mascota(
    id:      'M-001',
    nombre:  'Max',
    especie: 'Canino',
  );

  max.vacunar();
  print(max.estado);
  print(max.resumen());
  print(max);

  max.estadoVacunado = false;
  print(max.vacunado);
}
