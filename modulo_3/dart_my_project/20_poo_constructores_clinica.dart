class Paciente {
  final String nombre;
  final String especie;
  final int    edad;
  final bool   estaEsterilizado;

  Paciente({
    required this.nombre,
    required this.especie,
    required this.edad,
    this.estaEsterilizado = false,
  });

  Paciente.cachorro({required this.nombre, required this.especie})
      : edad = 0,
        estaEsterilizado = false;

  Paciente.adultoEsterilizado({required this.nombre, required this.especie, required this.edad})
      : estaEsterilizado = true;

  factory Paciente.desdeFicha(String ficha) {
    final datos = ficha.split(',');
    return Paciente(
      nombre: datos[0],
      especie: datos[1],
      edad: int.parse(datos[2]),
    );
  }

  @override
  String toString() =>
      '$nombre ($especie) - ${edad} años ${estaEsterilizado ? "(esterilizado)" : ""}';
}

void main() {
  final p1 = Paciente(nombre: 'Max', especie: 'Canino', edad: 3);
  final p2 = Paciente.cachorro(nombre: 'Bella', especie: 'Felino');
  final p3 = Paciente.adultoEsterilizado(nombre: 'Rocky', especie: 'Canino', edad: 5);
  final p4 = Paciente.desdeFicha('Luna,Felino,2');

  print(p1);
  print(p2);
  print(p3);
  print(p4);
}
