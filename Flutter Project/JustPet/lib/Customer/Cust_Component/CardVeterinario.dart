import 'package:flutter/material.dart';
import 'Veterinario.dart';
import 'package:test1/Customer/Pages/Prenotazione.dart';

class CardVeterinario extends StatelessWidget {
  final Veterinario veterinario;

  const CardVeterinario({required this.veterinario});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0)
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Prenotazione(
                        veterinario: veterinario
                    )
                )
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset(
                'assets/images/${veterinario.immagine}',
                fit: BoxFit.fill,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 8.0, 0.0, 8.0),
                    child: SizedBox(
                      width: 230,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 2.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              veterinario.nome,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'WorkSans'),
                            ),
                            SizedBox(width: 20,),
                            Text(
                              veterinario.indirizzo,
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey[500], fontFamily: 'WorkSans'),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 16,
                                  color: Colors.yellow[600],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(veterinario.votazione, style: TextStyle(fontFamily: 'WorkSans'),),
                                ),
                              ],
                            )
                            //Text(veterinario.votazione, style: TextStyle(fontSize: 16, color: Colors.grey[750]),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Text('Primo turno:'),
                            Text(veterinario.turni[0])
                          ],
                        )),
                  ),
                ],
              ),
              //ElevatedButton(onPressed: () {}, child: Text('Prenota'))
            ],
          ),
        ),
      ),
    );
  }
}