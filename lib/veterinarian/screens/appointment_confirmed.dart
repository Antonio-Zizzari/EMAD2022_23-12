import 'package:flutter/material.dart';
import 'package:justpet/global/models/color.dart';

class AppointmentSuccess extends StatefulWidget {
  const AppointmentSuccess({ Key? key}) : super(key: key);

  @override
  _AppointmentSuccessState createState() => _AppointmentSuccessState();
}

class _AppointmentSuccessState extends State<AppointmentSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.all(40.0),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network('https://ouch-cdn2.icons8.com/7fkWk5J2YcodnqGn62xOYYfkl6qhmsCfT2033W-FjaA/rs:fit:784:784/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvMjU5/LzRkM2MyNzJlLWFh/MmQtNDA3Ni04YzU0/LTY0YjNiMzQ4NzQw/OS5zdmc.png',
                width: 250,),
              SizedBox(height: 50.0,),
              Text('Prenotazione avvenuta\ncon successo! 🥳', textAlign: TextAlign.center, style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold,),),
              SizedBox(height: 20.0,),
              Text('Evviva! La tua prenotazione è stata \n completata con successo!', textAlign: TextAlign.center, style: TextStyle(fontSize: 16.0, color: Colors.grey.shade700),),
              SizedBox(height: 140.0,),
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                height: 50,
                elevation: 0,
                splashColor: Colors.yellow[700],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
                color: kPrimaryColor,
                child: Center(
                  child: Text("Torna indietro", style: TextStyle(color: Colors.white, fontSize: 16),),
                ),
              ),
              SizedBox(height: 20.0,),
              Text('Grazie per aver prenotato con JustPet.', style: TextStyle(fontSize: 14.0, color: Colors.grey),),
            ],
          ),
        )
    );
  }
}
