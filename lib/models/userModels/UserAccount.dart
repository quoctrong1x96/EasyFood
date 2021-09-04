class UserAccount {
  String userId;
  String phone;
  String email;
  String password;

  UserAccount(
      {required this.userId,
      required this.password,
      required this.email,
      required this.phone});

  Map toMap(UserAccount userAccount) {
    var data = Map<String, dynamic>();
    data['userId'] = userAccount.userId;
    data['email'] = userAccount.email;
    data['phone'] = userAccount.phone;
    data['password'] = userAccount.password;
    return data;
  }

  // User.fromMap(Map<String, dynamic> mapData) {
  //   this.userId = mapData['userId'];
  //    this.email = mapData['email'];
  //   this.phone = mapData['phone'];
  //   this.password = mapData["password"];
  // }
}
