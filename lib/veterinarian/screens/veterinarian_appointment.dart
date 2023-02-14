import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:justpet/customer/models/Veterinario.dart';
import 'package:justpet/customer/models/cliente.dart';
import 'package:justpet/veterinarian/models/event_class.dart';
import 'package:justpet/customer/screens/select_animal.dart';
import 'package:justpet/global/models/color.dart';
import 'package:justpet/global/components/appbar.dart';
import 'package:justpet/global/components/SideMenu.dart';
import 'package:justpet/veterinarian/components/flutter_event_calendar.dart';
import 'package:flutter_calendar_week/flutter_calendar_week.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:justpet/customer/models/pet_class.dart';

import 'appointment_confirmed.dart';

class VeterinarianAppointment extends StatefulWidget {
  final Veterinario veterinario;
  const VeterinarianAppointment({Key? key, required this.veterinario}) : super(key: key);
  @override
  State<VeterinarianAppointment> createState() => _VeterinarianAppointmentState(veterinario);
}               

class _VeterinarianAppointmentState extends State<VeterinarianAppointment> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final user = FirebaseAuth.instance.currentUser!;
  late Cliente cliente;
  final CalendarWeekController _controller = CalendarWeekController();
  final Veterinario veterinario;
  Pets? pet = null;
  String turnoSelezionato="";
  DateTime giornoSelezionato=DateTime.now();
  var selezionato=List.generate(turni.length, (index) => false);
  var date = DateTime.now().year.toString()+DateTime.now().month.toString()+DateTime.now().day.toString()+"05:00";
  int precedente=0;
  bool oggi_selezionato=true;
  bool isWeekend=false;

  _VeterinarianAppointmentState(this.veterinario);

  @override
  Widget build(BuildContext context) {
    var prenotato=veterinario.prenotazioni;
    getClienteFromFirestore(user.email!).then((value) => cliente=value);
    initializeDateFormatting("it_IT", null).then((_) {});
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.white,
        title: Text(
          "Prenota appuntamento",
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
      ),

      //backgroundColor: kTertiaryColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: double.infinity,
              child: CalendarWeek(
                  controller: _controller,
                  height: 100,
                  showMonth: true,
                  //dayOfWeekStyle: TextStyle(color: Colors.black),
                  //dateStyle: TextStyle(color: Colors.black),
                  todayBackgroundColor: oggi_selezionato ? Colors.blue :Colors.transparent,
                  dayOfWeek: ['LUN', 'MAR', 'MER', 'GIO', 'VEN', 'SAB', 'DOM'],
                  minDate: DateTime.now(),
                  maxDate: DateTime.now().add(
                    Duration(days: 20),
                  ),
                  onDatePressed: (DateTime datetime) {
                    // Do something
                    setState(() {
                      if(datetime.weekday == DateTime.saturday || datetime.weekday == DateTime.sunday) {
                        isWeekend = true;
                      } else {
                        isWeekend = false;
                      }
                      date=datetime.year.toString()+datetime.month.toString()+datetime.day.toString()+"05:00";
                      giornoSelezionato = datetime;
                      selezionato=List.filled(turni.length, false);
                      if (datetime.day==DateTime.now().day){
                        oggi_selezionato=true;
                      }
                      else {
                        oggi_selezionato=false;
                      }
                    });
                  },
                  onDateLongPressed: (DateTime datetime) {
                    // Do something
                  },
                  onWeekChanged: () {
                    // Do something
                  },
                  monthViewBuilder: (DateTime time) => Align(
                    alignment: FractionalOffset.center,
                    child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          DateFormat.yMMMM('it_IT').format(time).toUpperCase(),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.w600),
                        )),
                  ),
                  decorations: [
                  DecorationItem(
                  decorationAlignment: FractionalOffset.bottomRight,
                  date: DateTime.now(),
                  decoration: Icon(
                    Icons.today,
                    color: oggi_selezionato ? Colors.white : Colors.blue,
                  )),
              /*DecorationItem(
                  date: DateTime.now().add(Duration(days: 3)),
                  decoration: Text(
                    'Holiday',
                    style: TextStyle(
                      color: Colors.brown,
                      fontWeight: FontWeight.w600,
                    ),
                  )),*/
              ]),
            ),
            !isWeekend ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Mattina', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                  SizedBox(height: 20,),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: (veterinario.turni.length~/3)+1,
                    itemBuilder: (context, index){
                      List<Widget> l = [];
                      var pomeriggio=false;
                      index=index*3;
                      if(index<veterinario.turni.length) {
                        for (int i = index; i < index + 3 && i<veterinario.turni.length; i++) {
                          funzione1(){
                            setState(() {
                              date=date.substring(0, date.length-5) + veterinario.turni[i];
                              giornoSelezionato=DateTime.utc(giornoSelezionato.year, giornoSelezionato.month, giornoSelezionato.day, int.parse(veterinario.turni[i].substring(0,2)), int.parse(veterinario.turni[i].substring(3,5)));
                              // print(date.substring(date.length-5));
                              // print(veterinario.prenotazioni);
                              turnoSelezionato=veterinario.turni[i];
                              if (precedente!=i) selezionato[precedente]=false;
                              if(selezionato[i] == false){
                                // print(selezionato[i].toString()+ " è diventato true e la i è "+i.toString());
                                selezionato[i]=true;
                              }else{
                                // print(selezionato[i].toString()+ " è diventato false e la i è "+i.toString());
                                selezionato[i]=false;
                              }
                              precedente=i;
                          });}
                          if(veterinario.turni[i] == '00:00'){
                            pomeriggio=true;
                            l.add(pulsante_invisibile("", i));
                          } else {
                            String today= DateTime.now().year.toString()+DateTime.now().month.toString()+DateTime.now().day.toString();
                            pomeriggio=false;

                            l.add(TextButton(
                              style: veterinario.prenotazioni.contains(date.substring(0, date.length-5) + veterinario.turni[i]) || (today==date.toString().substring(0, date.length-5) && DateTime.now().hour >= int.parse(veterinario.turni[i].substring(0, 2))) ? TextButton.styleFrom(
                                backgroundColor: Colors.grey[100],
                                foregroundColor: Colors.black26,
                                fixedSize: Size(110, 45),
                              ) : TextButton.styleFrom(
                                backgroundColor: selezionato[i] ? Colors
                                    .blue[200] : Colors.grey[200],
                                foregroundColor: Colors.black87,
                                fixedSize: Size(110, 45),
                              ),
                              onPressed: veterinario.prenotazioni.contains(date.substring(0, date.length-5) + veterinario.turni[i]) ? null : funzione1,
                              child: Text(veterinario.turni[i], style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                            ));
                          }
                          l.add(Spacer());
                        }
                      }
                      /*else {
                        for (int i = index; i < veterinario.turni.length; i++) {
                          l.add(pulsante(veterinario.turni[i],i));
                          l.add(SizedBox(width: 10,));
                        }
                      }*/
                      return pomeriggio ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: l.map((e) => e).toList()
                          ),
                          SizedBox(height: 20,),
                          Text('Pomeriggio',
                            style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          SizedBox(height: 20,),
                        ],
                      ):
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: l.map((e) => e).toList()
                      );
                    },
                  ),
                  SizedBox(height: 20,),
                  /*Text('Pomeriggio', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                  SizedBox(height: 20,),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: (turni_pom.length~/3)+1,
                    itemBuilder: (context, index){
                      return lista(turni_pom, index);
                    },
                  ),
                  SizedBox(height: 20,),*/
                  Text('Prenota per',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black87)
                    ),
                    child: InkWell(
                      onTap: () async{
                        pet = await Navigator.push(context, MaterialPageRoute(builder: (context) => const SelectAnimal()),);
                        setState(() {
                          pet = pet;
                        });
                        print("result = "+(pet != null ? pet!.nome : "niente"));
                      },
                      child: Row(
                        children: [
                          CircleAvatar(foregroundImage: AssetImage(pet!= null ? pet!.pathImage : "assets/images/question_mark.png"), radius: 20,),
                          SizedBox(width: 10,),
                          Text(pet != null ? pet!.nome : "Scegli un animale" ),
                          Spacer(),
                          Icon(Icons.navigate_next),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text('Descrizione (facoltativo)',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 20,),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: TextField(
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 5,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: 'Inserisci una descrizione',
                      fillColor: Colors.white),
                ),
              ),
                  SizedBox(height: 20,),
                  ElevatedButton(
                    onPressed: (){
                      if (pet!= null && selezionato.contains(true)) {
                        Evento evento = Evento(
                          nome_cliente: cliente.nome+" "+cliente.cognome,
                          nome_dottore: veterinario.nome,
                          email_cliente: cliente.email,
                          email_dottore: veterinario.email,
                          nome_animale: pet!.nome,
                          razza_animale: pet!.tipoAnimale,
                          anno: giornoSelezionato.year.toString(),
                          mese: giornoSelezionato.month.toString(),
                          giorno: giornoSelezionato.day.toString(),
                          ora: giornoSelezionato.hour.toString(),
                          minuto: giornoSelezionato.minute.toString().length==1 ? "0"+giornoSelezionato.minute.toString() : giornoSelezionato.minute.toString(),
                          tipoOperazione: "visita",
                        );
                        updateVeterinario(veterinario, date);
                        setEventoToFirestore(evento);
                        //pet!.visiteAnnuali[giornoSelezionato.year.toString()]![giornoSelezionato.month.toString()]!.add(evento.toFirestore());
                        updateAnimaleOnFirestore(pet!, evento);
                        Navigator.pushReplacement(context,
                          MaterialPageRoute(
                            builder: (context) => AppointmentSuccess(),
                          ),
                        );
                      }
                      else{
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.white,
                            elevation: 25.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                side: BorderSide(
                                  color: kPrimaryColor,
                                  width: 2,
                                )
                            ),
                            content: Row(children: [
                              Icon(Icons.error, color: kPrimaryColor,),
                              SizedBox(width: 5,),
                              Text(selezionato.contains(true) ? "Devi scegliere un animale per proseguire" : "Devi scegliere un turno per proseguire",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                ),
                              )
                            ],
                            )));
                      }
                      },
                    child: Text('Prenota ora'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        fixedSize: Size(500, 40)
                    ),
                  ),
                ],
              ),
            ) :
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.highlight_remove, size: 50, color: kPrimaryColor,),
                  Text('Nessuna turno prenotabile',
                      style: TextStyle(
                          fontSize: 21, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

bool updateVeterinario(Veterinario veterinario, String prenotazione){
  if(prenotazione.isNotEmpty) {
    print("Prenotazione: "+prenotazione);
    updateVeterinarioOnFirestore(veterinario, prenotazione);
    return true;
  }
  return false;
}

Widget pulsante_invisibile (String text, index) {
  return TextButton(
    style: TextButton.styleFrom(
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.transparent,
      fixedSize: Size(110, 45),
    ),
    onPressed: null,
    child: Text(
        text, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
  );
}

Widget pulsante (String text, index){
  return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.grey[200],
        foregroundColor: Colors.black87,
        fixedSize: Size(110, 45),
      ),
      onPressed: () {},
      child: Text(text, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
  );
  /*return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: InkWell(
      onTap: (){
        turni.values.toList()[last_index]=false;
        turni.values.toList()[index]=true;
        last_index=index;
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        height: 45,
        width: 110,
        child: Text(text, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
      ),
    ),
  );*/
}

Widget lista (List<String> turni, int index){
  List<Widget> l = [];
  index=index*3;
  if(index<turni.length-3) {
    for (int i = index; i < index + 3; i++) {
      l.add(pulsante(turni[i], i));
      l.add(Spacer());
    }
  }
  else {
    for (int i = index; i < turni.length; i++) {
      l.add(pulsante(turni[i],i));
      l.add(SizedBox(width: 10,));
    }
  }
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: l.map((e) => e).toList()
  );
}

int last_index=0;
//aggiungi un bank
List<String> turni = ['09:00','09:15','09:30','09:45',
  '10:00','10:15','10:30','10:45',
  '11:00','11:15','11:30','11:45',
  '12:00','12:15','12:30','12:45',
  '13:00','00:00','16:00','16:15','16:30',
  '16:45','17:00','17:15','17:30',
  '17:45','18:00','18:15','18:30',
  '18:45','19:00',];

List<String> turni_pom = ['16:00','16:15','16:30',
  '16:45','17:00','17:15','17:30',
  '17:45','18:00','18:15','18:30',
  '18:45','19:00',];
/*
List<String> turni_pom = ['9:00','9:15','9:30','9:45',
  '10:00','10:15','10:30','10:45',
  '11:00','11:15','11:30','11:45',
  '12:00','12:15','12:30','12:45',
  '13:00','16:00','16:15','16:30',
  '16:45','17:00','17:15','17:30',
  '17:45','18:00','18:15','18:30',
  '18:45','19:00',];*/
