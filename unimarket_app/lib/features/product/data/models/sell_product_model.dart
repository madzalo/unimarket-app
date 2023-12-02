import 'dart:io';

class SellProductModel {
  final String name;
  final String description;
  final double price;
  final double quantity;
  final String category;

  final List<File> images;

  SellProductModel({
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    required this.category,
    required this.images,
  });
}
