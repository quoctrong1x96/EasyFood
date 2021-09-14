class UserAddress {
  final String type;
  final String address;

  UserAddress({
    required this.type,
    this.address = "",
  });

  factory UserAddress.fromJson(Map<String, dynamic> json) => UserAddress(
        type: json['type'],
        address: json['address'],
      );
}
