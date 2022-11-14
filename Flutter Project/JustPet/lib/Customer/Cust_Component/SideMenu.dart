import 'package:flutter/material.dart';
import 'package:test1/Customer/Pages/ListaVeterinari.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(foregroundImage: AssetImage('assets/images/dog.jpg',), radius: 50,),
                Text(
                  'Vittorio',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ],
            ),
            decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                    fit: BoxFit.fill)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text('Funzioni', style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(4.0, 8.0, 20.0, 4.0),
            child: Material(
              elevation: 5,
              child: MaterialButton(
                onPressed: (){},
                child: Row(
                  children: [
                    Icon(Icons.pets),
                    Text('Scheda animali'),
                    Spacer(),
                    Icon(Icons.navigate_next, size: 30,),
                  ],
              ),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(4.0, 8.0, 20.0, 4.0),
            child: Material(
              elevation: 5,
              child: MaterialButton(
                onPressed: (){},
                child: Row(
                  children: [
                    Icon(Icons.search_sharp),
                    Text('Cerca veterinari'),
                    Spacer(),
                    Icon(Icons.navigate_next, size: 30,),
                  ],
                ),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(4.0, 8.0, 20.0, 4.0),
            child: Material(
              elevation: 5,
              child: MaterialButton(
                onPressed: (){},
                child: Row(
                  children: [
                    Icon(Icons.video_collection),
                    Text('Video corsi'),
                    Spacer(),
                    Icon(Icons.navigate_next, size: 30,),
                  ],
                ),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(4.0, 8.0, 20.0, 4.0),
            child: Material(
              elevation: 5,
              child: MaterialButton(
                onPressed: (){},
                child: Row(
                  children: [
                    Icon(Icons.shopping_bag),
                    Text('Acquista Prodotti'),
                    Spacer(),
                    Icon(Icons.navigate_next, size: 30,),
                  ],
                ),),
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 1,
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text('Altro', style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(4.0, 4.0, 20.0, 4.0),
            child: Material(
              elevation: 5,
              child: MaterialButton(
                onPressed: (){},
                child: Row(
                  children: [
                    Icon(Icons.exit_to_app),
                    Text('Logout'),
                    Spacer(),
                    Icon(Icons.navigate_next, size: 30,),
                  ],
                ),),
            ),
          ),

        ],
      ),
    );
  }
}