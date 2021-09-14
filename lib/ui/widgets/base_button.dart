import 'package:cenafood/shared/color.dart';
import 'package:cenafood/shared/style.dart';
import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  @required
  final double width;
  @required
  final double height;
  @required
  final Widget child;
  @required
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? margin;
  final Color? color;

  BaseButton({
    required this.width,
    required this.height,
    required this.child,
    required this.onPressed,
    this.margin,
    this.color = accentColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      child: ElevatedButton(
        style: raisedButtonStyle,
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
