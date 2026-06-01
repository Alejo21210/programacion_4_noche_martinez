int vacunar(int dosis)  => dosis * 2;
int reforzar(int dosis) => dosis * 3;

void main() {
  int Function(int) operacion;

  operacion = vacunar;
  print(operacion(5));

  operacion = reforzar;
  print(operacion(5));

  final transformaciones = <int Function(int)>[vacunar, reforzar];
  for (final fn in transformaciones) {
    print(fn(10));
  }
}
