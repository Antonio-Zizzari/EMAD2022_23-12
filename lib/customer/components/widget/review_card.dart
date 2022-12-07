import 'package:flutter/material.dart';
import '../../models/review.dart';

class ReviewCard extends StatelessWidget {
  final Review review;

  const ReviewCard({Key? key, required this.review}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  padding: EdgeInsets.fromLTRB(10, 15, 10, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 80.0,
                        width: 80.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.asset(
                            // Da dinamicizzare con l'avatar
                            "assets/user.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 6.0, 0, 0),
                            child: Text(
                              // Da dinamicizzare con il nome dell'utente
                              "Utente",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
