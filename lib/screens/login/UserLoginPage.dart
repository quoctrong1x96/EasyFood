import 'package:cenafood/screens/Home1Page.dart';
import 'package:cenafood/states/blocs/LoginPageBloc.dart';
import 'package:cenafood/utils/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class UserLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => LoginPageBloc(), child: LoginPageContent());
  }
}

class LoginPageContent extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginPageContent> {
  TextEditingController textNameController = TextEditingController();
  TextEditingController textPasswordController = TextEditingController();
  late LoginPageBloc loginPageBloc;
  bool _rememberMe = false;
  bool _isLoadingLogin = false;
  bool _isBadLogin = false;

  void gotoHomePage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Home1Page()));
  }

  Widget _buildBadLoginText() {
    return Container(
      alignment: Alignment.center,
      child: Text(
        "Thông tin tài khoản hoặc mật khẩu không đúng",
        style: TextStyle(color: Colors.red),
      ),
    );
  }

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Tài khoản',
          style: UniversalVariables.LabelStyle,
        ),
        SizedBox(height: 2.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: UniversalVariables.BoxDecorationStyle,
          height: 40.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            controller: textNameController,
            onTap: () => setState(() => _isBadLogin = false),
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 7.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Nhập  tài khoản CenaFoodie',
              hintStyle: UniversalVariables.HintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Mật khẩu',
          style: UniversalVariables.LabelStyle,
        ),
        SizedBox(height: 2.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: UniversalVariables.BoxDecorationStyle,
          height: 40.0,
          child: TextField(
            onTap: () => setState(() => _isBadLogin = false),
            obscureText: true,
            controller: textPasswordController,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 7.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Nhập mật khẩu',
              hintStyle: UniversalVariables.HintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.topRight,
      child: TextButton(
        style: UniversalVariables.flatButtonStyle,
        onPressed: () => print('Forgot Password Button Pressed'),
        child: Text(
          'Quên mật khẩu?',
          style: UniversalVariables.LabelStyle,
        ),
      ),
    );
  }

  Widget _buildRememberMeCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value!;
                });
              },
            ),
          ),
          Text(
            'Lưu đăng nhập lần sau',
            style: UniversalVariables.LabelStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
        style: UniversalVariables.raiseButtonStyle,
        onPressed: () {
          setState(() {
            _isLoadingLogin = true;
          });
          Future.delayed(Duration(seconds: 2)).then((__) {
            loginPageBloc.Login(
                    textNameController.text, textPasswordController.text)
                .then((_) {
              gotoHomePage();
              setState(() {
                _isLoadingLogin = false;
              });
            }).onError((error, stackTrace) {
              setState(() {
                _isLoadingLogin = false;
                _isBadLogin = true;
              });
              print('Login failure');
            });
          });
        },
        child: Text(
          'ĐĂNG NHẬP',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildSignInWithText() {
    return Column(
      children: <Widget>[
        Text(
          '- Hoặc -',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          'Đăng nhập bằng:',
          style: UniversalVariables.LabelStyle,
        ),
      ],
    );
  }

  Widget _buildSocialBtn(VoidCallback onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40.0,
        width: 40.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  Widget _buildSocialBtnRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildSocialBtn(
            () => print('Login with Facebook'),
            AssetImage(
              'assets/imgs/facebook.jpg',
            ),
          ),
          _buildSocialBtn(
            () => print('Login with Google'),
            AssetImage(
              'assets/imgs/google.jpg',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignupBtn() {
    return GestureDetector(
      onTap: () => print('Sign Up Button Pressed'),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Tạo tài khoản mới!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: ' Tạo tài khoản',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    loginPageBloc = Provider.of<LoginPageBloc>(context);
    print(_isLoadingLogin.toString());
    return _isLoadingLogin
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
            body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF73AEF5),
                            Color(0xFF61A4F1),
                            Color(0xFF478DE0),
                            Color(0xFF398AE5),
                          ],
                          stops: [0.1, 0.4, 0.7, 0.9],
                        ),
                      ),
                    ),
                    Container(
                      height: double.infinity,
                      child: SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                          horizontal: 40.0,
                          vertical: 40.0,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Đăng nhập',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'OpenSans',
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            if (_isBadLogin) _buildBadLoginText(),
                            CircleAvatar(
                              radius: 20.0,
                              backgroundImage:
                                  AssetImage('assets/imgs/logo.jpg'),
                              backgroundColor: Colors.transparent,
                              // child: Image(
                              //   image:
                              //   height: 50.0,
                              // ),
                            ),
                            SizedBox(height: 7.0),
                            _buildEmailTF(),
                            _buildPasswordTF(),
                            _buildForgotPasswordBtn(),
                            _buildRememberMeCheckbox(),
                            _buildLoginBtn(),
                            _buildSignInWithText(),
                            _buildSocialBtnRow(),
                            _buildSignupBtn(),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}

// class LoginPageContent extends StatefulWidget {
//   @override
//   _LoginPageContentState createState() => _LoginPageContentState();
// }

// class _LoginPageContentState extends State<LoginPageContent> {
//   TextEditingController textNameController = TextEditingController();
//   TextEditingController textPasswordController = TextEditingController();

//   final _formKey = GlobalKey<FormState>();

//   late LoginPageBloc loginPageBloc;

//   @override
//   Widget build(BuildContext context) {
//     loginPageBloc = Provider.of<LoginPageBloc>(context);
//     return Scaffold(
//       body: Container(
//         color: UniversalVariables.whiteColor,
//         padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
//         child: Form(
//           key: _formKey,
//           child: buildForm(),
//         ),
//       ),
//     );
//   }

//   buildForm() {
//     return SingleChildScrollView(
//       padding: EdgeInsets.all(32),
//       child: Column(
//         children: [
//           SizedBox(height: 20.0),
//           Image(
//             image: AssetImage('assets/imgs/logo.jpg'),
//             height: 200.0,
//           ),
//           SizedBox(height: 10.0),
//           TextFormField(
//             validator: (accountName) {
//               return loginPageBloc.validateAccount(accountName!);
//             },
//             controller: textNameController,
//             decoration: InputDecoration(hintText: "Tên tài khoản"),
//           ),
//           TextFormField(
//             validator: (password) {
//               return loginPageBloc.validatePassword(password!);
//             },
//             controller: textPasswordController,
//             decoration: InputDecoration(hintText: "Mật khẩu"),
//           ),
//           SizedBox(height: 20.0),
//           TextButton(
//             style: ButtonStyle(
//               backgroundColor:
//                   MaterialStateProperty.all(UniversalVariables.orangeColor),
//               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                   RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(30.0),
//               )),
//             ),
//             onPressed: () => loginPageBloc
//                 .validateFormAndLogin(_formKey, textNameController.text,
//                     textPasswordController.text)
//                 .then((_) => gotoHomePage()),
//             child: Text("Đăng nhập",
//                 style: TextStyle(
//                   color: UniversalVariables.whiteColor,
//                 )),
//           ),
//           loginPageBloc.isLoginPressed
//               ? Center(child: CircularProgressIndicator())
//               : Container(),
//           TextButton.icon(
//             onPressed: () => gotoRegisterPage(),
//             icon: Icon(Icons.person_add),
//             label: Text("Đăng ký tài khoản?",
//                 style: TextStyle(
//                   color: Colors.black45,
//                 )),
//           )
//         ],
//       ),
//     );
//   }



//   gotoRegisterPage() {
//     // Navigator.pushReplacement(
//     //     context, MaterialPageRoute(builder: (context) => RegisterPage()));
//   }
// }
