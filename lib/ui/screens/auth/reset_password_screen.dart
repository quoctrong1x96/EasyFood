import 'package:cenafood/models/auth.dart';
import 'package:cenafood/network/repositories/auth_repository.dart';
import 'package:cenafood/shared/color.dart';
import 'package:cenafood/shared/font.dart';
import 'package:cenafood/shared/size.dart';
import 'package:cenafood/states/bloc/page_bloc.dart';
import 'package:cenafood/states/provider/validation_provider.dart';
import 'package:cenafood/ui/widgets/base_button.dart';
import 'package:cenafood/ui/widgets/dark_text_field.dart';
import 'package:cenafood/ui/widgets/validation_bar.dart';
import 'package:cenafood/utils/response_util.dart';
import 'package:cenafood/utils/storage_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:provider/provider.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmationController = TextEditingController();

  bool isHidePassword = false;
  bool isHidePasswordConfirmation = false;
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: blackColor,
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Container(
                width: deviceWidth(context),
                height: deviceHeight(context) - statusBarHeight(context),
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/image/bg_splash.png"),
                  ),
                ),
                child: Center(
                  child: Consumer<ValidationProvider>(
                    builder: (context, validation, _) => Column(
                      children: [
                        SizedBox(
                          height: 32,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Reset Password",
                            style: semiBoldBaseFont.copyWith(fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 36,
                        ),
                        Image.asset(
                          "assets/image/splash_logo.png",
                          width: 152,
                          height: 52,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "Fast Food Market",
                          style: semiBoldBaseFont.copyWith(
                            fontSize: 13,
                            letterSpacing: -0.33,
                          ),
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        DarkTextField(
                          labelText: "New Password",
                          hintText: "Enter Password",
                          obscureText: !isHidePassword,
                          controller: passwordController,
                          errorValidation: validation.errorPassword,
                          onChanged: (value) {
                            validation.changePassword(value);
                          },
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isHidePassword = !isHidePassword;
                              });
                            },
                            child: Theme(
                              data: Theme.of(context)
                                  .copyWith(primaryColor: null),
                              child: (!isHidePassword)
                                  ? Icon(
                                      LineAwesomeIcons.eye_slash,
                                      size: 24,
                                      color: greyColor,
                                    )
                                  : Icon(
                                      LineAwesomeIcons.eye,
                                      size: 24,
                                      color: greyColor,
                                    ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        DarkTextField(
                          labelText: "Confirm New Password",
                          hintText: "Enter Confirm Password",
                          obscureText: !isHidePasswordConfirmation,
                          controller: confirmationController,
                          errorValidation: validation.errorPasswordConfirmation,
                          onChanged: (value) {
                            validation.changePasswordConfirmation(
                                value, passwordController.text);
                          },
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isHidePasswordConfirmation =
                                    !isHidePasswordConfirmation;
                              });
                            },
                            child: Theme(
                              data: Theme.of(context)
                                  .copyWith(primaryColor: null),
                              child: (!isHidePasswordConfirmation)
                                  ? Icon(
                                      LineAwesomeIcons.eye_slash,
                                      size: 24,
                                      color: greyColor,
                                    )
                                  : Icon(
                                      LineAwesomeIcons.eye,
                                      size: 24,
                                      color: greyColor,
                                    ),
                            ),
                          ),
                        ),
                        if (isClicked)
                          Padding(
                            padding: EdgeInsets.only(
                              top: 32,
                              bottom: 79,
                            ),
                            child: SpinKitThreeBounce(
                              color: whiteColor,
                              size: 45,
                            ),
                          )
                        else
                          BaseButton(
                            width: 150,
                            height: 45,
                            color: ((validation.errorPassword == "") &&
                                    (validation.errorPasswordConfirmation ==
                                        ""))
                                ? accentColor
                                : greyColor,
                            margin: EdgeInsets.only(
                              top: 32,
                              bottom: 79,
                            ),
                            child: Icon(
                              LineAwesomeIcons.long_arrow_right,
                              size: 24,
                              color: whiteColor,
                            ),
                            onPressed: ((validation.errorPassword == "") &&
                                    (validation.errorPasswordConfirmation ==
                                        ""))
                                ? () {
                                    setState(() {
                                      isClicked = true;
                                    });
                                    onResetPasswordPressed(context);
                                  }
                                : null,
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onResetPasswordPressed(BuildContext context) async {
    ResponseUtil response = await AuthRepository.updatePassword(
      Auth(
        password: passwordController.text,
        confirmPassword: confirmationController.text,
        id: '',
      ),
    );

    if (response.statusCode == 200) {
      context.watch<PageBloc>().add(GoToSignInScreen());
      Provider.of<ValidationProvider>(context, listen: false).resetChange();

      StorageUtil.removeStorage('reset_token');

      showValidationBar(
        context,
        color: Color(0xFF1ABC9C),
        icon: Icons.check_circle_outline,
        message: "Your password has been changed!",
      );
    } else {
      setState(() {
        isClicked = false;
      });

      showValidationBar(
        context,
        color: Color(0xFFD9435E),
        icon: Icons.error_outline,
        message: "Failed change your password!",
      );
    }
  }
}
