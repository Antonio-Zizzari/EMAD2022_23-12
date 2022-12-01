import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

import '../../../../theme/color.dart';
import '../../models/petshop_class.dart';

class PetShopCard extends StatelessWidget {
  final PetShopClass data;

  const PetShopCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.33;
    double width = MediaQuery.of(context).size.height * 0.4;

    return Center(
      child: Container(
        margin: EdgeInsets.fromLTRB(10, 15, 10, 15),
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.red
        ),
        child: Stack(
          children: [
            Container(
              width: width,
              height: height * 0.8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset(data.pathImage, fit: BoxFit.cover),
              ),
            ),
            Positioned(
              bottom: 0,
              child: GlassContainer(
                borderRadius: BorderRadius.circular(25),
                blur: 10,
                opacity: 0.15,
                child: Container(
                    width: width,
                    height: 115,
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
                        ]
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                data.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: glassTextColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const Spacer(),
                            const Expanded(flex: 2,
                              child: Text(
                                "Visualizza Pet Shop",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: glassTextColor,
                                  fontSize: 11,
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
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) => AnimalCard(data: pets[index]),
                                    //   ),
                                    // );
                                  }
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0,0,0,1.0),
                          child: Text(data.address, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: glassLabelColor, fontSize: 13),),
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            RatingBar(
                              initialRating: data.review,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              ignoreGestures: true,
                              itemCount: 5,
                              itemSize: 22,
                              ratingWidget: RatingWidget(
                                full: const Icon(Icons.star, color: Colors.yellowAccent),
                                half: const Icon(Icons.star_half_outlined, color: Colors.yellowAccent),
                                empty: const Icon(Icons.star_border_outlined, color: Colors.yellowAccent),
                              ),
                              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                              updateOnDrag: true,
                              onRatingUpdate: (double value) {},
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Text(
                                '${data.review.toString()} / 5.0',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
