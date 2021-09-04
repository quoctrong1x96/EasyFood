import 'package:easyfood/models/shipperModels/ShipperAccount.dart';
import 'package:easyfood/models/shopModels/ShopAccount.dart';
import 'package:easyfood/models/userModels/UserAccount.dart';

class Order {
  int orderId;
  UserAccount userAccount;
  ShipperAccount shipperAccount;
  ShopAccount shopAccount;
  int paymentId;
  int promotionId;
  double bonus;
  Order(this.orderId, this.userAccount, this.shipperAccount, this.shopAccount,
      this.paymentId, this.bonus, this.promotionId);
}
