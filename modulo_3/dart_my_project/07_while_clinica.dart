void main() {
  int dosisAplicadas = 0;
  int medicinaDisponible = 100;

  while (medicinaDisponible > 0) {
    final dosis = medicinaDisponible > 20 ? 20 : medicinaDisponible;
    dosisAplicadas++;
    medicinaDisponible -= dosis;
    print('Dosis $dosisAplicadas: $dosis ml (restante: $medicinaDisponible ml)');
  }

  int intentos = 0;
  bool citaConfirmada = false;

  do {
    intentos++;
    print('Llamando al dueño... Intento #$intentos');
    if (intentos == 3) citaConfirmada = true;
  } while (!citaConfirmada && intentos < 5);

  print(citaConfirmada
      ? 'Cita confirmada tras $intentos intentos'
      : 'No se pudo contactar al dueño');
}
