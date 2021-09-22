import 'package:cenafood/shared/color.dart';
import 'package:cenafood/states/provider/navigation_provider.dart';
import 'package:cenafood/ui/screens/food/explore_screen.dart';
import 'package:cenafood/ui/screens/offers/offers_screen.dart';
import 'package:cenafood/ui/screens/user/profile.dart';
import 'package:cenafood/ui/widgets/bottom_navbar.dart';
import 'package:cenafood/ui/widgets/bottom_navbar_2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NavigationProvider navigation =
        Provider.of<NavigationProvider>(context, listen: false);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            color: baseDarkColor,
          ),
          SafeArea(
            child: Stack(
              children: [
                Container(
                  color: baseDarkColor,
                ),
                PageView(
                  controller: navigation.pageIndex,
                  onPageChanged: (index) {
                    navigation.changeIndex(index);
                  },
                  children: [
                    ExploreScreen(),
                    OffersScreen(),
                    OffersScreen(),
                    UserProfileScreen(),
                  ],
                ),
                BottomNavbar(),
                //BottomNav2(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
