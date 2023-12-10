import 'package:floor/floor.dart';
import 'package:unimarket_app/features/product/domain/entities/product_entity.dart';

@Entity(tableName: 'product', primaryKeys: ['id'])
class ProductModel extends ProductEntity {
  const ProductModel({
    final String? id,
    final String? name,
    final String? description,
    final double? quantity,
    final String? image,
    final String? category,
    final double? price,
    final String? userId,
  }) : super(
            id: id,
            name: name,
            description: description,
            quantity: quantity,
            image: image,
            category: category,
            price: price,
            userId: userId);

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      quantity: (json['quantity'] as num?)?.toDouble(),
      image: json['imageUrls'][0] as String?,
      category: json['category'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      userId: json['userId'] as String?,
    );
  }

  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      id: entity.id,
      name: entity.name,
      description: entity.description,
      quantity: entity.quantity,
      image: entity.image,
      category: entity.category,
      price: entity.price,
      userId: entity.userId,
    );
  }
}
