import 'package:flutter/material.dart';

class PetShopCart extends StatefulWidget {
  const PetShopCart({Key? key}) : super(key: key);

  @override
  State<PetShopCart> createState() => _PetShopCartState();
}

class _PetShopCartState extends State<PetShopCart> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("CARRELLO"));
  }
}
