class AnimalClinica {
  final String nombre;
  final int edadAnios;

  AnimalClinica(this.nombre, this.edadAnios);

  String hacerSonido() => '...';

  void presentarse() {
    print('Soy $nombre, tengo $edadAnios años y hago: ${hacerSonido()}');
  }
}

class PerroClinica extends AnimalClinica {
  PerroClinica(super.nombre, super.edadAnios);

  @override
  String hacerSonido() => '¡Guau!';

  void buscarPelota() => print('$nombre busca la pelota');
}

class GatoClinica extends AnimalClinica {
  GatoClinica(super.nombre, super.edadAnios);

  @override
  String hacerSonido() => '¡Miau!';

  void ronronear() => print('$nombre ronronea feliz');
}

void main() {
  final perro = PerroClinica('Rex', 3);
  final gato = GatoClinica('Misu', 5);

  perro.presentarse();
  gato.presentarse();

  perro.buscarPelota();
  gato.ronronear();
}
