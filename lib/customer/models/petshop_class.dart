import 'package:justpet/customer/models/product.dart';

class PetShopClass {
  final String petshopDescription, pathImage, name, address;
  final double review;
  final List<Product> products;
  PetShopClass({
    required this.petshopDescription,
    required this.pathImage,
    required this.name,
    required this.address,
    required this.review,
    required this.products
  });
}

List<PetShopClass> petshops = [
  PetShopClass(
      petshopDescription: "Il petshop,\nalla tua portata.",
      pathImage: 'assets/images/petshop.png',
      name: 'Pet Shop',
      address: 'Via Pet Shop',
      review: 4.5,
      products: [
        Product(
          name: "Prodotto 1",
          description: "Descrizione 1",
          imagePath: "assets/images/petshop_product.jpg",
          price: 10
        ),
        Product(
            name: "Prodotto 2",
            description: "Descrizione 2",
            imagePath: "assets/images/petshop_product.jpg",
            price: 10
        ),
        Product(
            name: "Prodotto 3",
            description: "Descrizione 3",
            imagePath: "assets/images/petshop_product.jpg",
            price: 10
        ),
        Product(
            name: "Prodotto 4",
            description: "Descrizione 4",
            imagePath: "assets/images/petshop_product.jpg",
            price: 10
        ),
        Product(
            name: "Prodotto 5",
            description: "Descrizione 5",
            imagePath: "assets/images/petshop_product.jpg",
            price: 10
        ),
        Product(
            name: "Prodotto 6",
            description: "Descrizione 6",
            imagePath: "assets/images/petshop_product.jpg",
            price: 10
        ),
      ]
  ),
  PetShopClass(
      petshopDescription: "Il petshop,\nalla tua portata.",
      pathImage: 'assets/images/petshop.png',
      name: 'Pet Shop',
      address: 'Via Pet Shop',
      review: 2.5,
      products: [
        Product(
            name: "Prodotto 1",
            description: "Descrizione 1",
            imagePath: "assets/images/petshop_product.jpg",
            price: 10
        ),
        Product(
            name: "Prodotto 2",
            description: "Descrizione 2",
            imagePath: "assets/images/petshop_product.jpg",
            price: 10
        ),
        Product(
            name: "Prodotto 3",
            description: "Descrizione 3",
            imagePath: "assets/images/petshop_product.jpg",
            price: 10
        ),
        Product(
            name: "Prodotto 4",
            description: "Descrizione 4",
            imagePath: "assets/images/petshop_product.jpg",
            price: 10
        ),
        Product(
            name: "Prodotto 5",
            description: "Descrizione 5",
            imagePath: "assets/images/petshop_product.jpg",
            price: 10
        ),
        Product(
            name: "Prodotto 6",
            description: "Descrizione 6",
            imagePath: "assets/images/petshop_product.jpg",
            price: 10
        ),
      ]
  ),
  PetShopClass(
      petshopDescription: "Il petshop,\nalla tua portata.",
      pathImage: 'assets/images/petshop.png',
      name: 'Pet Shop',
      address: 'Via Pet Shop',
      review: 3,
      products: [
        Product(
            name: "Prodotto 1",
            description: "Descrizione 1",
            imagePath: "assets/images/petshop_product.jpg",
            price: 10
        ),
        Product(
            name: "Prodotto 2",
            description: "Descrizione 2",
            imagePath: "assets/images/petshop_product.jpg",
            price: 10
        ),
        Product(
            name: "Prodotto 3",
            description: "Descrizione 3",
            imagePath: "assets/images/petshop_product.jpg",
            price: 10
        ),
        Product(
            name: "Prodotto 4",
            description: "Descrizione 4",
            imagePath: "assets/images/petshop_product.jpg",
            price: 10
        ),
        Product(
            name: "Prodotto 5",
            description: "Descrizione 5",
            imagePath: "assets/images/petshop_product.jpg",
            price: 10
        ),
        Product(
            name: "Prodotto 6",
            description: "Descrizione 6",
            imagePath: "assets/images/petshop_product.jpg",
            price: 10
        ),
      ]
  ),
  PetShopClass(
      petshopDescription: "Il petshop,\nalla tua portata.",
      pathImage: 'assets/images/petshop.png',
      name: 'Pet Shop',
      address: 'Via Pet Shop',
      review: 3,
      products: [
        Product(
            name: "Prodotto 1",
            description: "Descrizione 1",
            imagePath: "assets/images/petshop_product.jpg",
            price: 10
        ),
        Product(
            name: "Prodotto 2",
            description: "Descrizione 2",
            imagePath: "assets/images/petshop_product.jpg",
            price: 10
        ),
        Product(
            name: "Prodotto 3",
            description: "Descrizione 3",
            imagePath: "assets/images/petshop_product.jpg",
            price: 10
        ),
        Product(
            name: "Prodotto 4",
            description: "Descrizione 4",
            imagePath: "assets/images/petshop_product.jpg",
            price: 10
        ),
        Product(
            name: "Prodotto 5",
            description: "Descrizione 5",
            imagePath: "assets/images/petshop_product.jpg",
            price: 10
        ),
        Product(
            name: "Prodotto 6",
            description: "Descrizione 6",
            imagePath: "assets/images/petshop_product.jpg",
            price: 10
        ),
      ]
  ),
];
