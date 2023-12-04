// ignore_for_file: public_member_api_docs, sort_constructors_first

class AddNewProductModel {
  final String name;
  final String description;
  final double quantity;
  final List<String> imageUrls;
  final String category;
  final double price;
  final String? id;

  AddNewProductModel({
    required this.name,
    required this.description,
    required this.quantity,
    required this.imageUrls,
    required this.category,
    required this.price,
    this.id,
  });

  factory AddNewProductModel.fromJson(Map<String, dynamic> json) {
    return AddNewProductModel(
      id: json['id'] as String?,
      name: json['name'] as String,
      description: json['description'] as String,
      quantity: (json['quantity'] as num).toDouble(),
      imageUrls:
          (json['imageUrls'] as List<dynamic>).map((e) => e as String).toList(),
      category: json['category'] as String,
      price: (json['price'] as num).toDouble(),
    );
  }
  Map<String, dynamic> toJson() => {
        // 'id': id,
        'name': name,
        'description': description,
        'quantity': quantity,
        'imageUrls': List<dynamic>.from(imageUrls.map((x) => x)),
        'category': category,
        'price': price,
      };
}
