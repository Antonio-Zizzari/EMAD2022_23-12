import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:justpet/customer/screens/ListaVeterinari.dart';
import 'package:justpet/global/screens/login_page.dart';

class Welcome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/welcome_background.png'),
                      fit: BoxFit.cover
                  )
              ),
              child: Center(
                child: CircularProgressIndicator()
              )
            );
          } else if(snapshot.hasError){
            return Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/welcome_background.png'),
                      fit: BoxFit.cover
                  )
              ),
              child: Center(
                child: Text("Qualcosa è andato storto!")
              )
            );
          } else if(snapshot.hasData){
            return ListaVeterinari();
          } else {
            return Login();
          }
        },
      ),
    );
  }
}

// Widget mainPage (BuildContext context){
//   return SafeArea(
//     child: Container(
//       decoration: BoxDecoration(
//           image: DecorationImage(
//               image: AssetImage('assets/images/welcome_background.png'),
//               fit: BoxFit.cover
//           )
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Text('Benvenuto su JustPet', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
//           Image.asset('assets/logo/logo.png', ),
//           SizedBox(
//             width: 300,
//             height: 50,
//             child: ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => Login())
//                 );
//               },
//               child: Text("ACCEDI"),
//               style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
//                   shape: MaterialStateProperty.all(
//                     RoundedRectangleBorder(
//                       // Change your radius here
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                   )
//               ),
//             ),
//           ),
//           SizedBox(height: 20,),
//           SizedBox(
//             width: 300,
//             height: 50,
//             child: ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => Register())
//                 );
//               },
//               child: Text("REGISTRATI"),
//               style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.all<Color>(kTertiaryColor),
//                   shape: MaterialStateProperty.all(
//                     RoundedRectangleBorder(
//                       // Change your radius here
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                   )
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }