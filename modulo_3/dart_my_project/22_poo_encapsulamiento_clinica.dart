class HistorialMedico {
  final String nombreMascota;
  double _temperatura;

  HistorialMedico(this.nombreMascota, double temperaturaInicial)
      : _temperatura = temperaturaInicial;

  double get temperatura => _temperatura;

  void registrarTemperatura(double valor) {
    if (valor <= 0) throw ArgumentError('La temperatura debe ser positiva');
    _temperatura = valor;
    print('Temperatura de $nombreMascota: $_temperatura °C');
  }

  void aplicarTratamiento(double descuentoTemperatura) {
    if (descuentoTemperatura <= 0) throw ArgumentError('El descuento debe ser positivo');
    if (descuentoTemperatura > _temperatura) throw StateError('Descuento excede la temperatura');
    _temperatura -= descuentoTemperatura;
    print('Temperatura reducida. Nueva temperatura: $_temperatura °C');
  }
}

void main() {
  final historial = HistorialMedico('Max', 39.5);

  historial.registrarTemperatura(39.5);
  historial.aplicarTratamiento(1.0);
  print(historial.temperatura);
}
