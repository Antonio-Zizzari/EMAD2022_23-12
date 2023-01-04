import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:justpet/global/models/color.dart';
import 'package:justpet/theme/color.dart';
import 'package:justpet/global/screens/login_page.dart';

class Register extends StatefulWidget{
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();
  final nameController = TextEditingController();
  final surnameController = TextEditingController();

  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/welcome_background.png'),
              fit: BoxFit.cover
            )
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Benvenuto su JustPet', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                Image.asset('assets/logo/logo.png', scale: 2.5,),
                Text('Registrati', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                inputField('Nome', kTertiaryColor, nameController, false),
                SizedBox(height: 20,),
                inputField('Cognome', kTertiaryColor, surnameController, false),
                SizedBox(height: 20,),
                inputField('Email', kTertiaryColor, emailController, false),
                SizedBox(height: 25,),
                inputField('Password', kTertiaryColor, passwordController, true),
                SizedBox(height: 20,),
                inputField('Ripeti password', kTertiaryColor, repeatPasswordController, true),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Divider(
                    thickness: 1,
                    height: 30,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10,),
                SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if(!isEmail(emailController.text.trim())){
                        showDialog(
                            context: context,
                            builder: (_) {
                              return AlertDialog(
                                title: Text('L\'email inserita non è corretta.'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context, true), // passing true
                                    child: Text('Ok, ho capito'),
                                  ),
                                ],
                              );
                            }).then((exit) {
                          if (exit == null) {
                            return;
                          }
                          if (exit) {
                            return;
                          }
                        });
                      } else if((passwordController.text.trim().compareTo(repeatPasswordController.text.trim()) != 0) || passwordController.text.trim().isEmpty) {
                        showDialog(
                            context: context,
                            builder: (_) {
                              return AlertDialog(
                                title: Text('Le password non coincidono'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context, true), // passing true
                                    child: Text('Ok, ho capito'),
                                  ),
                                ],
                              );
                            }).then((exit) {
                          if (exit == null) {
                            return;
                          }
                          if (exit) {
                            return;
                          }
                        });
                      } else if(passwordController.text.trim().length < 6){
                        showDialog(
                            context: context,
                            builder: (_) {
                              return AlertDialog(
                                title: Text('La password deve avere almeno 6 caratteri.'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context, true), // passing true
                                    child: Text('Ok, ho capito'),
                                  ),
                                ],
                              );
                            }).then((exit) {
                          if (exit == null) {
                            return;
                          }
                          if (exit) {
                            return;
                          }
                        });
                      } else {
                        signUp(context, emailController, passwordController, nameController, surnameController);
                      }
                    },
                    child: Text("REGISTRATI"),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            // Change your radius here
                            borderRadius: BorderRadius.circular(16),
                          ),
                        )
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
Future signUp(BuildContext context, TextEditingController email, TextEditingController password, TextEditingController name, TextEditingController surname) async{
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => Center(child: CircularProgressIndicator())
  );

  try{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
    );
    
    final docUser = FirebaseFirestore.instance.collection('Cliente').doc(email.text.trim());

    final json = {
      'email': email.text.trim(),
      'nome': name.text.trim(),
      'cognome': surname.text.trim()
    };

    await docUser.set(json);

    Navigator.popAndPushNamed(context, '/login');
  } on FirebaseAuthException catch (e){
    print(e);

    Navigator.pop(context);

    if(e.code.compareTo("email-already-in-use") == 0){
      showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: Text('L\'email inserita è già esistente.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, true), // passing true
                  child: Text('Riprova'),
                ),
              ],
            );
          }).then((exit) {
        if (exit == null) {
          return;
        }
        if (exit) {
          return;
        }
      });
    }
  //   else {
  //     showDialog(
  //         context: context,
  //         builder: (_) {
  //           return AlertDialog(
  //             title: Text('Oops...qualcosa è andato storto.'),
  //             actions: [
  //               TextButton(
  //                 onPressed: () => Navigator.pop(context, true), // passing true
  //                 child: Text('Riprova'),
  //               ),
  //             ],
  //           );
  //         }).then((exit) {
  //       if (exit == null) {
  //         return;
  //       }
  //       if (exit) {
  //         // user pressed Yes button
  //       }
  //     });
  //   }
  }
}

bool isEmail(String email) {
  RegExp regex = RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$");

  return regex.hasMatch(email);
}