import 'package:flutter/material.dart';
import 'package:justpet/Customer/Cust_Component/AppBarVeterinario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:justpet/Customer/Cust_Component/ContenutoCorso.dart';
import 'package:justpet/Customer/Cust_Component/Corso.dart';

class DettagliVideoCorso extends StatelessWidget {

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



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarVeterinario(title: '', showSearch: false,),
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFF5F4EF),
          image: DecorationImage(
            image: AssetImage("assets/dog.jpg"),
            alignment: Alignment.topRight,
          ),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20, top: 50, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  /*Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(Icons.arrow_back_sharp),
                      Icon(Icons.more_vert),
                    ],
                  ),*/
                  SizedBox(height: 30),
                  ClipPath(
                    clipper: BestSellerClipper(),
                    child: Container(
                      color: kBestSellerColor,
                      padding: EdgeInsets.only(
                          left: 10, top: 5, right: 20, bottom: 5),
                      child: Text(
                        "BestSeller".toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text("Design Thinking", style: kHeadingextStyle),
                  SizedBox(height: 16),
                  Row(
                    children: <Widget>[
                      Icon(Icons.person),
                      SizedBox(width: 5),
                      Text("18K"),
                      SizedBox(width: 20),
                      Icon(Icons.star),
                      SizedBox(width: 5),
                      Text("4.8")
                    ],
                  ),
                  SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "\$50 ",
                          style: kHeadingextStyle.copyWith(fontSize: 32),
                        ),
                        TextSpan(
                          text: "\$70",
                          style: TextStyle(
                            color: kTextColor.withOpacity(.5),
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 60),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Course Content", style: kTitleTextStyle),
                          SizedBox(height: 30),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30.0, 65, 30, 70),
                      child: SingleChildScrollView(
                        child: Column(
                            children: contenutocorsi.map((e) => e).toList()
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      left: 0,
                      bottom: 0,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 4),
                              blurRadius: 50,
                              color: kTextColor.withOpacity(.1),
                            ),
                          ],
                        ),
                        child: Row(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(14),
                              height: 56,
                              width: 80,
                              decoration: BoxDecoration(
                                color: Color(0xFFFFEDEE),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: MaterialButton(onPressed: (){},child: Icon(Icons.shopping_bag)),
                            ),
                            Spacer(),
                            Container(
                              height: 56,
                              width: 250,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: kBlueColor,
                              ),
                              child: MaterialButton(
                                  onPressed: (){},
                                  child: Text(
                                  "Buy Now",
                                  style: kSubtitleTextSyule.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  )
                                )
                              ),
                            ),
                            /*Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                height: 56,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: kBlueColor,
                                ),
                                child: Text(
                                  "Buy Now",
                                  style: kSubtitleTextSyule.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )*/
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*class CourseContent extends StatelessWidget {
  final String number;
  final double duration;
  final String title;
  final bool isDone;
  const CourseContent({
    Key? key,
    required this.number,
    required this.duration,
    required this.title,
    this.isDone = false,
  }) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        children: <Widget>[
          Text(
            number,
            style: kHeadingextStyle.copyWith(
              color: kTextColor.withOpacity(.15),
              fontSize: 32,
            ),
          ),
          SizedBox(width: 8),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "$duration mins\n",
                  style: TextStyle(
                    color: kTextColor.withOpacity(.5),
                    fontSize: 18,
                  ),
                ),
                TextSpan(
                  text: title,
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
              color: kGreenColor.withOpacity(isDone ? 1 : .5),
            ),
            child: Icon(Icons.play_arrow, color: Colors.white),
          )
        ],
      ),
    );
  }
}
*/
class BestSellerClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(size.width - 20, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width - 20, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}