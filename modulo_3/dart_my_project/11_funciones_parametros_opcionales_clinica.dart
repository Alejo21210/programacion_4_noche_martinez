String programarCita(String mascota, String servicio, [String? veterinario]) {
  if (veterinario != null) {
    return 'Cita: $mascota - $servicio con Dr. $veterinario';
  }
  return 'Cita: $mascota - $servicio (veterinario por asignar)';
}

String programarCitaV2(String mascota, String servicio, [String veterinario = 'Sin asignar']) {
  return 'Cita: $mascota - $servicio con $veterinario';
}

void configurarTratamiento({
  required String mascota,
  required String medicamento,
  bool   requiereAyuno     = false,
  int    duracionDias      = 7,
}) {
  final ayuno = requiereAyuno ? 'con ayuno previo' : 'sin ayuno';
  print('$mascota: $medicamento por $duracionDias días ($ayuno)');
}

void main() {
  print(programarCita('Max', 'Vacunación'));
  print(programarCita('Luna', 'Cirugía', 'Gómez'));
  print(programarCitaV2('Tobby', 'Desparasitación'));

  configurarTratamiento(
    mascota:       'Max',
    medicamento:   'Amoxicilina',
    requiereAyuno: true,
    duracionDias:  10,
  );

  configurarTratamiento(
    mascota:     'Luna',
    medicamento: 'Antiparasitario',
  );
}
