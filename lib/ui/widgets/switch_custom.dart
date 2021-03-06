import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final String activeText, inactiveText;
  final Color activeThumbColor, inactiveThumbColor;
  final Color activeColor, inactiveColor;
  final double? thumbHeight;
  final double? borderWidth;
  final double? padding;
  final Color? activeBorderColor, inactiveBorderColor;
  final TextStyle? activeTextStyle, inactiveTextStyle;
  final bool? isOn;

  final duration = const Duration(milliseconds: 400);

  CustomSwitch({
    required Key key,
    this.activeText = "",
    this.inactiveText = "",
    this.activeThumbColor = Colors.blueAccent,
    this.inactiveThumbColor = Colors.greenAccent,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.greenAccent,
    this.activeTextStyle = const TextStyle(color: Colors.black),
    this.inactiveTextStyle = const TextStyle(color: Colors.black),
    this.thumbHeight = 4.0,
    this.borderWidth = 1.0,
    this.padding = 1,
    this.activeBorderColor = Colors.grey,
    this.inactiveBorderColor = Colors.grey,
    this.isOn = false,
  }) : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState(value: isOn!);
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool value = false;
  double switchWidth = 0.0, switchHeight = 0.0;

  _CustomSwitchState({required this.value});

  @override
  Widget build(BuildContext context) {
    switchWidth =
        (widget.thumbHeight! + widget.padding! * 2 + widget.borderWidth!) * 2.5;
    switchHeight =
        widget.thumbHeight! + widget.padding! * 2 + widget.borderWidth! * 2;

    return GestureDetector(
      onTap: () {
        setState(() {
          value = !value;
        });
      },
      child: AnimatedContainer(
        duration: widget.duration,
        width: switchWidth,
        height: switchHeight,
        padding: EdgeInsets.all(widget.padding!),
        decoration: BoxDecoration(
          border: Border.all(
            color: widget.inactiveBorderColor!,
            width: widget.borderWidth!,
          ),
          borderRadius: BorderRadius.circular(4),
          color: value ? widget.activeColor : widget.inactiveColor,
        ),
        child: Stack(
          children: <Widget>[
            AnimatedPositioned(
              duration: widget.duration,
              left: value
                  ? switchWidth -
                      widget.thumbHeight! -
                      widget.padding! * 2 -
                      widget.borderWidth! * 2
                  : 0,
              top: 0,
              height: widget.thumbHeight,
              child: Container(
                height: widget.thumbHeight,
                width: widget.thumbHeight,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: value
                        ? widget.activeBorderColor!
                        : widget.inactiveBorderColor!,
                    width: widget.borderWidth!,
                  ),
                  borderRadius: BorderRadius.circular(4),
                  color: value
                      ? widget.activeThumbColor
                      : widget.inactiveThumbColor,
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: Center(
                child: AnimatedOpacity(
                  duration: widget.duration,
                  opacity: value ? 1 : 0,
                  child: Text(
                    widget.activeText,
                    style: widget.activeTextStyle,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: Center(
                child: AnimatedOpacity(
                  duration: widget.duration,
                  opacity: value ? 0 : 1,
                  child: Text(
                    widget.inactiveText,
                    style: widget.inactiveTextStyle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
