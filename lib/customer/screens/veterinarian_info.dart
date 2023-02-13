import 'package:flutter/material.dart';
import 'package:justpet/customer/components/widget/ecommerce/review_card.dart';
import 'package:justpet/customer/models/Veterinario.dart';
import 'package:justpet/customer/models/petshop_class.dart';
import 'package:justpet/global/components/appbar.dart';
import 'package:justpet/global/components/SideMenu.dart';
import 'package:justpet/global/models/color.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:justpet/global/screens/main_chat.dart';
import 'package:justpet/theme/color.dart';
import 'package:justpet/veterinarian/screens/veterinarian_appointment.dart';

class VeterinarianInfo extends StatelessWidget {
  final Veterinario veterinario;
  VeterinarianInfo({Key? key, required this.veterinario}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(veterinario.nome,
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomLeft,
                clipBehavior: Clip.none,
                children: [
                  Image.asset('assets/images/${veterinario.immagine}' ),
                  FractionalTranslation(
                    translation: Offset(-0.35, 0.4),
                    child: Align(
                      child: CircleAvatar(
                        foregroundImage: AssetImage(
                            'assets/images/'+veterinario.immagine_profilo),
                        radius: 50,),
                      alignment: FractionalOffset(0.5, 0.0),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40,),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${veterinario.nome}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                      Text('${veterinario.indirizzo}', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  Spacer(),
                  FavoriteButton(valueChanged: (){}),
                ],
              ),
              SizedBox(height: 20,),
              ElevatedButton.icon(onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VeterinarianAppointment(veterinario: veterinario),
                  ),
                );
              }, icon: Icon(Icons.calendar_month), label: Text('Prenota'), style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor, fixedSize: Size(500, 45), textStyle: TextStyle(fontSize: 16)),),
              SizedBox(height: 10,),
              ElevatedButton.icon(onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Chat(),
                  ),
                );
              }, icon: Icon(Icons.chat), label: Text('Contatta'), style: ElevatedButton.styleFrom(backgroundColor: kTextLightColor, fixedSize: Size(500, 45), textStyle: TextStyle(fontSize: 16)),),
              SizedBox(height: 10,),
              Divider(thickness: 1.5, color: kPrimaryColor,),
              SizedBox(height: 10,),
              Row(
                children: [
                  Text('${veterinario.votazione} ', style: TextStyle(fontSize: 16,)),
                  Icon(Icons.star, color: Colors.yellow[700],),
                  Icon(Icons.star, color: Colors.yellow[700],),
                  Icon(Icons.star, color: Colors.yellow[700],),
                  Icon(Icons.star, color: Colors.yellow[700],),
                  Icon(Icons.star_half, color: Colors.yellow[700],),
                  Spacer(),
                  Text('4 recensioni   ', style: TextStyle(fontSize: 16,)),
                  InkWell(
                    onTap: (){
                      showReviewModal(context, getAverage(petshops[0].reviews));
                    },
                    child: Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        color: Colors.black,
                          shape: BoxShape.circle
                      ),
                        child: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 20,),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Divider(thickness: 1.5, color: kPrimaryColor,),
              Text('Descrizione', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              SizedBox(height: 10,),
              Text('${veterinario.descrizione}', style: TextStyle(fontSize: 16), textAlign: TextAlign.justify,),
              SizedBox(height: 10,),
              Divider(thickness: 1.5, color: kPrimaryColor,),
              SizedBox(height: 10,),
              Text('Orario di lavoro', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              SizedBox(height: 10,),
              Column(
                children: [
                  Row(children: [Text('Lunedi',style: TextStyle(fontSize: 16),), Spacer(), Text('9:00 - 13:00 / 16:00 - 19:00',style: TextStyle(fontSize: 16),)],),
                  SizedBox(height: 5,),
                  Row(children: [Text('Martedi',style: TextStyle(fontSize: 16),), Spacer(), Text('9:00 - 13:00 / 16:00 - 19:00',style: TextStyle(fontSize: 16),)],),
                  SizedBox(height: 5,),
                  Row(children: [Text('Mercoledi',style: TextStyle(fontSize: 16),), Spacer(), Text('9:00 - 13:00 / 16:00 - 19:00',style: TextStyle(fontSize: 16),)],),
                  SizedBox(height: 5,),
                  Row(children: [Text('Giovedi',style: TextStyle(fontSize: 16),), Spacer(), Text('9:00 - 13:00 / 16:00 - 19:00',style: TextStyle(fontSize: 16),)],),
                  SizedBox(height: 5,),
                  Row(children: [Text('Venerdi',style: TextStyle(fontSize: 16),), Spacer(), Text('9:00 - 13:00 / 16:00 - 19:00',style: TextStyle(fontSize: 16),)],),
                  SizedBox(height: 5,),
                  Row(children: [Text('Sabato',style: TextStyle(fontSize: 16),), Spacer(), Text('chiuso',style: TextStyle(fontSize: 16),)],),
                  SizedBox(height: 5,),
                  Row(children: [Text('Domenica',style: TextStyle(fontSize: 16),), Spacer(), Text('chiuso',style: TextStyle(fontSize: 16),)],),
                  SizedBox(height: 10,),
                ],
              ),
              Divider(thickness: 1.5, color: kPrimaryColor),
              SizedBox(height: 10,),
              Row(
                children: [
                  Container(),
                  Text('Pagamenti accettati', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  Spacer(),
                  Row(children: [Icon(Icons.money), SizedBox(width: 5,), Text('Paga in contanti')],)
                ],
              ),
              SizedBox(height: 10,),
              Divider(thickness: 1.5, color: kPrimaryColor),
              ],
          ),
        ),
      ),
    );
  }
  showReviewModal(BuildContext context, double averageReview) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))
      ),
      builder: (context) {
        return StatefulBuilder(
            builder: (context, setState) {
              return Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.87,
                padding: EdgeInsets.only(
                    top: 20, left: 20, right: 20, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Recensioni', style: TextStyle(color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),),
                        MaterialButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          minWidth: 40,
                          height: 40,
                          color: Colors.grey.shade300,
                          elevation: 0,
                          padding: EdgeInsets.all(0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)
                          ),
                          child: Icon(Icons.close, color: Colors.black,),
                        )
                      ],
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: .5,
                      indent: 8,
                      endIndent: 8,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('MEDIA VOTAZIONI', style: TextStyle(
                          color: Colors.black45, fontSize: 12,)),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 3),
                          child: Text(
                            averageReview.toString(), style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.w500),),
                        ),
                        RatingBar(
                          initialRating: averageReview,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          ignoreGestures: true,
                          itemCount: 5,
                          itemSize: 22,
                          ratingWidget: RatingWidget(
                            full: const Icon(Icons.star, color: Colors.black54),
                            half: const Icon(Icons.star_half_outlined,
                                color: Colors.black54),
                            empty: const Icon(Icons.star_border_outlined,
                                color: Colors.black54),
                          ),
                          updateOnDrag: true,
                          onRatingUpdate: (double value) {},
                        ),
                        Text(
                            petshops[0].reviews.length != 1
                                ? 'basata su ${petshops[0].reviews
                                .length} recensioni'
                                : 'basata su 1 recensione',
                            style: TextStyle(
                                color: Colors.black45,
                                fontSize: 12
                            )
                        ),
                      ],
                    ),
                    Center(
                      child: ElevatedButton.icon(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: BorderSide(color: red5, width: 2)
                                  )
                              ),
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  red2),
                              elevation: MaterialStatePropertyAll(8),
                              padding: MaterialStatePropertyAll<EdgeInsets>(
                                  EdgeInsets.symmetric(horizontal: 20)
                              )
                          ),
                          icon: Icon(
                              Icons.reviews_outlined, color: Colors.black54),
                          label: Text("Scrivi una nuova recensione",
                              style: TextStyle(color: Colors.black54)),
                          onPressed: () {}
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: .5,
                      indent: 8,
                      endIndent: 8,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: petshops[0].reviews.map((review) =>
                              ReviewCard(review: review,)).toList(),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }
        );
      },
    );
  }
}
