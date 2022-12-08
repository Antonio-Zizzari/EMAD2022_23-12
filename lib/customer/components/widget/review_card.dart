import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        height: 50.0,
                        width: 50.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.asset(
                            // Da dinamicizzare con l'avatar
                            "assets/user.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(15, 6.0, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              // Da dinamicizzare con il nome dell'utente
                              "Utente",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 5),
                            RatingBar(
                              initialRating: review.vote,
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
                          ],
                        ),
                      ),
                      Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            // Da dinamicizzare con il nome dell'utente
                            '${review.vote.toString()} / 5.0',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            // Da dinamicizzare con il nome dell'utente
                            getDate(review.date),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Divider(
                  color: Colors.black,
                  thickness: .5,
                  indent: 8,
                  endIndent: 8,
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(12,6,12,12),
                    child: Text(
                      // Da dinamicizzare con il nome dell'utente
                      review.description,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
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
  String getDate(DateTime date){
    DateTime dateNow = DateTime.now().toLocal();

    int monthCount = 0;
    int yearCount = 0;
    int daysDifference = -1;
    int hourDifference = -1;
    int minuteDifference = -1;
    int secondsDifference = -1;

    daysDifference = dateNow.difference(date).inDays;

    if(daysDifference == 0) {
      hourDifference = dateNow.difference(date).inHours;
      if(hourDifference == 0){
        minuteDifference = dateNow.difference(date).inMinutes;
        if(minuteDifference == 0){
          secondsDifference = dateNow.difference(date).inSeconds;
        }
      }
    }

    if(secondsDifference > 0) {
      return secondsDifference == 1 ? '1 secondo fa' : '$secondsDifference secondi fa';
    }
    if(minuteDifference > 0) {
      return minuteDifference == 1 ? '1 minuto fa' : '$minuteDifference minuti fa';
    }
    if(hourDifference > 0) {
      return hourDifference == 1 ? '1 ora fa' : '$hourDifference ore fa';
    }

    if(daysDifference >= 1 && daysDifference <= 31) {
      return daysDifference == 1 ? '1 giorno fa' : '$daysDifference giorni fa';
    }
    while(daysDifference - 28 > 0){
      monthCount++;
      daysDifference -= 28;
    }
    while(monthCount - 12 >= 0){
      yearCount++;
      monthCount -= 12;
    }

    if(yearCount > 0) {
      if(yearCount == 1)
        return monthCount > 0 ? 'Più di un anno fa' : 'Un anno fa';
      else
        return monthCount > 0 ? 'Più di $yearCount anni fa' : '$yearCount anni fa';
    }
    if(monthCount > 0)
      return monthCount == 1 ? 'Un mese fa' : '$monthCount mesi fa';
    
    return "";
  }
}
