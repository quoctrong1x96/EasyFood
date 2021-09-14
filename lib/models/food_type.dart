class FoodType {
  final int id;
  final String name;
  final String restaurant;
  final String image;
  final double rating;
  final double price;

  FoodType({
    required this.id,
    this.name = "",
    this.restaurant = "",
    this.image = "",
    this.rating = 0.0,
    this.price = 0.0,
  });

  factory FoodType.fromJson(Map<String, dynamic> json) => FoodType(
        id: json['id'],
        name: json['name'],
        restaurant: json['restaurant'],
        image: json['image'],
        rating: double.parse(json['rating']),
        price: double.parse(json['price']),
      );
}
