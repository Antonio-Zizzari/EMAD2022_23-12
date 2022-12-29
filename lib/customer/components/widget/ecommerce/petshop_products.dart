import 'package:justpet/customer/components/widget/ecommerce/petshop_products_cart.dart';
import 'package:justpet/customer/components/widget/ecommerce/petshop_products_home.dart';
import 'package:justpet/customer/components/widget/ecommerce/petshop_products_search.dart';

import 'package:flutter/material.dart';
import '../../../models/petshop_class.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class PetShopProductsPage extends StatelessWidget {
  final PetShopClass data;

  const PetShopProductsPage({ Key? key, required this.data}) : super(key: key);

//   @override
//   _PetShopProductsPageState createState() => _PetShopProductsPageState();
// }
//
// class _PetShopProductsPageState extends State<PetShopProductsPage> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: TabBarView(
          children: [
            PetShopSearch(),
            PetShopHome(data: data),
            PetShopCart(data: data),
          ],
        ),
        bottomNavigationBar: TabBar(
          labelColor: Colors.black,
          unselectedLabelColor: Colors.black26,
          indicator: MaterialIndicator(
            horizontalPadding: 30,
            topLeftRadius: 20,
            topRightRadius: 20,
            color: Colors.orangeAccent,
            paintingStyle: PaintingStyle.fill,
          ),
          tabs: [
            Tab(text: "Cerca", icon: Icon(Icons.search_outlined)),
            Tab(text: "Home", icon: Icon(Icons.home)),
            Tab(text: "Carrello", icon: Icon(Icons.shopping_cart)),
          ],
        ),
      ),
    );
  }
}
