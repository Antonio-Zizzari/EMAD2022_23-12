import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:justpet/Customer/Cust_Component/AppBarVeterinario.dart';
import 'package:justpet/Customer/Category.dart';
import 'package:justpet/Customer/Pages/DettagliVideoCorso.dart';
import 'package:justpet/Customer/Cust_Component/SideMenu.dart';
import 'package:justpet/global_models/appbar.dart';

class VideoCorsi extends StatelessWidget {

  List<Color?> colors = [Colors.cyan[50], Colors.amber[50], Colors.red[50], Colors.green[50]];
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: MainAppBar(_scaffoldKey)/*AppBarVeterinario(
        title: 'Prenotazioni',
        showSearch: false,
      )*/,
      drawer: SideMenu(),
      body: Padding(
        padding: EdgeInsets.only(left: 20, top: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Ciao Andrea, ",
                style: TextStyle(
                fontSize: 28,
                color: Color(0xFF0D1333),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text("Scopri un nuovo corso da imparare!",
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF0D1333),
                // fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F7),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                children: <Widget>[
                  Icon(Icons.search),
                  SizedBox(width: 16, height: 1,),
                  Text(
                    "Cerca corso",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFFA0A5BD),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Categorie",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFFA0A5BD),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                /*Text(
                  "Vedi tutti",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF0D1333),
                    // fontWeight: FontWeight.bold,
                  ).copyWith(color: Color(0xFF6E8AFA)),
                ),*/
              ],
            ),
            SizedBox(height: 30),
            Expanded(
              child: MasonryGridView.count(
                crossAxisCount: 2,
                itemCount: categories.length,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DettagliVideoCorso(),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      height: index.isEven ? 200 : 240,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: colors[index],
                        image: DecorationImage(
                          image: AssetImage(categories[index].image),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            categories[index].name,
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF0D1333),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${categories[index].numOfCourses} corsi',
                            style: TextStyle(
                              color: Color(0xFF0D1333).withOpacity(.5),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}