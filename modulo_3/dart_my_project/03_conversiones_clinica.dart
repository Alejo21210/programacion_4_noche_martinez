void main() {
  int visitas = 3;
  double deuda = visitas.toDouble();
  String texto = visitas.toString();

  int num1 = int.parse('5');
  double num2 = double.parse('12.5');

  int? num3 = int.tryParse('abc');
  double? num4 = double.tryParse('99');

  Object valor = 'Canino';
  if (valor is String) {
    print(valor.length);
  }

  Object obj = 'Felino';
  String str = obj as String;

  String? raza = null;
  int longitud = raza?.length ?? 0;
  print(longitud);

  print(double.infinity);
  print(double.nan);
  print(double.maxFinite);
}
