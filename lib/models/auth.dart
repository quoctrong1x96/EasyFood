class Auth {
  String id;
  String? name = "";
  String? email = "";
  String? password = "";
  String? confirmPassword = "";
  String? countryCode = "";
  String? phoneNumber = "";
  String? address = "";

  Auth({
    required this.id,
    this.name = "",
    this.email = "",
    this.password = "",
    this.confirmPassword = "",
    this.countryCode = "",
    this.phoneNumber = "",
    this.address = "",
  });
}
