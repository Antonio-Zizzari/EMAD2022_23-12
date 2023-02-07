import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:justpet/customer/models/Veterinario.dart';
import 'package:justpet/global/components/SideMenu.dart';
import 'package:justpet/global/components/appbar.dart';
import 'package:justpet/global/models/color.dart';
import 'package:justpet/veterinarian/models/event_class.dart';

class MiePrenotazioni extends StatelessWidget {
  MiePrenotazioni({Key? key}) : super(key: key);
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: MainAppBar(scaffoldKey),
      drawer: SideMenu(),
      body: FutureBuilder(
        future: getAllEventiFromFirestore(user.email!, true),
        initialData: [evento],
        builder: (BuildContext context, AsyncSnapshot<List<Evento>> eventi) {
          if(!eventi.hasData){
            return Container();
            //caricamento
          }
          else{
            return SingleChildScrollView(
              child: Column(
                children: eventi.data!.map((e) => eventWidget(e)).toList(),
              ),
            );
          }
        },
      ),
    );
  }
}

Widget eventWidget(Evento evento){
  return Padding(
    padding: const EdgeInsets.fromLTRB(16.0, 6.0, 16.0, 6.0),
    child: Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.black
          ),
          borderRadius: BorderRadius.all(Radius.circular(25.0))

      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.calendar_month, size: 50,),
            SizedBox(width: 10,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(evento.nome_dottore, style: TextStyle(fontSize: 18),),
                Text(evento.anno.toString()+'/'+evento.mese.toString()+'/'+evento.giorno, style: TextStyle(fontSize: 14),),
              ],
            ),
            Spacer(),
            IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios)),
          ],
        ),
      ),
    ),
  );
}
