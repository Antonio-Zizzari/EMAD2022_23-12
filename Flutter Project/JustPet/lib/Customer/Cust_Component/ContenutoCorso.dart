import 'package:flutter/material.dart';

class ContenutoCorso extends StatelessWidget{
  final numero;
  final String titolo;
  final durata;
  final bool guardato;

  static const kTextColor = Color(0xFF0D1333);
  static const kBlueColor = Color(0xFF6E8AFA);
  static const kBestSellerColor = Color(0xFFFFD073);
  static const kGreenColor = Color(0xFF49CC96);

// My Text Styles
  static const kHeadingextStyle = TextStyle(
    fontSize: 28,
    color: kTextColor,
    fontWeight: FontWeight.bold,
  );
  static const kSubheadingextStyle = TextStyle(
    fontSize: 24,
    color: Color(0xFF61688B),
    height: 2,
  );

  static const kTitleTextStyle = TextStyle(
    fontSize: 20,
    color: kTextColor,
    fontWeight: FontWeight.bold,
  );

  static const kSubtitleTextSyule = TextStyle(
    fontSize: 18,
    color: kTextColor,
    // fontWeight: FontWeight.bold,
  );


  ContenutoCorso({
    this.numero,
    this.titolo = '',
    this.durata,
    this.guardato = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 40,
            child: Container(
              child: Text(
                numero.toString(),
                style: kHeadingextStyle.copyWith(
                  color: kTextColor.withOpacity(.15),
                  fontSize: 32,
                ),
              ),
            ),
          ),
          SizedBox(width: 8),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "$durata minuti\n",
                  style: TextStyle(
                    color: kTextColor.withOpacity(.5),
                    fontSize: 18,
                  ),
                ),
                TextSpan(
                  text: titolo,
                  style: kSubtitleTextSyule.copyWith(
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.only(left: 20),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kGreenColor.withOpacity(guardato ? .5 : 1),
            ),
            child: MaterialButton(onPressed: (){},child: Icon(Icons.play_arrow, color: Colors.white)),
          )
        ],
      ),
    );
  }
}

List<ContenutoCorso> contenutocorsi = [
  ContenutoCorso(
    numero: 1,
    durata: 5.35,
    titolo: "Benvenuti al corso",
    guardato: true,
  ),
  ContenutoCorso(
    numero: 2,
    durata: 19.04,
    titolo: "Corso: parte 2",
    guardato: true,
  ),
  ContenutoCorso(
    numero: 3,
    durata: 19.04,
    titolo: "Corso: parte 3",
    guardato: true,
  ),
  ContenutoCorso(
    numero: 4,
    durata: 19.04,
    titolo: "Corso: parte 4",
    guardato: true,
  ),
  ContenutoCorso(
    numero: 5,
    durata: 19.04,
    titolo: "Corso: parte 5",
    guardato: true,
  ),
  ContenutoCorso(
    numero: 6,
    durata: 19.04,
    titolo: "Corso: parte 6",
    guardato: true,
  ),
  ContenutoCorso(
    numero: 7,
    durata: 19.04,
    titolo: "Corso: parte 7",
    guardato: true,
  ),
  ContenutoCorso(
    numero: 8,
    durata: 19.04,
    titolo: "Corso: parte 8",
    guardato: true,
  ),
  ContenutoCorso(
    numero: 9,
    durata: 15.35,
    titolo: "Corso: parte 9",
  ),
  ContenutoCorso(
    numero: 10,
    durata: 5.35,
    titolo: "Corso: parte 10",
  ),
];