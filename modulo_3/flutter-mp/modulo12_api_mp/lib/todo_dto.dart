class CatBreedDto {
  final String breed;
  final String country;
  final String origin;
  final String coat;
  final String pattern;

  const CatBreedDto({
    required this.breed,
    required this.country,
    required this.origin,
    required this.coat,
    required this.pattern,
  });

  factory CatBreedDto.fromJson(Map<String, dynamic> json) => CatBreedDto(
    breed:   json['breed']   as String? ?? '',
    country: json['country'] as String? ?? '',
    origin:  json['origin']  as String? ?? '',
    coat:    json['coat']    as String? ?? '',
    pattern: json['pattern'] as String? ?? '',
  );
}
