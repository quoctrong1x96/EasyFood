import 'package:easyfood/models/ranking/Ranking.dart';
import 'package:easyfood/models/shipperModels/ShipperAccount.dart';
import 'package:easyfood/models/userModels/Gender.dart';

class ShipperProfile {
  ShipperAccount shipperAccount;
  int profileId;
  String name;
  DateTime birthday;
  Gender gender;
  String phoneNumber;
  String email;
  String avatarLink;
  int status;
  Ranking ranking;

  ShipperProfile(
      this.shipperAccount,
      this.gender,
      this.ranking,
      this.profileId,
      this.name,
      this.birthday,
      this.email,
      this.phoneNumber,
      this.status,
      this.avatarLink);
}
