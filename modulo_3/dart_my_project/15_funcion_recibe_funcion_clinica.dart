List<String> filtrarMascotas(List<String> lista, bool Function(String) criterio) {
  return lista.where(criterio).toList();
}

bool empiezaConM(String nombre) => nombre.startsWith('M');
bool nombreLargo(String nombre) => nombre.length > 4;

void main() {
  final pacientes = ['Max', 'Luna', 'Misu', 'Tobby', 'Rocky', 'Molly'];

  print(filtrarMascotas(pacientes, empiezaConM));
  print(filtrarMascotas(pacientes, nombreLargo));

  print(filtrarMascotas(pacientes, (n) => n.contains('o')));
}
