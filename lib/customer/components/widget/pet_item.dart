import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:justpet/theme/color.dart';
import 'package:justpet/customer/models/pet_class.dart';
import 'package:justpet/customer/components/animal-single-card.dart';

class PetItem extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: red5, width: 2),
                borderRadius: BorderRadius.circular(radius+5),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(radius),
                child: Image.asset(data.pathImage),
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
                    width: width - 4,
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
                                  data.nome,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: glassTextColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const Expanded(
                                flex: 3,
                                child: Text(
                                  "Visualizza scheda animale",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: glassTextColor,
                                    fontSize: 10,
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
                                              AnimalCard(data: data),
                                        ),
                                      );
                                    }),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 1.0),
                            child: Text(
                              data.tipoAnimale,
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
                                data.sesso,
                              ),
                              getAttribute(
                                Icons.query_builder,
                                data.eta,
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
}
