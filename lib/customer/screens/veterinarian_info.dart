import 'package:flutter/material.dart';
import 'package:justpet/customer/models/Veterinario.dart';
import 'package:justpet/global/components/appbar.dart';
import 'package:justpet/global/components/SideMenu.dart';
import 'package:justpet/global/models/color.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:justpet/veterinarian/screens/veterinarian_appointment.dart';

class VeterinarianInfo extends StatelessWidget {
  final Veterinario veterinario;
  VeterinarianInfo({Key? key, required this.veterinario}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(veterinario.nome,
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomLeft,
                clipBehavior: Clip.none,
                children: [
                  Image.asset('assets/images/${veterinario.immagine}' ),
                  FractionalTranslation(
                    translation: Offset(-0.35, 0.4),
                    child: Align(
                      child: CircleAvatar(
                        foregroundImage: AssetImage(
                            'assets/images/'+veterinario.immagine_profilo),
                        radius: 50,),
                      alignment: FractionalOffset(0.5, 0.0),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40,),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${veterinario.nome}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                      Text('${veterinario.indirizzo}', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  Spacer(),
                  FavoriteButton(valueChanged: (){}),
                ],
              ),
              SizedBox(height: 20,),
              ElevatedButton.icon(onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VeterinarianAppointment(veterinario: veterinario),
                  ),
                );
              }, icon: Icon(Icons.calendar_month), label: Text('Prenota'), style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor, fixedSize: Size(500, 45), textStyle: TextStyle(fontSize: 16)),),
              SizedBox(height: 10,),
              Divider(thickness: 1.5, color: kPrimaryColor,),
              SizedBox(height: 10,),
              Row(
                children: [
                  Text('${veterinario.votazione} ', style: TextStyle(fontSize: 16,)),
                  Icon(Icons.star, color: Colors.yellow[700],),
                  Icon(Icons.star, color: Colors.yellow[700],),
                  Icon(Icons.star, color: Colors.yellow[700],),
                  Icon(Icons.star, color: Colors.yellow[700],),
                  Icon(Icons.star_half, color: Colors.yellow[700],),
                  Spacer(),
                  Text('600 recensioni   ', style: TextStyle(fontSize: 16,)),
                  InkWell(
                    onTap: (){},
                    child: Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        color: Colors.black,
                          shape: BoxShape.circle
                      ),
                        child: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 20,),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Divider(thickness: 1.5, color: kPrimaryColor,),
              Text('Descrizione', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              SizedBox(height: 10,),
              Text('${veterinario.descrizione}', style: TextStyle(fontSize: 16), textAlign: TextAlign.justify,),
              SizedBox(height: 10,),
              Divider(thickness: 1.5, color: kPrimaryColor,),
              SizedBox(height: 10,),
              Text('Orario di lavoro', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              SizedBox(height: 10,),
              Column(
                children: [
                  Row(children: [Text('Lunedi',style: TextStyle(fontSize: 16),), Spacer(), Text('9:00 -13:00',style: TextStyle(fontSize: 16),)],),
                  SizedBox(height: 5,),
                  Row(children: [Text('Martedi',style: TextStyle(fontSize: 16),), Spacer(), Text('9:00 -13:00',style: TextStyle(fontSize: 16),)],),
                  SizedBox(height: 5,),
                  Row(children: [Text('Mercoledi',style: TextStyle(fontSize: 16),), Spacer(), Text('9:00 -13:00',style: TextStyle(fontSize: 16),)],),
                  SizedBox(height: 5,),
                  Row(children: [Text('Giovedi',style: TextStyle(fontSize: 16),), Spacer(), Text('9:00 -13:00',style: TextStyle(fontSize: 16),)],),
                  SizedBox(height: 5,),
                  Row(children: [Text('Venerdi',style: TextStyle(fontSize: 16),), Spacer(), Text('9:00 -13:00',style: TextStyle(fontSize: 16),)],),
                  SizedBox(height: 5,),
                  Row(children: [Text('Sabato',style: TextStyle(fontSize: 16),), Spacer(), Text('chiuso',style: TextStyle(fontSize: 16),)],),
                  SizedBox(height: 5,),
                  Row(children: [Text('Domenica',style: TextStyle(fontSize: 16),), Spacer(), Text('chiuso',style: TextStyle(fontSize: 16),)],),
                  SizedBox(height: 10,),
                ],
              ),
              Divider(thickness: 1.5, color: kPrimaryColor),
              SizedBox(height: 10,),
              Row(
                children: [
                  Container(),
                  Text('Pagamenti accettati', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  Spacer(),
                  Row(children: [Icon(Icons.money), SizedBox(width: 5,), Text('Paga in contanti')],)
                ],
              ),
              SizedBox(height: 10,),
              Divider(thickness: 1.5, color: kPrimaryColor),
              ],
          ),
        ),
      ),
    );
  }
}
