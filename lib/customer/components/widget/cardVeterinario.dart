import 'package:flutter/material.dart';
import 'package:justpet/global/models/color.dart';
import 'package:justpet/customer/models/Veterinario.dart';
//import 'package:justpet/customer/screens/Prenotazione.dart';
import 'package:justpet/customer/screens/veterinarian_info.dart';
import 'package:justpet/veterinarian/screens/veterinarian_appointment.dart';

class cardVeterinario extends StatelessWidget {
  final Veterinario veterinario;
  final int maxTimes=3;

  const cardVeterinario({required this.veterinario});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: InkWell(
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => VeterinarianInfo(
                        veterinario: veterinario
                    )
                )
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(foregroundImage: AssetImage('assets/images/'+veterinario.immagine_profilo,), radius: 50,),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            premiumContainer('Annuncio'),
                            Text(veterinario.nome, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                            Text('Veterinario, Endocrinologo'),
                            reviewField(veterinario.votazione)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                richText(Icons.pin_drop, veterinario.indirizzo),
                SizedBox(height: 10,),
                richText(Icons.medical_information_outlined, 'Visita generica'),
                SizedBox(height: 10,),
                richText(Icons.calendar_month, 'Prossimo appuntamento: Ven, 17 Febbraio'),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 3.0, right: 15.0),
                  child:
                    veterinario.turni.length > 3 ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        clockContainer(context, veterinario, veterinario.turni[0]),
                        clockContainer(context, veterinario, veterinario.turni[1]),
                        clockContainer(context, veterinario, veterinario.turni[2]),
                        clockContainer(context, veterinario, 'Altro >')
                      ],
                    ): Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: veterinario.turni.length == 0 ?
                        [clockContainer(context, veterinario, 'Nessun turno disponibile')]
                        :
                        veterinario.turni.map((e) => clockContainer(context, veterinario, e)).toList()
                    )
                ),
                SizedBox(height: 10,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget richText(IconData icon, String text){
  return Text.rich(
    TextSpan(
      style: TextStyle(
        fontSize: 14,
      ),
      children: [
        WidgetSpan(
          child: Icon(icon),
        ),
        WidgetSpan(
          child: SizedBox(width: 5),
        ),
        TextSpan(
          text: text,
        )
      ],
    ),
  );
}

Widget premiumContainer(String text){
  return Container(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(text, style: TextStyle(fontWeight: FontWeight.bold),),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      color: Colors.yellow[100],

    ),
  );
}

Widget clockContainer(BuildContext context, Veterinario vet, String time){
  return InkWell(
    onTap: (){
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => VeterinarianAppointment(
                  veterinario: vet
              )
          )
      );
    },
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.red[100]
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(time, style: TextStyle(fontWeight: FontWeight.bold),),
      ),
    ),
  );
}

Widget reviewField(String vote){
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Icon(Icons.star),
      Icon(Icons.star),
      Icon(Icons.star),
      Icon(Icons.star),
      Icon(Icons.star),
      Text(vote+'/5,0'),
    ],
  );
}