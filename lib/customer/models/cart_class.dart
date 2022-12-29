import 'package:justpet/customer/models/product_class.dart';

class CartClass{
  //Lista di prodotti con le quantità da acquistare
  final List<Product> productsInCart;
  final List<int> amountProductsInCart;

  CartClass({
    required this.productsInCart,
    required this.amountProductsInCart
  });
}