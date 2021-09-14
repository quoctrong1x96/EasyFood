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
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class NumberAddressScreen extends StatefulWidget {
  final Auth auth;

  NumberAddressScreen(this.auth);

  @override
  _NumberAddressScreenState createState() => _NumberAddressScreenState();
}

class _NumberAddressScreenState extends State<NumberAddressScreen> {
  TextEditingController countryCodeController =
      TextEditingController(text: "+62");
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  bool isClicked = false;

  @override
  void initState() {
    super.initState();

    countryCodeController.text = widget.auth.countryCode!;
    phoneController.text = widget.auth.phoneNumber!;
    addressController.text = widget.auth.address!;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.watch<PageBloc>().add(GoToSignUpScreen(widget.auth));
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
                          Stack(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: GestureDetector(
                                  onTap: () {
                                    context
                                        .watch<PageBloc>()
                                        .add(GoToSignUpScreen(widget.auth));
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
                                  "Number Address",
                                  style:
                                      semiBoldBaseFont.copyWith(fontSize: 20),
                                ),
                              ),
                            ],
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Mobile Number",
                                    style:
                                        regularBaseFont.copyWith(fontSize: 12),
                                  ),
                                  Text(
                                    validation.errorPhoneNumber,
                                    style: regularBaseFont.copyWith(
                                      color: redColor,
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Row(
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: DarkTextField(
                                      hintText: "Dial ID",
                                      controller: countryCodeController,
                                      keyboardType: TextInputType.number,
                                      inputFormatter: MaskTextInputFormatter(
                                          mask: '+###',
                                          filter: {"#": RegExp(r'[0-9]')}),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Flexible(
                                    flex: 3,
                                    child: DarkTextField(
                                      hintText: "Enter Number",
                                      controller: phoneController,
                                      keyboardType: TextInputType.number,
                                      inputFormatter: MaskTextInputFormatter(
                                        mask: '###-####-#####',
                                        filter: {"#": RegExp(r'[0-9]')},
                                      ),
                                      onChanged: (text) {
                                        validation.changePhoneNumber(text);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          DarkTextField(
                            labelText: "Full Address",
                            hintText: "Enter Full Address",
                            maxLines: 4,
                            controller: addressController,
                            errorValidation: validation.errorAddress,
                            onChanged: (text) {
                              validation.changeAddress(text);
                            },
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                margin: EdgeInsets.only(left: 4),
                                child: Theme(
                                  data: ThemeData(
                                      unselectedWidgetColor: whiteColor),
                                  child: Checkbox(
                                    value: validation.isAcceptTerm,
                                    activeColor: accentColor,
                                    onChanged: (value) {
                                      validation.changeTerm(value!);
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "I have agreed to the ",
                                style: regularBaseFont.copyWith(fontSize: 12),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  await launch(
                                      'https://github.com/abuazis/Comida/blob/master/README.md');
                                },
                                child: Text(
                                  "terms and conditions",
                                  style: regularBaseFont.copyWith(
                                    fontSize: 12,
                                    color: accentColor,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
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
                              color: (validation.isNumberAddressValidate())
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
                              onPressed: (validation.isNumberAddressValidate())
                                  ? () {
                                      setState(() {
                                        isClicked = true;
                                      });
                                      onNumberAddressPressed(context);
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
      ),
    );
  }

  void onNumberAddressPressed(BuildContext context) async {
    widget.auth.countryCode = countryCodeController.text;
    widget.auth.phoneNumber = phoneController.text;
    widget.auth.address = addressController.text;

    ResponseUtil response = await AuthRepository.signUp(
      Auth(
        phoneNumber: countryCodeController.text + widget.auth.phoneNumber!,
        address: widget.auth.address,
        id: '',
      ),
    );

    if (response.error['phone_number'] == null) {
      await AuthRepository.verification(widget.auth.name!, widget.auth.email!);
      context.watch<PageBloc>().add(GoToEmailVerificationScreen(widget.auth));
    } else {
      setState(() {
        isClicked = false;
      });

      showValidationBar(
        context,
        color: Color(0xFFD9435E),
        icon: Icons.error_outline,
        message: "Your phone number has been used!",
      );
    }
  }
}
