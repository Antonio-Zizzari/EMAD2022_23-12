import 'package:justpet/customer/models/product.dart';

import 'cart_class.dart';

class CustomerClass {
  final String name, surname, username, address;
  final CartClass cart;

  CustomerClass({
    required this.name,
    required this.surname,
    required this.username,
    required this.address,
    required this.cart,
  });
}

CustomerClass customer =
    CustomerClass(
      name: "Vittorio",
      surname: "Giglio",
      username: 'vitgiglio11',
      address: 'Via Roma 127',
      cart: CartClass(
        productsInCart: [
          Product(
              name: "Prodotto 1",
              description: "Descrizione 1",
              imagePath: "assets/images/petshop_product.jpg",
              price: 10.toStringAsFixed(2),
              availability: 8
          ),
          Product(
              name: "Prodotto 2",
              description: "Descrizione 2",
              imagePath: "assets/images/petshop_product.jpg",
              price: 10.toStringAsFixed(2),
              availability: 8
          ),
          Product(
              name: "Prodotto 3",
              description: "Descrizione 3",
              imagePath: "assets/images/petshop_product.jpg",
              price: 10.toStringAsFixed(2),
              availability: 12
          ),
          Product(
              name: "Prodotto 4",
              description: "Descrizione 4",
              imagePath: "assets/images/petshop_product.jpg",
              price: 10.toStringAsFixed(2),
              availability: 5
          ),
        ],
        amountProductsInCart: [
          2,
          1,
          3,
          1
        ]
      ),
    );