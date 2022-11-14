import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: [
          Spacer(),
          Text("Io no pago affitto"),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: Image.asset("assets/icons/AppBarIcon.png"),
            color: Colors.black,
            iconSize: 40,
            ),


          //SizedBox(width: 150,),
          Row(
            children: [
              Stack(
                children: <Widget>[
                  // Stroked text as border.
                  Text(
                    'JustPet',
                    style: TextStyle(
                      fontSize: 30,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 6
                        ..color = Color(0xFFF03738)!,
                    ),
                  ),
                  // Solid text as fill.
                  Text(
                    'JustPet',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.grey[300],
                    ),
                  ),
                ],
              ),
              SizedBox(width: 15,),
              CircleAvatar(
                backgroundImage: AssetImage("assets/logo/logo.png"),
                backgroundColor: Colors.transparent,
                radius: 25,
              ),
            ],
          ),

        ],
      ),
    );
  }
}
