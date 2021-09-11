class UserProfile {
  String userAccount;
  int profileId;
  String name;
  DateTime birthday;
  int genderId;
  int socialNetworkId;
  String phoneNumber;
  String email;
  String avatarLink;
  int status;
  int rankingId;

  UserProfile(
      {required this.userAccount,
      required this.genderId,
      required this.socialNetworkId,
      required this.rankingId,
      required this.profileId,
      required this.name,
      required this.birthday,
      required this.email,
      required this.phoneNumber,
      required this.status,
      required this.avatarLink});

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
        userAccount: json['userAccount'],
        genderId: json['genderId'],
        socialNetworkId: json['socialNetworkId'],
        rankingId: json['rankingId'],
        profileId: json['profileId'],
        name: json['name'],
        birthday: json['birthday'],
        email: json['email'],
        phoneNumber: json['phoneNumber'],
        status: json['status'],
        avatarLink: json['avatarLink']);
  }
  bool isEmpty() {
    if (this.profileId == -1) {
      return true;
    }
    return false;
  }
}
