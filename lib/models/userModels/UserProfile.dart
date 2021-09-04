import 'package:easyfood/models/ranking/Ranking.dart';
import 'package:easyfood/models/socialNetwork/SocialNetwork.dart';
import 'package:easyfood/models/userModels/Gender.dart';
import 'package:easyfood/models/userModels/UserAccount.dart';

class UserProfile {
  UserAccount userAccount;
  int profileId;
  String name;
  DateTime birthday;
  Gender gender;
  SocialNetwork socialNetwork;
  String phoneNumber;
  String email;
  String avatarLink;
  int status;
  Ranking ranking;

  UserProfile(
      this.userAccount,
      this.gender,
      this.socialNetwork,
      this.ranking,
      this.profileId,
      this.name,
      this.birthday,
      this.email,
      this.phoneNumber,
      this.status,
      this.avatarLink);
}
