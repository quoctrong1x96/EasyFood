import 'dart:async';

import 'package:cenafood/shared/font.dart';
import 'package:cenafood/shared/size.dart';
import 'package:cenafood/states/bloc/page_bloc.dart';
import 'package:cenafood/utils/location_util.dart';
import 'package:cenafood/utils/storage_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _splashToNextScreen();
  }

  Future<Timer> _splashToNextScreen() async {
    final bool isGPSEnabled = await LocationUtil.isGPSEnabled();
    return Timer(Duration(seconds: 5), () {
      if (!isGPSEnabled) {
        context.watch<PageBloc>().add(GoToLocationPermissionScreen());
      } else {
        if (StorageUtil.hasStorage('token')) {
          context.watch<PageBloc>().add(GoToMainScreen());
        } else {
          context.watch<PageBloc>().add(GoToSignInScreen());
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    return Scaffold(
      body: Container(
        width: deviceWidth(context),
        height: deviceHeight(context),
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
                height: 110,
              ),
              Image.asset(
                "assets/image/splash_logo.png",
                width: 198,
                height: 68,
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "Fast Food Market",
                style: semiBoldBaseFont.copyWith(
                  fontSize: 16,
                  letterSpacing: -0.42,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
