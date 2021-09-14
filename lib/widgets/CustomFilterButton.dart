import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final String title;
  final bool isSelected;

  const FilterButton(
      {required Key key, required this.title, required this.isSelected})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: isSelected ? Colors.green : Colors.white, // background
          // onPrimary: Colors.yellow, // foreground
        ),
        //style: ButtonStyle(backgroundColor: isSelected ? Colors.green : Colors.white ),
        //borderSide: BorderSide(color: Colors.green),
        child: Text(title,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.green,
            )),
      ),
    );
  }
}
