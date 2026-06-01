void main() {
  final pesos = [3.5, 12.0, 25.5, 8.2, 40.0];

  final pesosEnGramos = pesos.map((p) => p * 1000);
  print(pesosEnGramos.toList());

  final mascotas = ['Max', 'Luna', 'Tobby', 'Misu'];
  final fichas = mascotas.map((m) => 'Paciente: $m');
  print(fichas.toList());

  final temperaturas = [36.1, 38.8, 39.2, 37.5, 38.7, 35.9];

  final conFiebre = temperaturas.where((t) => t > 38.5);
  print(conFiebre.toList());

  final normales = temperaturas.where((t) => t >= 37.5 && t <= 38.5);
  print(normales.toList());

  final costos = [1500.0, 2300.0, 980.0, 3100.0, 750.0];

  final total = costos.reduce((acum, costo) => acum + costo);
  print('Total recaudado: \$${total.toStringAsFixed(2)}');

  final totalFold = costos.fold(0.0, (acum, costo) => acum + costo);
  print('Total recaudado (fold): \$${totalFold.toStringAsFixed(2)}');

  final maximo = costos.reduce((a, b) => a > b ? a : b);
  print('Mayor costo: \$$maximo');
}
