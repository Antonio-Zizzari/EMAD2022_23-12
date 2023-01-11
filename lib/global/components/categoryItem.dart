import 'package:flutter/material.dart';
import 'package:justpet/global/models/color.dart';


class CategoryItem extends StatelessWidget {
  final String title;
  bool isActive;
  final VoidCallback press;
  CategoryItem({
    Key? key,
    required this.title,
    this.isActive = false,
    required this.press,
  }) : super(key: key);


@override
Widget build(BuildContext context) {
  return GestureDetector(
    onTap: press,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: isActive
                ? TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            )
                : TextStyle(fontSize: 12),
          ),
          if (isActive)
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              height: 3,
              width: MediaQuery.of(context).size.width/2,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
            )
          else
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              height: 3,
              width: MediaQuery.of(context).size.width/2,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
        ],
      ),
    ),
  );
}
}