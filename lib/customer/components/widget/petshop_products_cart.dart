import 'package:flutter/material.dart';
import 'package:justpet/customer/components/widget/payment.dart';
import 'package:justpet/customer/models/customer.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:justpet/customer/models/petshop_class.dart';

import '../../models/product.dart';
import '../product_view.dart';

class PetShopCart extends StatefulWidget {
  final PetShopClass data;

  const PetShopCart({Key? key, required this.data}) : super(key: key);

  @override
  State<PetShopCart> createState() => _PetShopCartState();
}

class _PetShopCartState extends State<PetShopCart> {
  double totalPrice = 0;
  double shipment = 5.99;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    for(int i = 0; i < customer.cart.productsInCart.length; i++){
      totalPrice += double.parse(customer.cart.productsInCart[i].price) * customer.cart.amountProductsInCart[i];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Il mio carrello', style: TextStyle(color: Colors.black)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: MediaQuery.of(context).size.height * 0.53,
            child: customer.cart.productsInCart.isNotEmpty ? AnimatedList(
                scrollDirection: Axis.vertical,
                initialItemCount: customer.cart.productsInCart.length,
                itemBuilder: (context, index, animation) {
                  return Slidable(
                    child: cartItem(customer.cart.productsInCart[index], index, animation),
                  );
                }
            ) :
            Center(
              child: Text(
                "Non sono presenti prodotti nel tuo carrello.",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Spedizione', style: TextStyle(fontSize: 20)),
                Text('€ $shipment', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: DottedBorder(
                color: Colors.grey.shade400,
                dashPattern: [10, 10],
                padding: EdgeInsets.all(0),
                child: Container()
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Totale', style: TextStyle(fontSize: 20)),
                Text('€ ${totalPrice + shipment}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
              ],
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: MaterialButton(
              onPressed: () {
                totalPrice != shipment ? Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentPage(data: widget.data, totalPrice: totalPrice + shipment))) : null;
              },
              height: 50,
              elevation: 0,
              splashColor: Colors.yellow[700],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
              color: Colors.yellow[800],
              child: Center(
                child: Text("Procedi al checkout", style: TextStyle(color: Colors.white, fontSize: 18),),
              ),
            ),
          ),
        ]
      )
    );
  }

  cartItem(Product product, int index, animation) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductViewPage(product: product)));
      },
      child: SlideTransition(
        position: Tween<Offset>(
            begin: const Offset(-1, 0),
            end: Offset.zero
        ).animate(animation),
        child: Container(
          margin: EdgeInsets.only(bottom: 20),
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(0, 2),
                blurRadius: 6,
              ),
            ],
          ),
          child: Row(
              children: <Widget>[
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          product.imagePath,
                          fit: BoxFit.cover,
                          height: 100,
                          width: 100,
                        ),
                      ),
                    ),
                    Positioned(
                      child: MaterialButton(
                        color: Colors.black,
                        minWidth: 25,
                        height: 25,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)
                        ),
                        onPressed: () {},
                        padding: EdgeInsets.all(5),
                        child: Center(child: Icon(Icons.delete_forever_sharp, color: Colors.white, size: 20,)),
                      ),
                    ),
                  ]
                ),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(product.description, style: TextStyle(color: Colors.orange.shade400, fontSize: 14,),),
                        SizedBox(height: 5,),
                        Text(product.name,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          '€ ${product.price}',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey.shade800,
                          ),
                        ),
                        SizedBox(height: 10),
                      ]
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MaterialButton(
                      minWidth: 10,
                      padding: EdgeInsets.all(0),
                      onPressed: () {
                        if (customer.cart.amountProductsInCart[index] > 1) {
                          setState(() {
                            customer.cart.amountProductsInCart[index]--;
                            totalPrice -= double.parse(customer.cart.productsInCart[index].price);
                          });
                        };
                      },
                      shape: CircleBorder(),
                      child: Icon(Icons.remove_circle_outline, color: Colors.grey.shade400, size: 30,),
                    ),
                    Container(child: Center(child: Text(customer.cart.amountProductsInCart[index].toString(), style: TextStyle(fontSize: 20, color: Colors.grey.shade800),),),),
                    MaterialButton(
                      padding: EdgeInsets.all(0),
                      minWidth: 10,
                      splashColor: Colors.yellow[700],
                      onPressed: () {
                        if (customer.cart.amountProductsInCart[index] < customer.cart.productsInCart[index].availability) {
                          setState(() {
                            customer.cart.amountProductsInCart[index]++;
                            totalPrice += double.parse(customer.cart.productsInCart[index].price);
                          });
                        };
                      },
                      shape: CircleBorder(),
                      child: Icon(Icons.add_circle, size: 30),
                    ),
                  ],
                ),
              ]
          ),
        ),
      ),
    );
  }

  sumTotal(double totalPrice) {

  }
}
