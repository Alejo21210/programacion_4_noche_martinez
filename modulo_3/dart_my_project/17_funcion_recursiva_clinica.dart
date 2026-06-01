int calcularDosisTotal(int dosisBase, int dosisAplicadas) {
  if (dosisAplicadas <= 0) return 0;
  return dosisBase + calcularDosisTotal(dosisBase, dosisAplicadas - 1);
}

int fibonacciConejos(int n) {
  if (n <= 1) return n;
  return fibonacciConejos(n - 1) + fibonacciConejos(n - 2);
}

int contarAnimales(Map<String, dynamic> clinica) {
  int total = 0;
  for (final entrada in clinica.entries) {
    if (entrada.value is Map) {
      total += contarAnimales(entrada.value as Map<String, dynamic>);
    } else {
      total++;
    }
  }
  return total;
}

void main() {
  print('Dosis total por 3 aplicaciones de 10mg: ${calcularDosisTotal(10, 3)} mg');
  print("Parejas de conejos al mes 10: ${fibonacciConejos(10)}");

  final clinica = {
    'consultorios': {
      'box_1': {'Max': 'canino', 'Luna': 'felino'},
      'box_2': {'Tobby': 'canino'},
    },
    'hospitalizacion': {
      'jaula_1': {'Rocky': 'canino'},
    },
    'farmacia': {'medicamentos': true},
    'recepcion': {'computadora': true},
  };

  print('Total de animales registrados: ${contarAnimales(clinica)}');
}
