import 'package:cenafood/ui/widgets/base_button.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final Widget leading, trailing, child;
  final String title;
  final double height, childHeight;
  final bool isBig;

  const CustomAppBar({
    required Key key,
    this.leading = const SizedBox(height: 10),
    this.trailing = const SizedBox(height: 10),
    this.title = "",
    this.height = 10.0,
    this.childHeight = 10.0,
    this.isBig = false,
    this.child = const SizedBox(height: 10),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: _AppBarClipper(childHeight: childHeight, isBig: isBig),
          child: Container(
            padding: const EdgeInsets.only(top: 48),
            color: Theme.of(context).primaryColor,
            height: height,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                leading,
                BaseButton(
                  onPressed: null,
                  height: 2.0,
                  width: 4.0,
                  child: Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ),
                ),
                trailing
              ],
            ),
          ),
        ),
        Positioned(
          bottom: childHeight / 2,
          left: 0,
          right: 0,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: child,
          ),
        ),
      ],
    );
  }
}

class _AppBarClipper extends CustomClipper<Path> {
  final bool isBig;
  final double childHeight;

  _AppBarClipper({required this.isBig, required this.childHeight});

  @override
  Path getClip(Size size) {
    double height = isBig ? size.height - childHeight : size.height;
    Path path = Path();

    path.moveTo(0, height - 40);
    path.quadraticBezierTo(size.width / 2, height, size.width, height - 40);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
