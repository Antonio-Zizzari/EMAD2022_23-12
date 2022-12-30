import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:justpet/global/config.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:collection';

import 'luiss_class.dart';



Future LuisQuery(String QUERY) async {
  final response = await http
      .get(Uri.parse(LUIS_LINK_QUERY+QUERY));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return jsonDecode(response.body);

  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load http request');
  }
}

String JsonFormatter(json){
  return JsonEncoder.withIndent('  ').convert(json);
}

LuissClass Return_Sorted_LUIS_List(jsonData){

  //List elencoCani=jsonData['prediction']['intents'].keys.toList();
  //print(jsonData['prediction']['intents']);
  List list1=List.filled(0, null, growable: true);
  List list2=List.filled(0, null, growable: true);

  for (MapEntry<String, dynamic> entry in jsonData['prediction']['intents'].entries) {
    list1.add(entry.key);
    list2.add(entry.value['score']);
  }

  return LuissClass(list1, list2);

}


LuissClass GetChainSumSort(LuissClass lista1,LuissClass lista2){

  List risultatoRazza=List.filled(0, null, growable: true);
  List risultatoScore=List.filled(0, null, growable: true);

  List lista1Razza=lista1.getRazza();
  List lista1Score=lista1.getScore();
  List lista2Razza=lista2.getRazza();
  List lista2Score=lista2.getScore();
  int i=0;


  while(lista2Razza.isNotEmpty || (i<lista1Razza.length)){

    if (lista2Razza.contains(lista1Razza.elementAt(i))) {
      //prendo l'index della seconda lista
      int index = lista2Razza.indexOf(lista1Razza.elementAt(i));

      double media=(lista1Score.elementAt(i)+lista2Score.elementAt(index))/2;

      risultatoRazza.add(lista1Razza.elementAt(i));
      risultatoScore.add(media);

      lista2Razza.removeAt(index);
      lista2Score.removeAt(index);

    }else{
      risultatoRazza.add(lista1Razza.elementAt(i));
      risultatoScore.add(lista1Score.elementAt(i));
    }

    i++;
  }
  while(lista2Razza.isNotEmpty){
    risultatoRazza.add(lista1Razza.elementAt(0));
    risultatoScore.add(lista1Score.elementAt(0));
    lista2Razza.removeAt(0);
    lista2Score.removeAt(0);
  }

/*  print("Liste con medie");
  print(risultatoRazza);
  print(risultatoScore);*/

  Map<dynamic, dynamic> map = Map.fromIterables(risultatoRazza, risultatoScore);
  List<MapEntry<dynamic, dynamic>> listaTemp = map.entries.toList();

  listaTemp.sort((a, b) => b.value.compareTo(a.value));

  risultatoRazza.removeRange(0, risultatoRazza.length);
  risultatoScore.removeRange(0, risultatoScore.length);
/*
  print("Lista vuota");
  print(risultatoRazza);
  print(risultatoScore);*/

  for (MapEntry<dynamic, dynamic> entry in listaTemp) {
    risultatoRazza.add(entry.key);
    risultatoScore.add(entry.value);
  }
/*  print("Lista ordinata");
  print(risultatoRazza);
  print(risultatoScore);*/

  return LuissClass(risultatoRazza, risultatoScore);

}

/*
//ESEMPIO D'USO SU FLUTTER 1
onPressed: () async {

            print("the response is:\n");
            LuissClass response=GetChainSumSort(Return_Sorted_LUIS_List(await LuisQuery("Voglio un cane giovane")), Return_Sorted_LUIS_List(await LuisQuery("voglio i bambini al sicuro")));

            print(response.razza);
            print(response.score);
          }
}

//ESEMPIO D'USO SU FLUTTER 2
onPressed: () async {

            print("the response is:\n");
            LuissClass response=Return_Sorted_LUIS_List(await LuisQuery("Voglio un cane giovane"));
            print(response.razza);
            print(response.score);
          }
}


 */

