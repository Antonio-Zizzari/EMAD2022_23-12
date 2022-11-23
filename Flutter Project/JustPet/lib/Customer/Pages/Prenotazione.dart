import 'package:flutter/material.dart';
import 'package:justpet/Customer/Cust_Component/Veterinario.dart';
import 'package:justpet/Customer/Cust_Component/AppBarVeterinario.dart';

class Prenotazione extends StatefulWidget {

  final Veterinario veterinario;
  Prenotazione({required this.veterinario});

  @override
  State<Prenotazione> createState() => _PrenotazioneState();
}

class _PrenotazioneState extends State<Prenotazione> {

  List<Map<String, String>> date = [{'data': '7 Nov', 'giorno':'Lun'}, {'data': '8 Nov', 'giorno':'Mar'}, {'data': '9 Nov', 'giorno':'Mer'}, {'data': '10 Nov', 'giorno':'Gio'}, {'data': '11 Nov', 'giorno':'Ven'}, {'data': '12 Nov', 'giorno':'Sab'}, {'data': '13 Nov', 'giorno':'Dom'}];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarVeterinario(title: 'Prenota', showSearch: false,),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Material(
              elevation: 4,
              clipBehavior: Clip.antiAlias,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/${widget.veterinario.immagine}',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                '${widget.veterinario.nome}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),
              ),
            ),
            SizedBox(height: 5,),
            Text(
              '${widget.veterinario.descrizione}',
              style: TextStyle(fontSize: 14, color: Colors.grey,),),
            SizedBox(height: 15,),
            Text('Scegli data'),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: date.map((e) => BoxData(data: e['data'], giorno: e['giorno'])).toList()
              ),
            ),
            SizedBox(height: 10,),
            Text('Scegli orario'),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: widget.veterinario.turni.map((e) => BoxTurni(turno: e)).toList()
              ),
            ),
            SizedBox(height: 25),
            const Padding(
              padding: EdgeInsets.only(bottom: 4.0),
              child: Text('Metodo di pagamento'),
            ),
            InkWell(
              onTap: (){},
              child: Container(
                height: 40,
                decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(5.0)),
                child: Row(
                  children: const [
                    SizedBox(width: 5,),
                    Icon(Icons.credit_card),
                    SizedBox(width: 5,),
                    Text(
                        'Carta di credito'
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_sharp,
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            Row(
              children: [
                Text('Prezzo totale: '),
                Spacer(),
                Text('€15.00')
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(12.0,0.0,12.0,12.0),
        child: ElevatedButton(
          onPressed: (){},
          child: Text(
              'Prenota'
          ),
        ),
      ),
    );
  }
}

class BoxTurni extends StatefulWidget{

  final String turno;

  const BoxTurni({required this.turno});

  @override
  State<BoxTurni> createState() => _BoxTurniState();
}

class _BoxTurniState extends State<BoxTurni> {

  Color? color = Colors.grey[200];
  bool active = false;

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () {
        setState(() {
          if (color == Colors.grey[200]) color=Colors.blue;
          else color=Colors.grey[200];
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 90,
          child: Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Column(
                  children: [
                    const Text('Ore:'),
                    Text(widget.turno)
                  ],
                )
            ),
          ),
        ),
      ),
    );
  }
}

class BoxData extends StatefulWidget{

  final String? data;
  final String? giorno;

  const BoxData({required this.data, required this.giorno});

  @override
  State<BoxData> createState() => _BoxDataState();
}

class _BoxDataState extends State<BoxData> {

  Color? color = Colors.grey[200];
  bool active = false;

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () {
        setState(() {
          if (color == Colors.grey[200]) color=Colors.blue;
          else color=Colors.grey[200];
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 90,
          child: Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Column(
                  children: [
                    Text(widget.giorno?? 'data'),
                    Text(widget.data?? 'giorno')
                  ],
                )
            ),
          ),
        ),
      ),
    );
  }
}