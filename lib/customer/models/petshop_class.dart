import 'package:justpet/customer/models/product.dart';
import 'package:justpet/customer/models/review.dart';

class PetShopClass {
  final String petshopDescription, pathImage, name, address;
  final double review;
  final List<Product> products;
  final List<Review> reviews;

  PetShopClass({
    required this.petshopDescription,
    required this.pathImage,
    required this.name,
    required this.address,
    required this.review,
    required this.products,
    required this.reviews
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
      ],
      reviews: [
        Review(description: "Descrizione 1", vote: 3.5),
        Review(description: "Descrizione 2", vote: 2.5),
        Review(description: "Descrizione 3", vote: 4),
        Review(description: "Descrizione 4", vote: 5),
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
      ],
      reviews: [
        Review(description: "Descrizione 1", vote: 3.5),
        Review(description: "Descrizione 2", vote: 5),
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
      ],
      reviews: []
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
      ],
      reviews: [
        Review(description: "Descrizione 1", vote: 5),
        Review(description: "Descrizione 2", vote: 4),
        Review(description: "Descrizione 3", vote: 2),
        Review(description: "Descrizione 4", vote: 2.5),
        Review(description: "Descrizione 5", vote: 4),
        Review(description: "Descrizione 6", vote: 3.5),
      ]
  ),
];
