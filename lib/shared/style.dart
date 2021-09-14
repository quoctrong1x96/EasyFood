import 'package:flutter/material.dart';

ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.black87,
  primary: Colors.grey[300],
  minimumSize: Size(88, 36),
  elevation: 0,
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2)),
  ),
);

ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
  primary: Colors.black87,
  minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2)),
  ),
);
// .copyWith(
//   side: MaterialStateProperty.resolveWith<BorderSide>(
//     (Set<MaterialState> states) {
//       if (states.contains(MaterialState.pressed))
//         return BorderSide(
//           color: Theme.of(context).colorScheme.primary,
//           width: 1,
//         );
//       return null; // Defer to the widget's default.
//     },
//   ),
// );
ButtonStyle flatButtonStyle = ButtonStyle(
  foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
  overlayColor: MaterialStateProperty.resolveWith<Color?>(
    (Set<MaterialState>? states) {
      if (states!.contains(MaterialState.hovered))
        return Colors.blue.withOpacity(0.04);
      if (states.contains(MaterialState.focused) ||
          states.contains(MaterialState.pressed))
        return Colors.blue.withOpacity(0.12);
      return null; // Defer to the widget's default.
    },
  ),
);
