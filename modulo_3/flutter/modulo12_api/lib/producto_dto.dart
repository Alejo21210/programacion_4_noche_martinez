import 'producto.dart';

class ProductoDto {
  final int     id;
  final String  name;
  final String  price;
  final bool    isActive;
  final String? categoryName;

  const ProductoDto({
    required this.id,
    required this.name,
    required this.price,
    required this.isActive,
    this.categoryName,
  });

  factory ProductoDto.fromJson(Map<String, dynamic> json) => ProductoDto(
    id:           json['id']            is int  ? json['id']  as int   : 0,
    name:         json['name']          is String ? json['name'] as String : (json['name']?.toString() ?? ''),
    price:        json['price']?.toString() ?? '0',
    isActive:     json['isactive']      is bool  ? json['isactive'] as bool : (json['isactive'] == 1),
    categoryName: json['categoryname']  is String ? json['categoryname'] as String? : json['categoryname']?.toString(),
  );

  Producto toDomain() => Producto(
    id:        id,
    nombre:    name,
    precio:    double.tryParse(price) ?? 0,
    activo:    isActive,
    categoria: categoryName,
  );
}
