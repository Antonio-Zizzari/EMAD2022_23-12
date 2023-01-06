import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:justpet/global/models/color.dart';
import 'package:justpet/global/screens/register_page.dart';
import 'package:justpet/main.dart';
import 'package:justpet/theme/color.dart';
import 'package:justpet/global/screens/welcome_page.dart';
import 'package:justpet/customer/screens/ListaVeterinari.dart';
import 'dart:convert';
import 'dart:io';


class Login extends StatefulWidget{
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
                Text('Accedi', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                inputField('Email', kTertiaryColor, emailController, false),
                SizedBox(height: 20,),
                inputField('Password', kTertiaryColor, passwordController, true),
                SizedBox(height: 20,),
                SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: (){
                      if(emailController.text.trim().isEmpty || !isEmail(emailController.text.trim())){
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
                      } else if(passwordController.text.trim().isEmpty) {
                        showDialog(
                            context: context,
                            builder: (_) {
                              return AlertDialog(
                                title: Text('La password non può essere vuota'),
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
                        signIn(context, emailController, passwordController);
                      }
                    },
                    child: Text("ACCEDI"),
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
                SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Divider(
                    thickness: 1,
                    height: 30,
                    color: Colors.black,
                  ),
                ),
                Text("Oppure"),
                SizedBox(height: 15,),
                SizedBox(
                  width: 200,
                  height: 35,
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Register()
                          )
                      );
                    },
                    child: Text("REGISTRATI"),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(kTertiaryColor),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            // Change your radius here
                            borderRadius: BorderRadius.circular(16),
                          ),
                        )
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
Widget inputField (String hintText, Color color, TextEditingController controller, bool isObscured) {
  return SizedBox(
    width: 300,
    height: 50,
    child: TextField(
      obscureText: isObscured,
      controller: controller,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          hintStyle: TextStyle(color: Colors.grey[800]),
          hintText: hintText,
          fillColor: color),
    ),
  );
}

Future signIn(BuildContext context, TextEditingController email, TextEditingController password) async{
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => Center(child: CircularProgressIndicator())
  );

  try{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email.text.trim(),
      password: password.text.trim()
    );


    Navigator.popAndPushNamed(context, '/lista');
  } on FirebaseAuthException catch (e){
    print(e.code);

    Navigator.pop(context);

    if(e.code.compareTo("wrong-password") == 0){
      showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: Text('La password inserita non è corretta.'),
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
    } else if(e.code.compareTo("user-not-found") == 0) {
      showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: Text(
                  'L\'utente associato alla email inserita non esiste.'),
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
    // else {
    //   showDialog(
    //       context: context,
    //       builder: (_) {
    //         return AlertDialog(
    //           title: Text('Oops...qualcosa è andato storto.'),
    //           actions: [
    //             TextButton(
    //               onPressed: () => Navigator.pop(context, true), // passing true
    //               child: Text('Riprova'),
    //             ),
    //           ],
    //         );
    //       }).then((exit) {
    //     if (exit == null) {
    //       return;
    //     }
    //     if (exit) {
    //       // user pressed Yes button
    //     }
    //   });
    // }
  }
}
bool isEmail(String email) {
  RegExp regex = RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$");

  return regex.hasMatch(email);
}

/*
Future<dynamic> saveDataToFile(String filename,Map<String,dynamic> data) async{
  final directory =await getApplicationDo
  final file = File(filename);
  final datiSalvati=json.encode(data);
  return file.writeAsString(datiSalvati);
}*/
