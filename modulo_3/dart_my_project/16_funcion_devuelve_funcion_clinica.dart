double Function(double) crearMultiplicadorDosis(double factor) {
  return (double dosis) => dosis * factor;
}

void main() {
  final dosisPerro    = crearMultiplicadorDosis(1.0);
  final dosisGato     = crearMultiplicadorDosis(0.7);
  final dosisCachorro = crearMultiplicadorDosis(0.5);

  print('Perro: ${dosisPerro(10.0)} ml');
  print('Gato: ${dosisGato(10.0)} ml');
  print('Cachorro: ${dosisCachorro(10.0)} ml');

  bool Function(double) crearValidadorPeso(double min, double max) {
    return (peso) => peso >= min && peso <= max;
  }

  final esRazaPequena  = crearValidadorPeso(0, 10);
  final esRazaGrande   = crearValidadorPeso(25, double.infinity);

  print(esRazaPequena(5.0));
  print(esRazaGrande(30.0));
  print(esRazaGrande(10.0));
}
