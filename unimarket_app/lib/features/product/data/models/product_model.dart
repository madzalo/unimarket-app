import 'package:json_annotation/json_annotation.dart';
import 'package:unimarket_app/features/product/domain/entities/product_entity.dart';

@JsonSerializable()
class ProductModel extends ProductEntity {
  const ProductModel({
    final String? id,
    final String? name,
    final String? description,
    final double? quantity,
    final List<String>? images,
    final String? category,
    final double? price,
    final String? userId,
  }) : super(
            id: id,
            name: name,
            description: description,
            quantity: quantity,
            images: images,
            category: category,
            price: price,
            userId: userId);

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      quantity: (json['quantity'] as num?)?.toDouble(),
      images: (json['imageUrls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
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
      images: entity.images,
      category: entity.category,
      price: entity.price,
      userId: entity.userId,
    );
  }
}
