import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final Function(String query) queryFunction;
  final String hintText;
  const SearchBarWidget({Key? key, required this.queryFunction, required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            child: TextField(
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.search, color: Colors.black),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none
                ),
                hintText: hintText,
                hintStyle: TextStyle(fontSize: 14, color: Colors.black),
              ),
              onChanged: (String query) {
                queryFunction(query);
              },
            ),
          ),
        ),
        Container(
          height: 50,
          width: 50,
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.filter_list, color: Colors.black, size: 30,),
          ),
        ),
        SizedBox(width: 10),
      ],
    );
  }
}
