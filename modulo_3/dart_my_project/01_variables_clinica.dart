void main() {
  // Datos de una mascota en la clínica veterinaria
  var nombreMascota = 'Max';
  var edad          = 3;
  var peso          = 12.5;
  var vacunado      = true;

  // Tipo explícito
  String especie   = 'Canino';
  int    visitas   = 5;
  double temperatura = 38.5;
  bool   esterilizado = false;

  // final — no se puede reasignar
  final dueno = 'Carlos Pérez';
  final diagnostico = 'Saludable';

  // const — constante en tiempo de compilación
  const gravedad = 9.8;
  const dosisMaxima = 50.0;

  // Diferencia clave: final vs const
  final ahora  = DateTime.now();

  print('$nombreMascota ($especie) - Dueño: $dueno, Edad: $edad años');

  var contadorVacunas = 0;
  contadorVacunas = 1;

  final listaVacunas = ['Rabia', 'Parvovirus'];
  listaVacunas.add('Moquillo');

  const sintomas = ['fiebre', 'tos', 'vómito'];

  // Tipo no-nullable
  String nombreDueno = 'Ana';
  // nombreDueno = null;

  // Tipo nullable
  String? alergia = null;
  alergia = 'Penicilina';

  // Operadores de null safety
  String? observacion = 'Leve deshidratación';

  print(observacion?.length);

  String resultado = observacion ?? 'Sin observaciones';
  print(resultado);

  String obsSegura = observacion!;

  if (alergia != null) {
    print(alergia.length);
  }

  late String medicamentoRecetado;
  medicamentoRecetado = 'Amoxicilina';
  print(medicamentoRecetado);
}
