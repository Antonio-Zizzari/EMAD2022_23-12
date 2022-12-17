import 'package:flutter/material.dart';
import 'package:justpet/global/models/color.dart';
import 'package:justpet/global/screens/login_page.dart';
import 'package:justpet/global/screens/register_page.dart';
import 'package:justpet/theme/color.dart';
import 'package:justpet/global/components/login_register/actionButton.dart';
import 'package:justpet/global/components/login_register/inputField.dart';

class Welcome extends StatelessWidget{
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
              actionButton(context, 'ACCEDI', Login(), kPrimaryColor),
              SizedBox(height: 20,),
              actionButton(context, 'REGISTRATI', Register(), kTertiaryColor),
            ],
          ),
        ),
      ),
    );
  }
}