class ProductCategory {
  final int    id;
  final String name;
  const ProductCategory({required this.id, required this.name});

  factory ProductCategory.fromJson(Map<String, dynamic> j) =>
      ProductCategory(id: j['id'] as int, name: j['name'] as String);
}

class Product {
  final int              id;
  final String           name;
  final String           description;
  final double           price;
  final double           priceWithTax;
  final int              stock;
  final bool             inStock;
  final bool             isActive;
  final String?          imageUrl;
  final ProductCategory? category;
  final String           createdAt;
  final String           updatedAt;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.priceWithTax,
    required this.stock,
    required this.inStock,
    required this.isActive,
    this.imageUrl,
    this.category,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Product.fromJson(Map<String, dynamic> j) => Product(
    id:           j['id']                                  as int,
    name:         j['name']                                as String,
    description:  j['description']                         as String,
    price:        double.parse(j['price'].toString()),
    priceWithTax: (j['price_with_tax'] as num).toDouble(),
    stock:        j['stock']                               as int,
    inStock:      j['in_stock']                            as bool,
    isActive:     j['is_active']                           as bool,
    imageUrl:     j['image_url']                           as String?,
    category:     j['category'] != null
                  ? ProductCategory.fromJson(j['category'] as Map<String, dynamic>)
                  : null,
    createdAt:    j['created_at']                          as String,
    updatedAt:    j['updated_at']                          as String,
  );

  static Product empty() => const Product(
    id: 0,
    name: '',
    description: '',
    price: 0.0,
    priceWithTax: 0.0,
    stock: 0,
    inStock: false,
    isActive: false,
    imageUrl: null,
    category: null,
    createdAt: '',
    updatedAt: '',
  );

  Product copyWith({
    int?              id,
    String?           name,
    String?           description,
    double?           price,
    double?           priceWithTax,
    int?              stock,
    bool?             inStock,
    bool?             isActive,
    String?           imageUrl,
    ProductCategory?  category,
    String?           createdAt,
    String?           updatedAt,
  }) => Product(
    id:           id           ?? this.id,
    name:         name         ?? this.name,
    description:  description  ?? this.description,
    price:        price        ?? this.price,
    priceWithTax: priceWithTax ?? this.priceWithTax,
    stock:        stock        ?? this.stock,
    inStock:      inStock      ?? (stock != null ? stock > 0 : this.inStock),
    isActive:     isActive     ?? this.isActive,
    imageUrl:     imageUrl     ?? this.imageUrl,
    category:     category     ?? this.category,
    createdAt:    createdAt    ?? this.createdAt,
    updatedAt:    updatedAt    ?? this.updatedAt,
  );
}

class PaginatedProducts {
  final int            count;
  final String?        next;
  final List<Product>  results;

  const PaginatedProducts({
    required this.count,
    required this.next,
    required this.results,
  });

  factory PaginatedProducts.fromJson(Map<String, dynamic> j) => PaginatedProducts(
    count:   j['count']   as int,
    next:    j['next']    as String?,
    results: (j['results'] as List)
        .map((e) => Product.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}
