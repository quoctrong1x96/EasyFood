import 'package:easyfood/models/userModels/UserProfile.dart';

class AuthMethods {
  // ignore: non_constant_identifier_names
  static final String LOCALSTORAGE_USER = "currentUser";
  // ignore: non_constant_identifier_names
  static final String HOME_PAGE = "/dashboard";

  static final String _apiLoginUser = "https://eazyfood.azure.com/user/login";

  static final String apiUrl = _apiLoginUser + "api/dang-nhap/";
  static final String apiRegister = _apiLoginUser + "api/dang-ky";
  static final String apiGetUserInfor = _apiLoginUser + "api/tai-khoan";
  static final String apiUpdateUser = _apiLoginUser + "api/tai-khoan";
  static final String apiLogout = _apiLoginUser + "api/dang-xuat";
  static final String apiRefreshToken = _apiLoginUser + "api/cap-lai-token";

  Future<UserProfile> getUserAccount(String userAccout, String password) async {
    // final response =
    //     await http.get(Uri.parse(_apiLoginUser + "/" + userAccout));

    // if (response.statusCode == 200) {
    //   // If the server did return a 200 OK response,
    //   // then parse the JSON.
    //   return UserProfile.fromJson(jsonDecode(response.body));
    // } else {
    return UserProfile(
        userAccount: "admin",
        genderId: 1,
        socialNetworkId: 1,
        rankingId: 1,
        profileId: 1,
        name: "Bùi Quốc Trọng",
        birthday: DateTime.parse("dd/MM/yyyy"),
        email: "trongbq.bpc@vnpt.vn",
        phoneNumber: "0949 412 112",
        status: 1,
        avatarLink: "");
    // If the server did not return a 200 OK response,
    // then throw an exception.
    // throw Exception(response.reasonPhrase);
    // }
  }

  //sign in current user with email and password
  Future<UserProfile> handleSignInEmail(
      String userAccount, String password) async {
    final UserProfile user = await getUserAccount(userAccount, password);

    assert(user.isEmpty(), null);
    print('signInEmail succeeded: $userAccount');

    return user;
  }

  // register new user with phone email password details
  // Future<FirebaseUser> handleSignUp(phone, email, password) async {
  //   final FirebaseUser user = await _auth.createUserWithEmailAndPassword(
  //       email: email, password: password);
  //   assert(user != null);
  //   assert(await user.getIdToken() != null);
  //   await addDataToDb(user, email, phone, password);
  //   return user;
  // }

  // after sign up, add user data to firebase realtime database
  // Future<void> addDataToDb(FirebaseUser currentUser, String username,
  //     String phone, String password) async {
  //   User user = User(
  //       uid: currentUser.uid,
  //       email: currentUser.email,
  //       phone: phone,
  //       password: password);

  //   _userReference.child(currentUser.uid).set(user.toMap(user));
  // }

  // current user getter
  // Future<UserProfile> getUserProfile() async {
  //   final response = await http.get(Uri.parse(_apiLoginUser));

  //   if (response.statusCode == 200) {
  //     // If the server did return a 200 OK response,
  //     // then parse the JSON.
  //     return UserProfile.fromJson(jsonDecode(response.body));
  //   } else {

  //     // If the server did not return a 200 OK response,
  //     // then throw an exception.
  //     throw Exception(response.reasonPhrase);
  //   }
  // }

  // public get userValue(): UserModel {
  //       if (!this.userSubject.value) {
  //           return this.getUserFromStorage();
  //       }
  //       return this.userSubject.value;
  //   }
}
