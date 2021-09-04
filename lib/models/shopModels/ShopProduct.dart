import 'package:easyfood/models/ranking/Rating.dart';

class ShopProduct {
  int shopProductId;
  String name;
  String makeIn;
  String kind;
  DateTime timeWating;
  String material;
  double price;
  double discountPercent;
  Rating rating;
  int quantity;

  ShopProduct(
      this.shopProductId,
      this.name,
      this.makeIn,
      this.kind,
      this.timeWating,
      this.material,
      this.price,
      this.discountPercent,
      this.rating,
      this.quantity);
}
