class FoodCategory {
  final int id;
  final String name;
  final String image;

  FoodCategory({
    required this.id,
    this.name = "",
    this.image = "",
  });

  factory FoodCategory.fromJson(Map<String, dynamic> json) => FoodCategory(
        id: json['id'],
        name: json['name'],
        image: json['image'],
      );
}
