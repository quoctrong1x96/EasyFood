import 'package:flutter/material.dart';

class UniversalVariables {
  static final Color mainBackgroundColor = Colors.deepOrangeAccent;

  static final Color orangeColor = Colors.orange;
  static final Color orangeAccentColor = Colors.orangeAccent;
  static final Color blackColor = Color(0xff19191b);
  static final Color whiteColor = Colors.white;
  static final Color whiteLightColor = Colors.white10;
  static final Color amberColor = Colors.amber;

  static final Color greyColor = Color(0xff8f8f8f);
  static final Color userCircleBackground = Color(0xff2b2b33);
  static final Color onlineDotColor = Color(0xff46dc64);
  static final Color lightBlueColor = Color(0xff0077d7);
  static final Color separatorColor = Color(0xff272c35);

  static final Color gradientColorStart = Color(0xff00b6f3);
  static final Color gradientColorEnd = Color(0xff0184dc);

  static final Color senderColor = Color(0xff2b343b);
  static final Color receiverColor = Color(0xff1e2225);

  static final Gradient fabGradient = LinearGradient(
      colors: [gradientColorStart, gradientColorEnd],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);

  static final String textHome = "Trang chủ";

  // ignore: non_constant_identifier_names
  static final HintTextStyle = TextStyle(
    color: Colors.white54,
    fontFamily: 'OpenSans',
  );

  // ignore: non_constant_identifier_names
  static final LabelStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.normal,
    fontFamily: 'OpenSans',
    fontSize: 12.0,
    height: 7.0,
  );

  // ignore: non_constant_identifier_names
  static final BoxDecorationStyle = BoxDecoration(
    color: Color(0xFF6CA8F1),
    borderRadius: BorderRadius.circular(10.0),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 6.0,
        offset: Offset(0, 2),
      ),
    ],
  );
  static final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    primary: Colors.white,
    //minimumSize: Size(88, 44),
    padding: EdgeInsets.symmetric(horizontal: 16.0),
  );

  static final ButtonStyle raiseButtonStyle = ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
      elevation: MaterialStateProperty.resolveWith<double>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed) ||
              states.contains(MaterialState.disabled)) {
            return 0;
          }
          return 10;
        },
      ));
}
