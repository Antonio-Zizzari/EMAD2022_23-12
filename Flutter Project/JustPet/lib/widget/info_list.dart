import 'package:flutter/material.dart';
import 'package:justpet/pets_visits.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../pet_class.dart';
import 'list_item_pet.dart';

class InfoList extends StatelessWidget {
  final Pets data;

  const InfoList({Key? key, required this.data}) : super(key: key);

  // @override
  // State<InfoList> createState() => _InfoListState();
// }

//class _InfoListState extends State<InfoList> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: TabBar(
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
                Tab(text: "Storico Medico"),
                Tab(text: "Storico Visite"),
              ],
            ),
          ),
          Expanded(
            flex: 18,
            child: TabBarView(
              children: [
                ListItemPet(data: data),
                PetsVisits(data: data)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
