import 'package:cenafood/models/userModels/UserAccount.dart';

class Role {
  int roleId;
  String name;
  String rank;
  UserAccount userAccount;
  Role(this.userAccount, this.roleId, this.name, this.rank);
}
