import 'package:flutter/material.dart';
import 'package:justpet/Customer/Cust_Component/SideMenu.dart';

AppBar MainAppBar (GlobalKey<ScaffoldState> openDrawer) {
  return AppBar(
    shadowColor: Colors.white,
    backgroundColor: Colors.white,
    elevation: 0,
    leading: IconButton(
      onPressed: () {
        if(openDrawer.currentState!.isDrawerOpen){
          openDrawer.currentState!.closeDrawer();
          //close drawer, if drawer is open
        }else{
          openDrawer.currentState!.openDrawer();
          //open drawer, if drawer is closed
        }
      },
      icon: Image.asset("assets/icons/AppBarIcon.png"),
      color: Colors.black,
      iconSize: 40,
    ),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        /*IconButton(
          onPressed: () {
            if(openDrawer.currentState!.isDrawerOpen){
              openDrawer.currentState!.closeDrawer();
              //close drawer, if drawer is open
            }else{
              openDrawer.currentState!.openDrawer();
              //open drawer, if drawer is closed
            }
          },
          icon: Image.asset("assets/icons/AppBarIcon.png"),
          color: Colors.black,
          iconSize: 40,
        ),*/


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

            SizedBox(width: 10,),
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
