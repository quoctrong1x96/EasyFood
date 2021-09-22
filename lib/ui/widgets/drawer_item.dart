import 'package:cenafood/ui/widgets/base_button.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  static dynamic _onPressed() {}
  const DrawerItem(
      {required Key key, this.text = "", this.onPressed = _onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
      ),
      onPressed: onPressed,
      height: 1.5,
      width: 2.0,
    );
  }
}

class DrawerSubItem extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  static dynamic _onPressed() {}

  const DrawerSubItem(
      {required Key key, this.text = "", this.onPressed = _onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
      ),
      onPressed: onPressed,
      height: 1.5,
      width: 2.0,
    );
  }
}
