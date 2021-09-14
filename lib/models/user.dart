import 'user_address.dart';

class User {
  final int? id;
  final String? name;
  final String? email;
  final String? phoneNumber;
  final List<UserAddress>? addresses;

  User({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.addresses,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phoneNumber: json['phone_number'],
        addresses: List<UserAddress>.from(
            json['addresses'].map((x) => UserAddress.fromJson(x))),
      );
}
