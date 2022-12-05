import 'package:flutter/material.dart';
import 'package:justpet/global/models/color.dart';
import 'package:justpet/customer/models/Veterinario.dart';
import 'package:justpet/customer/screens/Prenotazione.dart';

class cardVeterinario extends StatelessWidget {
  final Veterinario veterinario;

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
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0, top: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(foregroundImage: AssetImage('assets/images/user.png',), radius: 50,),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        premiumContainer('Premium Plus'),
                        Text(veterinario.nome, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                        Text('Veterinario, Endocrinologo'),
                        reviewField(veterinario.votazione)
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              richText(Icons.pin_drop, 'Via delle vigne 200, Roma'),
              SizedBox(height: 10,),
              richText(Icons.medical_information_outlined, 'Visita generica'),
              SizedBox(height: 10,),
              richText(Icons.calendar_month, 'Prossimo appuntamento: Lun, 5 Dicembre'),
              SizedBox(height: 10,),
              Row(
                children: [
                  clockContainer('10:45'),
                  Spacer(),
                  clockContainer('11:00'),
                  Spacer(),
                  clockContainer('11:15'),
                  Spacer(),
                  clockContainer('Altro >'),
                  Spacer(),
                ],
              ),
              SizedBox(height: 10,)
            ],
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
    color: Colors.red[100],
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(text),
    ),
  );
}

Widget clockContainer(String time){
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: Colors.red[200]
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(time),
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