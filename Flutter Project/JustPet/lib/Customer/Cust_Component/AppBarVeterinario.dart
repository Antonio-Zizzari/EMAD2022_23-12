import 'package:flutter/material.dart';

class AppBarVeterinario extends StatelessWidget implements PreferredSizeWidget{

  @override
  Size get preferredSize => const Size.fromHeight(60);

  const AppBarVeterinario({
    Key? key,
    required this.title,
    required this.showSearch,
  }) : super(key: key);

  final String title;
  final bool showSearch;

  @override
  Widget build(BuildContext context) {

    return AppBar(
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(
        color: Colors.black, //change your color here
      ),
      elevation: 0.0,
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Row(
            children: [
              if(showSearch) InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.search,
                  size: 26.0,
                ),
              ),
              SizedBox(width: 20,),
              InkWell(
                onTap: () {},
                child: const Icon(Icons.more_vert),
              )
            ],
          ),
        ),
        /*Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: InkWell(
              onTap: () {},
              child: const Icon(
                Icons.search,
                size: 26.0,
              ),
            )),
        Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: InkWell(
              onTap: () {},
              child: const Icon(Icons.more_vert),
            )),*/
      ],
    );
  }
}
