void main() {
  double temperatura = 39.5;

  if (temperatura > 39.0) {
    print('Fiebre alta');
  } else if (temperatura > 38.0) {
    print('Temperatura elevada');
  } else {
    print('Temperatura normal');
  }

  String estado = temperatura > 39.0 ? 'Con fiebre' : 'Sin fiebre';
  print(estado);

  String? diagnostico;
  String display = diagnostico != null ? diagnostico.toUpperCase() : 'Sin diagnóstico';

  String display2 = diagnostico?.toUpperCase() ?? 'Sin diagnóstico';
  print(display2);

  String? nombreDueno;

  if (nombreDueno != null) {
    print(nombreDueno.length);
  }

  print(nombreDueno?.length);

  int longitud = nombreDueno?.length ?? 0;
  print(longitud);
}
