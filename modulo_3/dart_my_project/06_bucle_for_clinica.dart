void main() {
  for (int i = 0; i < 5; i++) {
    print('Visita veterinaria #${i + 1}');
  }

  for (int i = 0; i <= 100; i += 25) {
    print('Progreso de la consulta: $i%');
  }

  for (int i = 5; i >= 1; i--) {
    print('Días para el próximo control: $i');
  }

  final mascotas = ['Max', 'Luna', 'Tobby', 'Misu', 'Piolín'];

  for (final mascota in mascotas) {
    print('Atendiendo a: $mascota');
  }

  mascotas.forEach((m) => print(m.toLowerCase()));

  final horasMedicina = {'Max': '8:00', 'Luna': '12:00', 'Tobby': '16:00'};
  for (final entrada in horasMedicina.entries) {
    print('${entrada.key} → medicina a las ${entrada.value}');
  }

  for (final caracter in 'Veterinaria'.split('')) {
    print(caracter);
  }
}
