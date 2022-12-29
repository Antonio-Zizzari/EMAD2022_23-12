import 'package:flutter/material.dart';

class PetShopSearch extends StatefulWidget {
  const PetShopSearch({Key? key}) : super(key: key);

  @override
  State<PetShopSearch> createState() => _PetShopSearchState();
}

class _PetShopSearchState extends State<PetShopSearch> {
  List<String> size = [
    "S",
    "M",
    "L",
    "XL",
  ];
  List<Color> colors = [
    Colors.black,
    Colors.purple,
    Colors.orange.shade200,
    Colors.blueGrey,
    Color(0xFFFFC1D9),
  ];

  int _selectedColor = 0;
  int _selectedSize = 1;

  var selectedRange = const RangeValues(1.00, 200.00);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            child: TextField(
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.search, color: Colors.black),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none
                ),
                hintText: "Cerca un prodotto",
                hintStyle: TextStyle(fontSize: 14, color: Colors.black),
              ),
            ),
          ),
        ),
        Container(
          height: 50,
          width: 50,
          child: IconButton(
            onPressed: () {
              showFilterModal();
            },
            icon: Icon(Icons.filter_list, color: Colors.black, size: 30,),
          ),
        ),
        SizedBox(width: 10),
      ],
    );
  }


  showFilterModal() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
      ),
      builder: (context) {
        return StatefulBuilder(
            builder: (context, setState) {
              return Container(
                padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
                height: MediaQuery.of(context).size.height * 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Filter', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
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
                    SizedBox(height: 20,),
                    Text("Color", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                    SizedBox(height: 10,),
                    Container(
                      height: 60,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: colors.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedColor = index;
                              });
                            },
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  color: _selectedColor == index ? colors[index] : colors[index].withOpacity(0.5),
                                  shape: BoxShape.circle
                              ),
                              width: 40,
                              height: 40,
                              child: Center(
                                child: _selectedColor == index ? Icon(Icons.check, color: Colors.white,) : Container(),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text('Size', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    Container(
                      height: 60,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: size.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedSize = index;
                              });
                            },
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 500),
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  color: _selectedSize == index ? Colors.yellow[800] : Colors.grey.shade200,
                                  shape: BoxShape.circle
                              ),
                              width: 40,
                              height: 40,
                              child: Center(
                                child: Text(size[index], style: TextStyle(color: _selectedSize == index ? Colors.white : Colors.black, fontSize: 15),),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    // Slider Price Renge filter
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Price Range', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('\$ ${selectedRange.start.toStringAsFixed(2)}', style: TextStyle(color: Colors.grey.shade500, fontSize: 12),),
                            Text(" - ", style: TextStyle(color: Colors.grey.shade500)),
                            Text('\$ ${selectedRange.end.toStringAsFixed(2)}', style: TextStyle(color: Colors.grey.shade500, fontSize: 12),),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    RangeSlider(
                        values: selectedRange,
                        min: 0.00,
                        max: 2000.00,
                        divisions: 100,
                        inactiveColor: Colors.grey.shade300,
                        activeColor: Colors.yellow[800],
                        labels: RangeLabels('\$ ${selectedRange.start.toStringAsFixed(2)}', '\$ ${selectedRange.end.toStringAsFixed(2)}',),
                        onChanged: (RangeValues values) {
                          setState(() => selectedRange = values);
                        }
                    ),
                    SizedBox(height: 20,),
                    button('Filter', () {})
                  ],
                ),
              );
            }
        );
      },
    );
  }
  button(String text, Function onPressed) {
    return MaterialButton(
      onPressed: () => onPressed(),
      height: 50,
      elevation: 0,
      splashColor: Colors.yellow[700],
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      ),
      color: Colors.yellow[800],
      child: Center(
        child: Text(text, style: TextStyle(color: Colors.white, fontSize: 18),),
      ),
    );
  }
}
