import 'producto.dart';

class DogBreedDto {
  final String name;
  final List<String> subBreeds;

  const DogBreedDto({required this.name, required this.subBreeds});

  RazaPerro toDomain() => RazaPerro(nombre: name, subrazas: subBreeds);
}
