import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:justpet/global/models/color.dart';
import 'package:justpet/global/screens/register_page.dart';
import 'package:justpet/main.dart';
import 'package:justpet/theme/color.dart';
import 'package:justpet/global/screens/welcome_page.dart';
import 'package:justpet/customer/screens/ListaVeterinari.dart';

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
      resizeToAvoidBottomInset: false,
      body: Container(
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
                    signIn(context, ListaVeterinari(), true, emailController, passwordController);
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

Future signIn(BuildContext context, Widget redirect, bool replace_route, TextEditingController email, TextEditingController password) async{
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
    print(e);
  }
}