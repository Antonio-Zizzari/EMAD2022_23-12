import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:justpet/customer/screens/animal-card.dart';
import 'package:justpet/global/models/color.dart';
import 'package:justpet/theme/color.dart';
import 'package:justpet/customer/models/pet_class.dart';
import 'package:justpet/customer/components/animal-single-card.dart';

class PetItem extends StatefulWidget {
  const PetItem(
      {Key? key,
      required this.data,
      required this.index,
      this.width = 350,
      this.height = 400,
      this.radius = 40,
      this.onTap,
      this.onFavoriteTap})
      : super(key: key);
  final data;
  final int index;
  final double width;
  final double height;
  final double radius;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onFavoriteTap;

  @override
  State<PetItem> createState() => _PetItemState();
}

class _PetItemState extends State<PetItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        showAlertDialog(context, widget.data);
      },
      onTap: widget.onTap,
      child: Container(
        width: widget.width,
        height: widget.height,
        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.radius),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: red5, width: 2),
                borderRadius: BorderRadius.circular(widget.radius+5),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(widget.radius),
                child: widget.data.pathImage.contains("cache") ? Image.file(fit: BoxFit.fitWidth, File(widget.data.pathImage)) : Image.asset(widget.data.pathImage),
              ),
            ),
            Positioned(
              bottom: 25,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: red5, width: 2),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: GlassContainer(
                  borderRadius: BorderRadius.circular(25),
                  blur: 20,
                  opacity: 0.6,
                  child: Container(
                    width: widget.width - 4,
                    height: 110,
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: shadowColor.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 2), // changes position of shadow
                        ),
                      ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text(
                                  widget.data.nome,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: glassTextColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const Expanded(
                                flex: 2,
                                child: Text(
                                  "Scheda animale",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: glassTextColor,
                                    fontSize: 13.5,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: IconButton(
                                    icon: const Icon(Icons.arrow_circle_right),
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              AnimalCard(data: widget.data),
                                        ),
                                      );
                                    }),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 1.0),
                            child: Text(
                              widget.data.tipoAnimale,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  TextStyle(color: glassLabelColor, fontSize: 13),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              getAttribute(
                                Icons.transgender,
                                widget.data.sesso,
                              ),
                              getAttribute(
                                Icons.query_builder,
                                widget.data.eta,
                              ),
                            ],
                          ),
                        ],
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  getAttribute(IconData icon, String info) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        SizedBox(
          width: 3,
        ),
        Text(
          info,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style:
              TextStyle(color: Color.fromRGBO(255, 255, 255, 1), fontSize: 13),
        ),
      ],
    );
  }

  showAlertDialog(BuildContext context, Pets animale) {
    final user = FirebaseAuth.instance.currentUser!;
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Annulla"),
      onPressed:  () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Rimuovi"),
      onPressed:  () {
        Navigator.of(context).pop();
        removeAnimaleFromFirestore(user.email!, animale);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.white,
            elevation: 25.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),

            ),
            content: Row(children: [Icon(Icons.delete_forever, color: kPrimaryColor,), SizedBox(width: 5,), Text(animale.nome+" rimosso con successo!", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)],
            )));
        Navigator.pop(context);
        Navigator.popAndPushNamed(
            context,
            '/scheda_animali'
        );
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Attenzione!"),
      content: Text("Sei sicuro di voler rimuovere "+animale.nome+" dalla lista?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
