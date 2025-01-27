class Product {
  final int id;
  final String imageUrl;
  final String name;
  final double price;
  final String description;

  Product({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      imageUrl: json['image_url'],
      name: json['name'],
      price: double.parse(json['price']), // Mengonversi String ke double
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image_url': imageUrl,
      'name': name,
      'price': price.toString(), // Mengonversi double ke String
      'description': description,
    };
  }
}
