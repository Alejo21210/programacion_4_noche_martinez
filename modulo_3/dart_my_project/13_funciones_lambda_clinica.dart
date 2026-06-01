void main() {
  final calcularDosis = (double pesoKg) => pesoKg * 0.2;
  print('Dosis: ${calcularDosis(12.5)} ml');

  final calcCostoConsulta = (double costoBase, double descPct) {
    final descuento = costoBase * (descPct / 100);
    return costoBase - descuento;
  };
  print('Total consulta: \$${calcCostoConsulta(50.0, 10.0)}');

  final pesos = [3.5, 12.0, 25.5, 8.2, 40.0];
  pesos.sort((a, b) => b.compareTo(a));
  print(pesos);
}
