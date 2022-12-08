import 'package:justpet/customer/models/product.dart';
import 'package:justpet/customer/models/review.dart';
import 'package:collection/collection.dart';

class PetShopClass {
  final String petshopDescription, pathImage, name, address;
  final List<Review> reviews;
  final List<Product> products;

  PetShopClass({
    required this.petshopDescription,
    required this.pathImage,
    required this.name,
    required this.address,
    required this.products,
    required this.reviews
  });
}

String text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.";

List<PetShopClass> petshops = [
  PetShopClass(
      petshopDescription: "Il petshop,\nalla tua portata.",
      pathImage: 'assets/images/petshop.png',
      name: 'Pet Shop',
      address: 'Via Pet Shop',
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
        Review(description: text, vote: 3.5, date: DateTime.utc(2022, 11, 8)),
        Review(description: text, vote: 2.5, date: DateTime.utc(2022, 8, 8)),
        Review(description: text, vote: 4, date: DateTime.utc(2021, 7, 8)),
        Review(description: text, vote: 5, date: DateTime.utc(2019, 3, 3)),
      ]
  ),
  PetShopClass(
      petshopDescription: "Il petshop,\nalla tua portata.",
      pathImage: 'assets/images/petshop.png',
      name: 'Pet Shop',
      address: 'Via Pet Shop',
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
        Review(description: text, vote: 3.5, date: DateTime.utc(2022, 11, 8)),
        Review(description: text, vote: 5, date: DateTime.utc(2022, 3,5)),
      ]
  ),
  PetShopClass(
      petshopDescription: "Il petshop,\nalla tua portata.",
      pathImage: 'assets/images/petshop.png',
      name: 'Pet Shop',
      address: 'Via Pet Shop',
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
        Review(description: text, vote: 3.5, date: DateTime.utc(2022, 11, 8)),
        Review(description: text, vote: 2.5, date: DateTime.utc(2022, 8, 8)),
        Review(description: text, vote: 4, date: DateTime.utc(2021, 7, 8)),
        Review(description: text, vote: 5, date: DateTime.utc(2019, 3, 3)),
        Review(description: text, vote: 5, date: DateTime.utc(2018, 5, 21)),
        Review(description: text, vote: 5, date: DateTime.utc(2018, 1, 18)),
        Review(description: text, vote: 3.5, date: DateTime.utc(2022, 11, 8)),
        Review(description: text, vote: 2.5, date: DateTime.utc(2022, 8, 8)),
        Review(description: text, vote: 4, date: DateTime.utc(2021, 7, 8)),
        Review(description: text, vote: 5, date: DateTime.utc(2019, 3, 3)),
        Review(description: text, vote: 5, date: DateTime.utc(2018, 5, 21)),
        Review(description: text, vote: 5, date: DateTime.utc(2018, 1, 18)),
        Review(description: text, vote: 4, date: DateTime.utc(2022, 11, 8)),
        Review(description: text, vote: 5, date: DateTime.utc(2022, 8, 8)),
        Review(description: text, vote: 4, date: DateTime.utc(2021, 7, 8)),
        Review(description: text, vote: 5, date: DateTime.utc(2019, 3, 3)),
        Review(description: text, vote: 5, date: DateTime.utc(2018, 5, 21)),
        Review(description: text, vote: 5, date: DateTime.utc(2018, 1, 18)),
      ]
  ),
];

double getAverage(List<Review> reviews){
  double review = 0;
  for(int i=0; i < reviews.length; i++){
    review += reviews[i].vote;
  }
  return review == 0 ? 0 : double.parse((review / reviews.length).toStringAsFixed(1));
}
