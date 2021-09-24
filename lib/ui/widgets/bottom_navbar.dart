import 'package:cenafood/shared/color.dart';
import 'package:cenafood/shared/font.dart';
import 'package:cenafood/shared/size.dart';
import 'package:cenafood/shared/style.dart';
import 'package:cenafood/states/provider/navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class BottomNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NavigationProvider navigation =
        Provider.of<NavigationProvider>(context, listen: false);

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: deviceWidth(context),
        height: 60,
        padding: EdgeInsets.symmetric(
          horizontal: 24,
        ),
        decoration: BoxDecoration(
          color: Colors.greenAccent, //accentColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildBottomNavBarItem(
              context,
              label: "Explore",
              icon: "assets/imgs/ic_explore.png",
              index: 0,
              onTap: () {
                navigation.changeIndex(0, initialPage: 0);
              },
            ),
            _buildBottomNavBarItem(
              context,
              label: "Offers",
              icon: "assets/imgs/ic_offers.png",
              index: 1,
              onTap: () {
                navigation.changeIndex(1, initialPage: 1);
              },
            ),
            _buildBottomNavBarItem(
              context,
              label: "Cart",
              icon: "assets/imgs/ic_cart.png",
              index: 2,
              onTap: () {
                navigation.changeIndex(2, initialPage: 2);
              },
            ),
            _buildBottomNavBarItem(
              context,
              label: "Profile",
              icon: "assets/imgs/ic_profile.png",
              index: 3,
              onTap: () {
                navigation.changeIndex(3, initialPage: 3);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavBarItem(BuildContext context,
      {required String label,
      required String icon,
      required int index,
      required Function onTap}) {
    NavigationProvider navigation =
        Provider.of<NavigationProvider>(context, listen: false);
    print("Nav.Index = " + navigation.index.toString());
    print("Button.index = " + index.toString());
    return (navigation.index == index)
        ? Container(
            padding: EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              color: blackColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              children: [
                Image.asset(
                  icon,
                  width: 26,
                  height: 26,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  label,
                  style: mediumBaseFont.copyWith(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          )
        : ButtonTheme(
            minWidth: 50,
            height: 50,
            padding: EdgeInsets.zero,
            child: ElevatedButton(
              style: flatButtonStyle,
              child: Image.asset(
                icon,
                width: 26,
                height: 26,
              ),
              onPressed: () => {onTap},
            ),
          );
  }
}
