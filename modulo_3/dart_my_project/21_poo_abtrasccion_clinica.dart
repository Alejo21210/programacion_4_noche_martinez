abstract class Animal {
  String get nombre;
  String hacerSonido();
  String get dieta;

  void describir() {
    print('$nombre hace "$hacerSonido()" y su dieta es: $dieta');
  }
}

class Perro extends Animal {
  final String nombre;
  Perro(this.nombre);

  @override String hacerSonido() => 'Guau';
  @override String get dieta => 'Croquetas para perro';
}

class Gato extends Animal {
  final String nombre;
  Gato(this.nombre);

  @override String hacerSonido() => 'Miau';
  @override String get dieta => 'Comida húmeda para gato';
}

void main() {
  final animales = <Animal>[Perro('Max'), Gato('Luna')];
  for (final a in animales) {
    a.describir();
  }
}
