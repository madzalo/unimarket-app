import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String? id;
  final String? name;
  final String? description;
  final double? quantity;
  final String? image;
  final String? category;
  final double? price;
  final String? userId;

  const ProductEntity(
      {this.id,
      this.name,
      this.description,
      this.quantity,
      this.image,
      this.category,
      this.price,
      this.userId});

  @override
  List<Object?> get props {
    return [id, name, description, quantity, image, category, price, userId];
  }
}
