import 'package:flutter/material.dart';
import 'package:justpet/global/models/color.dart';
import 'package:justpet/theme/color.dart';
import 'package:justpet/global/screens/welcome_page.dart';
import 'package:justpet/customer/screens/ListaVeterinari.dart';
import 'package:justpet/global/components/login_register/actionButton.dart';
import 'package:justpet/global/components/login_register/inputField.dart';

class Login extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/welcome_background.png'),
              fit: BoxFit.cover
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Benvenuto su JustPet', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
              Image.asset('assets/logo/logo.png', ),
              Text('Accedi', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              inputField('Email', kTertiaryColor),
              SizedBox(height: 20,),
              inputField('Password', kTertiaryColor),
              SizedBox(height: 20,),
              actionButton(context, 'ACCEDI', ListaVeterinari(), kPrimaryColor),
            ],
          ),
        ),
      ),
    );
  }
}