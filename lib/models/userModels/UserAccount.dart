class UserAccount {
  String userAccount;
  String password;

  UserAccount({
    required this.userAccount,
    required this.password,
  });

  Map toMap(UserAccount userAccount) {
    var data = Map<String, dynamic>();
    data['userAccount'] = userAccount.userAccount;
    data['password'] = userAccount.password;
    return data;
  }

  factory UserAccount.fromJson(Map<String, dynamic> json) {
    return UserAccount(
        userAccount: json['userAccount'], password: json['password']);
  }
  // User.fromMap(Map<String, dynamic> mapData) {
  //   this.userId = mapData['userId'];
  //    this.email = mapData['email'];
  //   this.phone = mapData['phone'];
  //   this.password = mapData["password"];
  // }
}
