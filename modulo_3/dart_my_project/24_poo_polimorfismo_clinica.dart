abstract class ServicioVeterinario {
  String get nombre;
  double calcularCosto();
}

class ConsultaGeneral extends ServicioVeterinario {
  final double precioBase;
  ConsultaGeneral(this.precioBase);
  @override String get nombre => 'Consulta General';
  @override double calcularCosto() => precioBase;
}

class Vacunacion extends ServicioVeterinario {
  final double precioVacuna;
  final int cantidad;
  Vacunacion(this.precioVacuna, this.cantidad);
  @override String get nombre => 'Vacunación';
  @override double calcularCosto() => precioVacuna * cantidad;
}

class Cirugia extends ServicioVeterinario {
  final double costoQuirofano;
  final double honorarios;
  Cirugia(this.costoQuirofano, this.honorarios);
  @override String get nombre => 'Cirugía';
  @override double calcularCosto() => costoQuirofano + honorarios;
}

void imprimirCosto(ServicioVeterinario servicio) {
  print('${servicio.nombre}: \$${servicio.calcularCosto().toStringAsFixed(2)}');
}

void main() {
  final servicios = <ServicioVeterinario>[
    ConsultaGeneral(35.0),
    Vacunacion(25.0, 3),
    Cirugia(200.0, 150.0),
  ];

  for (final s in servicios) {
    imprimirCosto(s);
  }

  final mayor = servicios.reduce((a, b) => a.calcularCosto() > b.calcularCosto() ? a : b);
  print('\nServicio más costoso: ${mayor.nombre}');
}
