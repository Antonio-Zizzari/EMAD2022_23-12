class PetShopClass {
  final String pathImage, name, address;
  final double review;
  PetShopClass({
    required this.pathImage,
    required this.name,
    required this.address,
    required this.review
  });
}

List<PetShopClass> petshops = [
  PetShopClass(
      pathImage: 'assets/images/petshop.png',
      name: 'Pet Shop',
      address: 'Via Pet Shop',
      review: 4.5
  ),
  PetShopClass(
      pathImage: 'assets/images/petshop.png',
      name: 'Pet Shop',
      address: 'Via Pet Shop',
      review: 2.5
  ),
  PetShopClass(
      pathImage: 'assets/images/petshop.png',
      name: 'Pet Shop',
      address: 'Via Pet Shop',
      review: 3
  ),
  PetShopClass(
      pathImage: 'assets/images/petshop.png',
      name: 'Pet Shop',
      address: 'Via Pet Shop',
      review: 3
  ),
];
