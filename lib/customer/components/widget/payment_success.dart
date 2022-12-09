import 'package:flutter/material.dart';
import 'package:justpet/customer/models/petshop_class.dart';

import '../petshop_products.dart';

class PaymentSuccess extends StatefulWidget {
  final PetShopClass data;
  const PaymentSuccess({ Key? key, required this.data}) : super(key: key);

  @override
  _PaymentSuccessState createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess> {
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
            Text('Pagamento avvenuto\ncon successo! 🥳', textAlign: TextAlign.center, style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold,),),
            SizedBox(height: 20.0,),
            Text('Evvai! Il tuo pagamento è stato \n completato con successo..', textAlign: TextAlign.center, style: TextStyle(fontSize: 16.0, color: Colors.grey.shade700),),
            SizedBox(height: 140.0,),
            MaterialButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PetShopProductsPage(data: widget.data)));
                },
                height: 50,
                elevation: 0,
                splashColor: Colors.yellow[700],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                color: Colors.yellow[800],
                child: Center(
                  child: Text("Torna alla home", style: TextStyle(color: Colors.white, fontSize: 16),),
                ),
              ),
            SizedBox(height: 20.0,),
            Text('Grazie per aver acquistato con JustPet.', style: TextStyle(fontSize: 14.0, color: Colors.grey),),
          ],
        ),
      )
    );
  }
}
