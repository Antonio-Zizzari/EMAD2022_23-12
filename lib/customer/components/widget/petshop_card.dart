import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:justpet/customer/components/petshop_products.dart';
import 'package:justpet/customer/components/widget/review_card.dart';

import '../../../../theme/color.dart';
import '../../models/petshop_class.dart';

class PetShopCard extends StatelessWidget {
  final PetShopClass data;


  const PetShopCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //double height = MediaQuery.of(context).size.height * 0.33;
    //double width = MediaQuery.of(context).size.width * 0.9;
    double averageReview = getAverage(data.reviews);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.fromLTRB(12,0,12,0),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8), // if you need this
              side: BorderSide(
                color: Colors.grey.withOpacity(.2),
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(8.0, 13.0, 8.0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 100.0,
                        width: 120.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.asset(
                            data.pathImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 6.0, 0, 0),
                            child: Text(
                              data.name,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Text(
                            data.address,
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(height: 5),
                          ElevatedButton.icon(
                            style: ButtonStyle(
                              elevation: MaterialStatePropertyAll(5),
                            ),
                            icon: Icon(Icons.shop_two_outlined),
                            label: Text("Accedi al Petshop"),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PetShopProductsPage(data: data),
                                ),
                              );
                            }
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.black,
                  thickness: .2,
                  indent: 8,
                  endIndent: 8,
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'NUMERO PRODOTTI IN VENDITA',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        Text(
                          data.products.length != 1 ? '${data.products.length.toString()} prodotti' : '1 prodotto',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'RECENSIONI NEGOZIO',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            RatingBar(
                              initialRating: averageReview,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              ignoreGestures: true,
                              itemCount: 5,
                              itemSize: 22,
                              ratingWidget: RatingWidget(
                                full: const Icon(Icons.star, color: Colors.black54),
                                half: const Icon(Icons.star_half_outlined, color: Colors.black54),
                                empty: const Icon(Icons.star_border_outlined, color: Colors.black54),
                              ),
                              updateOnDrag: true,
                              onRatingUpdate: (double value) {},
                            ),
                            SizedBox(width: 5),
                            Text(
                              averageReview != 0 ? '$averageReview / 5.0' : 'Nessuna recensione disponibile',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: ElevatedButton.icon(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: red5, width: 2)
                                )
                              ),
                              backgroundColor: MaterialStatePropertyAll<Color>(red2),
                              elevation: MaterialStatePropertyAll(8),
                              padding: MaterialStatePropertyAll<EdgeInsets>(
                                EdgeInsets.symmetric(horizontal: 50)
                              )
                            ),
                            icon: Icon(Icons.preview_sharp, color: Colors.black54),
                            label: Text("Visualizza recensioni", style: TextStyle(color: Colors.black54)),
                            onPressed: () {
                              averageReview != 0 ? showReviewModal(context, averageReview) : null;
                            }
                          ),
                        ),
                      ],
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
  showReviewModal(BuildContext context, double averageReview) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Recensioni', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
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
                      Text('MEDIA VOTAZIONI', style: TextStyle(color: Colors.black45, fontSize: 12,)),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 3),
                        child: Text(averageReview.toString(), style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.w500),),
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
                          half: const Icon(Icons.star_half_outlined, color: Colors.black54),
                          empty: const Icon(Icons.star_border_outlined, color: Colors.black54),
                        ),
                        updateOnDrag: true,
                        onRatingUpdate: (double value) {},
                      ),
                      Text(
                        data.reviews.length != 1 ? 'basata su ${data.reviews.length} recensioni' : 'basata su 1 recensione',
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
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(color: red5, width: 2)
                          )
                        ),
                        backgroundColor: MaterialStatePropertyAll<Color>(red2),
                        elevation: MaterialStatePropertyAll(8),
                        padding: MaterialStatePropertyAll<EdgeInsets>(
                            EdgeInsets.symmetric(horizontal: 20)
                        )
                      ),
                      icon: Icon(Icons.reviews_outlined, color: Colors.black54),
                      label: Text("Scrivi una nuova recensione", style: TextStyle(color: Colors.black54)),
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
                        children: data.reviews.map((review) => ReviewCard(review: review, )).toList(),
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
