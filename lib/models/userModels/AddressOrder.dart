import 'package:easyfood/models/others/Location.dart';
import 'package:easyfood/models/userModels/AddressType.dart';
import 'package:easyfood/models/userModels/UserAccount.dart';

class AddressOrder {
  UserAccount userAccount;
  int addressOrderId;
  AddressType addressType;
  String address;
  Location location;
  String nameRecive;
  String numberPhone;

  AddressOrder(this.userAccount, this.addressOrderId, this.addressType,
      this.address, this.location, this.nameRecive, this.numberPhone);
}
