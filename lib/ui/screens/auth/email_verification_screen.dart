import 'package:cenafood/models/auth.dart';
import 'package:cenafood/network/repositories/auth_repository.dart';
import 'package:cenafood/shared/color.dart';
import 'package:cenafood/shared/font.dart';
import 'package:cenafood/shared/size.dart';
import 'package:cenafood/states/bloc/page_bloc.dart';
import 'package:cenafood/states/provider/validation_provider.dart';
import 'package:cenafood/ui/widgets/base_button.dart';
import 'package:cenafood/ui/widgets/validation_bar.dart';
import 'package:cenafood/utils/response_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class EmailVerificationScreen extends StatefulWidget {
  final Auth auth;

  EmailVerificationScreen(this.auth);

  @override
  _EmailVerificationScreenState createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  TextEditingController verificationCodeController = TextEditingController();

  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<ValidationProvider>(
      builder: (context, validation, _) => WillPopScope(
        onWillPop: () async {
          context.watch<PageBloc>().add(GoToNumberAddressScreen(widget.auth));
          validation.resetVerificationCode();
          return false;
        },
        child: Scaffold(
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
                      child: Column(
                        children: [
                          SizedBox(
                            height: 32,
                          ),
                          Stack(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: GestureDetector(
                                  onTap: () {
                                    context.watch<PageBloc>().add(
                                        GoToNumberAddressScreen(widget.auth));
                                    validation.resetVerificationCode();
                                  },
                                  child: Icon(
                                    LineAwesomeIcons.angle_left,
                                    color: whiteColor,
                                    size: 24,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Email Verification",
                                  style:
                                      semiBoldBaseFont.copyWith(fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 36,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "We have sent verification code to your email address. Please check your email inbox.",
                              style: regularBaseFont.copyWith(fontSize: 12),
                            ),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          PinCodeTextField(
                            appContext: context,
                            length: 4,
                            controller: verificationCodeController,
                            backgroundColor: Colors.transparent,
                            keyboardType: TextInputType.number,
                            textStyle: regularBaseFont.copyWith(
                              fontSize: 20,
                              color: whiteColor,
                            ),
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              fieldWidth: 55,
                              fieldHeight: 60,
                              inactiveColor: borderColor,
                              selectedColor: whiteColor,
                              activeColor: accentColor,
                              borderRadius: BorderRadius.circular(4),
                              borderWidth: 2,
                            ),
                            onChanged: (value) {
                              validation.changeVerificationCode(value);
                            },
                            onCompleted: (value) {
                              setState(() {
                                isClicked = true;
                              });
                              onEmailVerificationPressed(context);
                            },
                          ),
                          if (isClicked)
                            Padding(
                              padding: EdgeInsets.only(
                                top: 20,
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
                              color: (validation.errorVerificationCode == "")
                                  ? accentColor
                                  : greyColor,
                              margin: EdgeInsets.only(
                                top: 20,
                                bottom: 79,
                              ),
                              child: Icon(
                                LineAwesomeIcons.long_arrow_right,
                                size: 24,
                                color: whiteColor,
                              ),
                              onPressed:
                                  (validation.errorVerificationCode == "")
                                      ? () {
                                          setState(() {
                                            isClicked = true;
                                          });
                                          onEmailVerificationPressed(context);
                                        }
                                      : null,
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onEmailVerificationPressed(BuildContext context) async {
    ResponseUtil response = await AuthRepository.signUp(
      Auth(
        name: widget.auth.name,
        email: widget.auth.email,
        password: widget.auth.password,
        confirmPassword: widget.auth.confirmPassword,
        phoneNumber: widget.auth.phoneNumber,
        address: widget.auth.address,
        id: '',
      ),
      code: verificationCodeController.text,
    );

    if (response.statusCode == 200) {
      context.watch<PageBloc>().add(GoToMainScreen());
      Provider.of<ValidationProvider>(context, listen: false).resetChange();
      Provider.of<ValidationProvider>(context, listen: false)
          .resetChangeNumberAddress();
      Provider.of<ValidationProvider>(context, listen: false)
          .resetVerificationCode();
    } else if (response.statusCode == 422) {
      setState(() {
        isClicked = false;
      });

      Provider.of<ValidationProvider>(context, listen: false)
          .resetVerificationCode();

      showValidationBar(
        context,
        color: Color(0xFFD9435E),
        icon: Icons.error_outline,
        message: "Your verfication code has expired!",
      );
    } else {
      setState(() {
        isClicked = false;
        verificationCodeController.text = "";
      });

      Provider.of<ValidationProvider>(context, listen: false)
          .resetVerificationCode();

      showValidationBar(
        context,
        color: Color(0xFFD9435E),
        icon: Icons.error_outline,
        message: "Your verification code is wrong!",
      );
    }
  }
}
