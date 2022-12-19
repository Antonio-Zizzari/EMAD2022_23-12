import 'package:flutter/material.dart';
import 'package:justpet/global/components/appbar.dart';

class createCourse extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

    return Scaffold(
      appBar: MainAppBar(_scaffoldKey),
      body: Column(
        // TODO: implement scaffold
      ),
    );
  }

}